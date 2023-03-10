package Package2;
import Package1.ClassA;

public class ClassC {
	public static void main(String[] args) 
	{
		ClassA ca = new ClassA();
		System.out.println("a : " + ca.a);
		System.out.println("b : " + ca.b);
		System.out.println("c : " + ca.c);
		System.out.println("d : " + ca.d);
	}
}