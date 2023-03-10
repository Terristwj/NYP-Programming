import java.util.Scanner;
public class Qn3 {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner (System.in);
		String input;
		
		String first = "";
		String second = "";
		String third = "";
		String fourth = "";
		String fifth = "";
		String sixth = "";
		String seventh = "";
		String eighth = "";
		String ninth = "";
		String tenth = "";
		String eleventh = "";
		String twelfth = "";
		String thirteenth = "";
		String fourteenth = "";
		String fifteenth = "";
		int count;
		
		System.out.println("Enter a word to convert:");
		input = sc.nextLine();
		count = input.length();
				
		int i = count;
		
		if (i<16)
		{
			switch (i)
			{										
				case 15:	fifteenth = input.substring(14,15);
							fifteenth = fifteenth.toUpperCase();
									
				case 14:	fourteenth = input.substring(13,14);
							fourteenth = fourteenth.toLowerCase();
																	
				case 13:	thirteenth = input.substring(12,13);
							thirteenth = thirteenth.toUpperCase();
																
				case 12:	twelfth = input.substring(11,12);
							twelfth = twelfth.toLowerCase();
				
				case 11:	eleventh = input.substring(10,11);
							eleventh = eleventh.toUpperCase();
				
				case 10:	tenth = input.substring(9,10);
							tenth = tenth.toLowerCase();
				
				case 9:		ninth = input.substring(8,9);
							ninth = ninth.toUpperCase();
				
				case 8:		eighth = input.substring(7,8);
							eighth = eighth.toLowerCase();
				
				case 7:		seventh = input.substring(6,7);
							seventh = seventh.toUpperCase();
				
				case 6:		sixth = input.substring(5,6);
							sixth = sixth.toLowerCase();
				
				case 5:		fifth = input.substring(4,5);
							fifth = fifth.toUpperCase();
				
				case 4:		fourth = input.substring(3,4);
							fourth = fourth.toLowerCase();
				
				case 3: 	third = input.substring(2,3);
							third = third.toUpperCase();
						
				case 2:		second = input.substring(1,2);
							second = second.toLowerCase();
						
				case 1:		first = input.substring(0,1);
							first = first.toUpperCase();
							
							System.out.print( first + second + third + fourth + fifth + sixth + seventh + eighth + ninth + tenth + eleventh + twelfth + thirteenth + fourteenth + fifteenth);
			}
		}
		
		else
			System.out.print("Please rekey a word that is at most 16 letters.");
		
	}

}
