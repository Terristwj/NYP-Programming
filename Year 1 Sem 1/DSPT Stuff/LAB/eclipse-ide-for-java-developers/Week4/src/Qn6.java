import java.util.Scanner;
public class Qn6 {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		Double x;
		
		System.out.printf("Enter value of x: ");
		x = sc.nextDouble();
		
		double y;
		y=1.0/x;
		
		double product= x*y;
		
		double productDeduct1= product-1;
		
		System.out.printf("\nValue of x: %3f", x);
		System.out.printf("\nValue of y: %.3f", y);
		System.out.printf("\nValue of product of x and y: %.3f", product);
		System.out.printf("\nValue of product of x and y, deducted by 1: %.3f", productDeduct1);
	}
}