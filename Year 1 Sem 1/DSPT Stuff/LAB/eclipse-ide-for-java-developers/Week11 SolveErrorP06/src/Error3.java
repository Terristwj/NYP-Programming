//	Run this program, key in 1, 2, 3
//	This program is supposed to display 
//	the maximum of the 3 numbers entered.
//	Spot and solve the logic error here.
/*
 * Error (Line 28)	: 
 * Error type		: Logic
 * Corrected code	: {
 *
 * Error (Line 33)	: 
 * Error type		: Logic
 * Corrected code	: }
*/
import java.util.Scanner;

public class Error3 {
	public static void main(String[] args) {
		int n1, n2, n3, max=0;
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter 1st integer: ");
		n1 = sc.nextInt();
		System.out.print("Enter 2nd integer: ");
		n2 = sc.nextInt();
		System.out.print("Enter 3rd integer: ");
		n3 = sc.nextInt();
		
		if (n1 >= n2) 
		{
			if (n1 >= n3)
				max = n1;
			else if (n1 < n3)
				max = n3;
		}
		else if (n2 >= n3)
			max = n2;
		else
			max = n3;
		System.out.println("The max is " + max);
		
		sc.close();
	}
}
