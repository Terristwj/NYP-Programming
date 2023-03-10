import java.util.InputMismatchException;
import java.util.Scanner;

public class Qn3 {
	public static void main(String[] args) 
	{
		Scanner sc = new Scanner(System.in);
		
		try
		{
			System.out.print("Enter an integer numerator: ");
			int numerator = sc.nextInt();
			
			System.out.print("Enter an integer denominator: ");
			int denominator = sc.nextInt();
			
			int result = numerator / denominator;
			
			System.out.printf("Result of %d / %d is %d\n", numerator, denominator, result);
		}
		catch(InputMismatchException e)
		{
			System.out.println();
			System.out.println("HEY. KEY IN A PROPER NUMBER");
		}
		catch (ArithmeticException e)
		{
			System.out.println();
			System.out.println("Can't be divided by 0, FeelsBadMan");
		}
		finally
		{
			System.out.println();
			System.out.println("Cleaning up resources...");
		}
	}
}
