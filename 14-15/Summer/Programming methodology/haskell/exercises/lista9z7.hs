newtype Fset a = Fset(a->Bool)

empty::Fset a
empty = Fset(\x -> False)

singleton::Ord a => a -> Fset a
singleton y = Fset(\x -> x == y)

fromList::Ord a => [a] -> Fset a
fromList xs = Fset(\x -> x `elem` xs)

member:: Ord a => a -> Fset a -> Bool
member x (Fset set) = set x
