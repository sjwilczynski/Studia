package Pakiet;

public class Logarytm extends Operator2 {

	public Logarytm(Wyrazenie p, Wyrazenie q)
	{
		super(p,q);
	}
	/** metoda oblicza logarytm o podstawie z jednego wyrazenie z drugiego wyrazenia */
	public double oblicz() 
	{
		return Math.log(w2.oblicz()) / Math.log(w1.oblicz()) ;
	}
	public String toString()
	{
		return "log o podstawie " + w1.toString() + " z " + w2.toString();
	}
}
