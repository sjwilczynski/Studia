import dbm
from gi.repository import Gtk

class MainFrame(Gtk.Window):
	
	def __init__(self):
		Gtk.Window.__init__(self)
		self.button = Gtk.Button(label="Click Here")
		self.connect("delete-event", Gtk.main_quit)       
		self.button.connect("clicked", self.on_button_clicked)
		self.add(self.button)
		self.show_all()

class Friend:
	
	def __init__(self, ID, im, nazw, email, ostWysw, tel):
		self.ID = ID 		
		self.imie = im
		self.nazwisko = nazw
		self.email = email
		self.ostatnieWysw = ostWysw
		self.telefon = str(tel)

	def store(self):
		db[str(self.ID)+'imie'] = self.imie
		db[str(self.ID)+'nazwisko'] = self.nazwisko
		db[str(self.ID)+'email'] = self.email
		db[str(self.ID)+'ostatnieWysw'] = self.ostatnieWysw
		db[str(self.ID)+'telefon'] = self.telefon

	def remove(self):
		del db[str(self.ID)+'imie']
		del db[str(self.ID)+'nazwisko']
		del db[str(self.ID)+'email']
		del db[str(self.ID)+'ostatnieWysw']
		del db[str(self.ID)+'telefon']

	def update(self, im, nazw, email, ostWysw, tel):
		del db[str(self.ID)+'imie']
		del db[str(self.ID)+'nazwisko']
		del db[str(self.ID)+'email']
		del db[str(self.ID)+'ostatnieWysw']
		del db[str(self.ID)+'telefon']
		db[str(self.ID)+'imie'] = self.imie
		db[str(self.ID)+'nazwisko'] = self.nazwisko
		db[str(self.ID)+'email'] = self.email
		db[str(self.ID)+'ostatnieWysw'] = self.ostatnieWysw
		db[str(self.ID)+'telefon'] = self.telefon

def update(ID, im, nazw, email, ostWysw, tel):
		del db[str(ID)+'imie']
		del db[str(ID)+'nazwisko']
		del db[str(ID)+'email']
		del db[str(ID)+'ostatnieWysw']
		del db[str(ID)+'telefon']
		db[str(ID)+'imie'] = im
		db[str(ID)+'nazwisko'] = nazw
		db[str(ID)+'email'] = email
		db[str(ID)+'ostatnieWysw'] = ostWysw
		db[str(ID)+'telefon'] = str(tel)


r = MainFrame()
Gtk.main()


# Open database, creating it if necessary.
db = dbm.open('database', 'c')
"""
ID = 0;

print (db.get('0imie', 'puste'))

friend = Friend(ID, "a", "b", "c", "d", 123)
friend.store()
friend.remove()
friend.store()"""
update(0, "d", "b", "c", "d", 123)
# Close when done.
db.close()
