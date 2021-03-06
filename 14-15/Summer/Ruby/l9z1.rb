class Funkcja
	def initialize(blok)
	@blok = blok
	end
	def value(x)
	@blok.call(x)
	end
	def poch(x)
	a = self.value(x)
	e = 0.001
	b = self.value(x+e)
	c = self.value(x-e)
	return ((b-a)/e + (a-c)/e)/2
	end
	def pole(a,b)
	n = 1000.0
	s = 0
	d = b - a 
	s += self.value(a) + self.value(b)
	for i in (1..n-1)
	s += 2*self.value(a+i*(b-a)/n)
	end
	return s *= (b-a)/(2*n)
	end
	def zerowe(a,b,e)
	x = a
	l = []
	while(x<b)
	l += [x] if self.value(x).abs < e
	x += e
	end
	return l if !l.empty?
	end
end

f = Funkcja.new(proc {|x| x*x*x})
puts f.value(0)
puts f.poch(5)
puts f.pole(0,1)
puts f.zerowe(0,3,0.001)
