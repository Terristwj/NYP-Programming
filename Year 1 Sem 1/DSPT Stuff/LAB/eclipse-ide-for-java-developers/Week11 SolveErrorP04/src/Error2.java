// 	This program no syntax error.
//	It has 1 runtime error and 1 logic error
//	Find and resolve the errors.

/*
 * Error (Line 19)	: Scanner sc = new Scanner("System.in");
 * Error type		: Run-time
 * Corrected code	: Scanner sc = new Scanner(System.in);
 * 
 * Error (Line 31)	: average = (x + y) / 2;
 * Error type		: Logic
 * Corrected code	: average = (x + y) / 2.0;
*/
import java.util.Scanner;

public class Error2 {

	public static void main(String []args) {
		Scanner sc = new Scanner(System.in);
		
		int x = 0;
		int y = 0;
		double average=0;
		
		System.out.print("Enter 1st number: ");
		x = sc.nextInt();
		
		System.out.print("Enter 2nd number: ");
		y = sc.nextInt();

		average = (x + y) / 2.0;
		System.out.println("The average is " + average);
		
		sc.close();
	}

}
