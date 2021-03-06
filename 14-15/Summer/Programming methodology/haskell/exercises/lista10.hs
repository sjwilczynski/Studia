{-# LANGUAGE FlexibleInstances #-}
import Data.List

cross :: (a -> c, b -> d) -> (a, b) -> (c, d)
cross (f, g) = pair (f . fst, g . snd)

pair :: (a -> b, a -> c) -> a -> (b, c)
pair (f, g) x = (f x, g x)

--zadanie1
nat2 :: [(Integer,Integer)]
nat2 = [(x,n-x)| n <- [0..], x <- [0..n]]


--generowanie liczb pierwszych
primes :: [Integer]
primes = 2:[n| n <- [3..], all(\x -> n `mod` x /= 0) $ takeWhile(\x -> x*x <= n) primes] 

prime :: [Integer]
prime = map head ( iterate( \(x:xs) -> [y| y <- xs, y `mod` x /= 0] )  [2..]) 

--zadanie2

halve :: [a] -> ([a],[a])
merge :: Ord a => ([a],[a]) -> [a]
msort :: Ord a => [a] -> [a]

halve xs = (take n xs, drop n xs) 
	where n = length xs `div` 2

merge (xs,[]) = xs
merge ([],xs) = xs
merge ( (x:xs),(y:ys) )  
	| x <= y = x:merge( xs,(y:ys) )
	| otherwise = y:merge ( (x:xs),ys )

msort [] = []
msort [x] = [x]
msort xs = merge.cross(msort,msort).halve $ xs

--zadanie 3
merge_u :: Ord a => [a] -> [a] -> [a]

merge_u xs [] = xs
merge_u [] xs = xs
merge_u (x:xs) (y:ys)   
	| x < y = x:merge_u xs (y:ys) 
	| x == y = merge_u xs (y:ys) 
	| otherwise = y:merge_u (x:xs) ys

d235 :: [Integer]
--d235 = 1:foldl1 merge_u [map (n*) d235| n <- [2,3,5]]  
d235 = 1:foldl merge_u [] [map (n*) d235| n <- [2,3,5]]

--zadanie 4

msortn :: Ord a => [a] -> Int -> [a]

msortn [] _ = []
msortn [x] 1 = [x]
msortn xs n = merge( msortn nl k, msortn (drop k nl) (n-k))
	where nl = take n xs
	      k = n `div` 2 
msort2 :: Ord a => [a] -> [a]
msort2 xs = msortn xs (length xs)

--zadanie 5
--aksjomaty:
--dla kazdego a :: a. e *** a = a
-- dla kazdego a :: a. a *** e = a
--dla kazdego a, b, c :: a. (a *** b) *** c = a *** (b *** c)

class Monoid a where
	(***) :: a -> a -> a
	e :: a
	infixl 6 ***

(^^^) :: Monoid a => a -> Integer -> a
infixr 7 ^^^ 
a ^^^ 0 = e
a ^^^ n
	| n < 0 = error"Negative exponent"
	| n `mod` 2 == 0 = b***b
	| otherwise = a***b***b
	where b = a ^^^ (n `div` 2)

instance Monoid Integer where
	a***b = a*b `mod` 9876543210
	e = 1
instance Monoid Int where
	a***b = a+b
	e = 0
data Mtx2x2 = Mtx2x2 Integer Integer Integer Integer

instance Monoid Mtx2x2  where
	(Mtx2x2 a11 a12 a21 a22)***(Mtx2x2 b11 b12 b21 b22) = Mtx2x2 (a11*b11+a12*b21) (a11*b21+a12*b22) (a21*b11+a22*b21) (a21*b12+a22*b22)
	e = Mtx2x2 1 0 0 1

mtx12 :: Mtx2x2 -> Integer
mtx12 (Mtx2x2 a11 a12 a21 a22) = a12

fib :: Integer -> Integer
fib n = mtx12 (x ^^^ n)
  where x = Mtx2x2 0 1 1 1

























