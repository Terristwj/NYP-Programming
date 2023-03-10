import java.util.Scanner;
public class Qn5 {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		double x;
		
		System.out.println("Enter value of x: ");
		x = sc.nextDouble();
		
		double y;
		y=1.0/x;
		
		double product= x*y;
		
		double productDeduct1= product-1;
		
		System.out.println("Value of x: " + x);
		System.out.println("Value of y: " + y);
		System.out.println("Value of product of x and y: "+ product);
		System.out.println("Value of product of x and y, deducted by 1: "+productDeduct1);
	}
}
