def rozklad(n):
	k=1
	while(k*k < n):
		k+=1
	L = sito(k)
	print(roz(n,L))
def sito(k):
	L = [2]
	for i in range(3,k,2):
		if(isPrime(i)):
			L.append(i)
	return L
def isPrime(n):
	if(n < 2):
		 return False
	if(n == 2):
		 return True
	if(n % 2 == 0):
		 return False
	for i in range(3,n,2):
		if(i*i > n):
			break
		if(n%i == 0):
			return False
	return True

def roz(n,L):
	res = []
	for i in range(len(L)):
		k = 0
		if (L[i] > n):
			break
		while(n%L[i] == 0):
			k = k+1
			n = n/L[i]
		if(k!=0):
			res.append((L[i],k))
	return res	
		
print rozklad(121264)

				
		


