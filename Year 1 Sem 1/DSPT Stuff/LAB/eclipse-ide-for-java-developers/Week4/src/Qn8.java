import java.util.Scanner;
public class Qn8 {
	public static void main (String[] args) 
	{
		Scanner sc = new Scanner(System.in);
		
		double degreeF;
		System.out.println("Enter value of Degree Fahrenheut: ");
		degreeF= sc.nextDouble();
		
		double degreeC=5*(degreeF-32)/9;
		
		System.out.println(degreeF+" degree Fahrenheut is equal to "+degreeC+" degree Celcius.");
	}
}