//	Solve the syntax error.
//	This is a very common mistake, 
//	similar to Error1.java, but 
//	syntax error is detected by the compiler 
//	because of the "else" statement.
/*
 * Error (Line 22)	: if (num1 > num2);{
 * Error type		: Syntax
 * Corrected code	: if (num1 > num2){
*/
import java.util.Scanner;
public class Error2 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);   
		int num1, num2, temp;
		
		System.out.print("Enter num1: ");
		num1 = sc.nextInt();
		System.out.print("Enter num2: ");
		num2 = sc.nextInt();
		
		if (num1 > num2){
			temp = num1;
			System.out.println("Num 1 > num2");
		}
		else{
			temp = num2;
			System.out.println("Num 2 > num1");
		}
		System.out.println ("The bigger number is : " + temp);
			
	}

}