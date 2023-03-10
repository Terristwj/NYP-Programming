// 	Run the program and see the output.
// 	Find the logical error here.
// 	The formula to convert the temperature
//	in celsius to fahrenheit is:
// 	celsius = (5/9)*(fahrenheit-32); 
//


/*
 * Error (Line 25)	: celsius = 5 / 9.0 * fah - 32;
 * Error type		: Logic
 * Corrected code	: celsius = (5 / 9.0) * (fah - 32);
*/
import java.util.*;

public class Error2 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		double celsius, fah;

		System.out.print("Enter degree in fahrenheit: ");
		fah = sc.nextDouble();

		celsius = (5 / 9.0) * (fah - 32);

		System.out.println("Degree in celsius = " + celsius);
		
		sc.close();
	}

}
