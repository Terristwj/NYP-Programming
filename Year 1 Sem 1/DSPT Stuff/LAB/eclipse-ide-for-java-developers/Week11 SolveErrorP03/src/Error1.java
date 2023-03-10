//	Run and see the output of the program.
//	Use the debugger to examine the variables.

/*
 * Error (Line 21)	: discountRate = 15 / 100;
 * Error type		: Syntax
 * Corrected code	: discountRate = 15.0 / 100.0;
 * 
 * Error (Line 23)	: payable = amount = discountValue;
 * Error type		: Syntax
 * Corrected code	: payable = amount - discountValue;
*/
public class Error1 {

	public static void main(String[] args) {
		double discountRate;
		double discountValue;
		double amount = 100;
		double payable;

		discountRate = 15.0 / 100.0; // 15% discount
		discountValue = amount * discountRate;
		payable = amount - discountValue;

		System.out.println("Payable amount after discount = " + payable);
	}
}
