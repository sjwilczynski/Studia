import urllib
import re
from HTMLParser import HTMLParser


class MyHtmlP(HTMLParser):
    def handle_starttag(self,tag,attrs):
        L = []
        if tag == "a":
            for(atr,val) in attrs:
                if atr == 'href':  self.s += val + " "
        return L
    def feed(self,data):
        self.s = " "
        HTMLParser.feed(self,data)

def f(adres):
    strona = urllib.urlopen(adres)
    tekst = strona.read()
    strona.close()
    automat = re.compile("Python")
    return len([ x.start() for x in automat.finditer(tekst)])


def znajdzlink(adres):
    strona = urllib.urlopen(adres)
    tekst = strona.read()
    mp = MyHtmlP()
    mp.feed(tekst)
    strona.close()
    link = "([a-zA-Z]+\.)*[a-zA-Z]*"
    #print tekst
    automat = re.compile("http://"+ link)
    return [ url.group() for url in automat.finditer(mp.s)]

class WWWiter():
    def __init__(self,link,f):
        self.f = f
        self.L = [(link,8)]
        self.k = 0
    def __next__(self):
        if(len(self.L) == 0):
            raise StopIteration
        if(self.L[0][1] > 0):
            for url in znajdzlink(self.L[0][0]):
                self.L.append((url,(self.L[0][1]-1)))
        self.k += f(self.L[0][0])
        self.L.pop(0)
        print "znaleziono do tej pory %d wystapien" %self.k

class WWWCol():
    def __init__(self,link,f):
        self.link = link
        self.f = f
    def __iter__(self):
        return WWWiter(self.link,self.f)

#print f("https://www.ii.uni.wroc.pl/~marcinm/dyd/python/")
#print znajdzlink("https://www.ii.uni.wroc.pl/~marcinm/dyd/python/")

x = WWWiter("https://www.python.org/",f)
for i in range (1,10):
    x.__next__()


