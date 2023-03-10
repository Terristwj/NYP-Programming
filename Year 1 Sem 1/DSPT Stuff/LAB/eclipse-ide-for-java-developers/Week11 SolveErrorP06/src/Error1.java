//	Run this program.
//	Spot and solve the logic error.
//	This is a very common mistake. 
//	It is easy to spot here because the program is small.
/*
 * Error (Line 22)	: if (num1 > num2);
 * Error type		: Logic
 * Corrected code	: if (num1 > num2)
*/
import java.util.Scanner;
public class Error1 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);   
		int num1, num2;
		
		System.out.print("Enter num1: ");
		num1 = sc.nextInt();
		System.out.print("Enter num2: ");
		num2 = sc.nextInt();
		
		if (num1 > num2)
			System.out.println("Num 1 is greater than num2");
		
		sc.close();
	}

}
