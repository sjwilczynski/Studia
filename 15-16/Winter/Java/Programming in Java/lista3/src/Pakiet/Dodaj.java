package Pakiet;

public class Dodaj extends Operator2 {

	public Dodaj(Wyrazenie p, Wyrazenie q)
	{
		super(p,q);
	}
	/** metoda oblicza sume wyrazen */
	public double oblicz() 
	{
		return w1.oblicz()+w2.oblicz();
	}
	public String toString()
	{
		return "("+w1.toString() + " + " + w2.toString()+")";
	}
}
