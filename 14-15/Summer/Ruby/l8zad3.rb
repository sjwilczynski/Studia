class Jawna
	def initialize(slowo)
		@slowo = slowo
	end
	def slowo
		@slowo
	end
	def to_s
		@slowo.to_s
	end
	def zaszyfruj(klucz)
		s = ""
		for i in (0..@slowo.size-1)
		s += (@slowo[i].ord+klucz).chr
		end	
		return Zaszyfrowane.new(s)
	end
end
class Zaszyfrowane
	def initialize(slowo)
		@slowo = slowo
	end
	def slowo
		@slowo
	end
	def to_s
		@slowo.to_s
	end
	def odszyfruj(klucz)
		s = ""
		for i in (0..@slowo.size-1)
		s += (@slowo[i].ord-klucz).chr
		end	
		return Jawna.new(s)
	end
end
s = Jawna.new("Ala ma kota")
r =  s.zaszyfruj(3)
puts r.slowo
puts r.odszyfruj(3).to_s
puts r.odszyfruj(1).to_s
