package Qn1;

import java.util.Scanner;
public class Qn1 {

	public static void main(String[]args)
	{
		Scanner sc = new Scanner(System.in);
		String teleNo;
		String countryCode;
		String num1;
		String num2;
		
		System.out.print("Please key in a ten-digit phone number: ");
		teleNo=sc.nextLine();
		
		countryCode = teleNo.substring(0,3);
		num1 = teleNo.substring(3,7);
		num2 = teleNo.substring(7,11);
		
		teleNo="("+countryCode+") "+num1+" "+num2;
		
		System.out.println("Your number is "+teleNo);
	
		sc.close();
	}
}
