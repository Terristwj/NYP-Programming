//	Mouse over to read the error messages.
//	Resolve all the syntax errors.
/*
 * Error (Line 20)	: 
 * Error type		: Logic
 * Corrected code	: import java.util.Scanner;
 *
 * Error (Line 27)	: System.out.print(Enter an integer:);
 * Error type		: Logic
 * Corrected code	: System.out.print("Enter an integer: ");
 *
 * Error (Line 25)	: 
 * Error type		: Logic
 * Corrected code	: int x;
 * 
 * Error (Line 28)	: x = in.nextInt;
 * Error type		: Syntax
 * Corrected code	: x = in.nextInt();
*/
import java.util.Scanner;
public class Error1 {

	public static void main(String[] args) {
		Scanner in = new Scanner (System.in);
		int x;
		
		System.out.print("Enter an integer: ");
		x = in.nextInt();

		System.out.println("You have entered " + x);
		in.close();
	}
}