class Elem
	def initialize(p,n,v)
		@prev = p
		@nast = n
		@val = v
	end
	def nast
		@nast
	end
	def setn(i)
		@nast = i
	end
	def prev
		 @prev
	end
	def setp(i)
		@prev = i
	end
	def val
		@val
	end
	def setv(i)
		@val = i
	end
end

class Kolekcja
	def initialize()
		@first = nil
	end
	def get(i)
		f = @first
		return "Error:Wrong index" if i > self.length
		while(i != 1)
			f = f.nast
			i -= 1
		end
		return f.val
	end
	def put
		f = @first
		print '['
		while f != nil
			print f.val,' '
			f = f.nast
		end
		print ']'
		puts
	end
	def length
		f = @first
		l = 0
		while(f != nil)
			l += 1
			f = f.nast
		end		
		return l
	end
	def add(i)
		f = @first
		p = nil
		if(f == nil)
			@first = Elem.new(nil,nil,i)
			return
		end
		if(i < f.val)
			@first = Elem.new(nil,f,i)
			return
		end
		while (f != nil && i > f.val)
			p = f
			f = f.nast
		end
		a = Elem.new(p,f,i)
		p.setn(a) if p!=nil
		f.setp(a) if f!=nil
	end
end
class Wyszukiwanie
	def bin(e,kol)
		return false if e < kol.get(1)
		return false if e > kol.get(kol.length)
		b(e,kol,1,kol.length)
	end
	def b(e,kol,p,k)
		s = (p+k)/2
		x = kol.get(s)
		return true if x == e
		if x < e
			return false if s == k
			return b(e,kol,s+1,k)
		end
		return false if s == p
		return b(e,kol,p,s-1)
	end
	def int(e,kol)
		return false if e < kol.get(1)
		return false if e > kol.get(kol.length)
		i(e,kol,1,kol.length)
	end
	def i(e,kol,p,k)
		a = kol.get(p)
		b = kol.get(k)
		s = p+((e-a)*(k-p))/(b-a) if b != a
		s = k if b == a
		x = kol.get(s)
		return true if x == e
		if x < e
			return false if x < a
			return i(e,kol,s+1,k)
		end
		return false if x > b
		return i(e,kol,p,s-1)
	end

end
a = Kolekcja.new()
puts a.length
a.add(5)
a.add(3)
a.add(7)
a.add(10)
a.add(6)
a.put
w = Wyszukiwanie.new()
for i in (1..10)
	puts w.bin(i,a)
end
puts 
for i in (1..10)
	puts w.int(i,a)
end
puts 
x = Kolekcja.new()
for i in (1..100)
	x.add(2*i+1)
end


for i in (1..100)
	print i,"->",w.int(i,x),"\n"
end


