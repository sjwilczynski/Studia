package Pakiet;

public class Modulo extends Operator2 {

	public Modulo(Wyrazenie p, Wyrazenie q)
	{
		super(p,q);
	}
	/** metoda oblicza jedno wyrazenie modulo drugie wyrazenie */
	public double oblicz() 
	{
		return w1.oblicz()%w2.oblicz();
	}
	public String toString()
	{
		return w1.toString() + "%" + w2.toString();
	}
}
