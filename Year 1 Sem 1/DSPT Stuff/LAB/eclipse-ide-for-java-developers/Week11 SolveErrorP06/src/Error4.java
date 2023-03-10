//	Run this program, key in 45 and 3.
//	Answer should be 15.
//	Next,  key in 4 and 0. What happens?
//	How can you improve this program?
/*
 * Original (Line 31)	: 
 * Corrected code		: if (n2 != 0)
 *
 * Original (Line 34)	: 
 * Corrected code		: else 
 * 
 * Original (Line 35)	: 
 * Corrected code		: System.out.println("Cannot be divided by 0.");
*/

import java.util.Scanner;

public class Error4 {
	public static void main(String[] args) {
		
		int n1, n2, redo = 0;
		double result = 0;
		do
		{
			try
			{
				Scanner sc = new Scanner(System.in);
				redo = 0;

				System.out.print("Enter 1st integer: ");
				n1 = sc.nextInt();
				System.out.print("Enter 2nd integer: ");
				n2 = sc.nextInt();
		
				result = (double) n1 / n2;
		
				if (n2 != 0)
					System.out.println("n1 divide by n2 =  " + result);
				
				else 
					System.out.println("Cannot be divided by 0.");
			}
			catch (Exception ex)
			{
				++redo;
				System.out.println("Invalid input.");
				System.out.println("Key in a proper number.\n");
			}
		}
		while (redo == 1);
	}
}
