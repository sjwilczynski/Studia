package Pakiet;

public class Main 
{
	public static void main(String[] args) 
	{
		/*
		Zbior Z = new Zbior(20);
		Z.wstaw(new Para("A",1));
		Z.wstaw(new Para("B",2));
		Z.wstaw(new Para("C",3));
		Z.wstaw(new Para("D",4));
		Z.wstaw(new Para("E",5));
		Z.wstaw(new Para("F",6));
		Z.wstaw(new Para("G",7));
		Z.wstaw(new Para("H",8));
		System.out.println( Z.szukaj("B").toString() );
		Z.wstaw(new Para("A",3));
		System.out.println( Z.szukaj("A").toString() );
		Z.ustal(new Para("A",2));
		System.out.println( Z.szukaj("A").toString() );
		System.out.println( Z.czytaj("H") );
		System.out.println( Z.ile() );
		//System.out.println( Z.szukaj("I").toString() );
		Z.czysc();
		//System.out.println( Z.szukaj("B").toString() );
		 */
		Zmienna.Zmienne.wstaw(new Para("x",1.68));
		Zmienna.Zmienne.wstaw(new Para("y",4));
		//Wyrazenie w = new Odwrotnosc(new Zmienna("x"));
		//System.out.println(w.toString());
		//System.out.println(w.oblicz());
		/*
		 * 3+5
			2+x*7
			(3*11-1)/(7+5)
			arctan(((x+13)*x)/2)	
			pow(2,5)+x*log(2,y)
		 */
		Wyrazenie[] W = new Wyrazenie[5];
		W[0] = new Dodaj(new Liczba(3), new Liczba(5));
		W[1] = new Dodaj( new Liczba(2), new Pomnoz( new Zmienna("x"), new Liczba(7)));
		W[2] = new Dziel(
				new Odejmij(new Pomnoz(new Liczba(3),new Liczba(11)),new Liczba(1)),
				new Dodaj(new Liczba(7),new Liczba(5)));
		W[3]= new Arctan(
				new Dziel(
						new Pomnoz(
								new Dodaj(new Zmienna("x"),new Liczba(13)),
								new Zmienna("x")),
								new Liczba(2)));
		W[4] = new Dodaj(
				new DoPotegi(new Liczba(2),new Liczba(5)),
				new Pomnoz(
						new Zmienna("x"),
						new Logarytm(new Liczba(2),new Zmienna("y")
								)));


		for(int i = 0; i < 5; i++)
		{
			System.out.println(W[i].toString());
			System.out.println(W[i].oblicz());
			System.out.println();
		}
	}

}
