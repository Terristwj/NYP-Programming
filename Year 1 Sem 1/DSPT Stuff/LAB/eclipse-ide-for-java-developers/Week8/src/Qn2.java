import java.util.Scanner;
public class Qn2 {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner (System.in);
		
		String valueInputString;
		String sumString;
		int count;
		
		int sum1 = 0;
		int sum2 = 0;
		int sum3 = 0;
		
		System.out.println("Enter a number to sum up:");
		
		valueInputString = sc.next();
		count = valueInputString.length();
		
		int i = count;
		
		if (i<11)
		switch (i)
		{
				case 10:	sumString = valueInputString.substring(9,10);
							sum3 = Integer.parseInt(sumString);
							sum2= sum2 + sum3;
				
				case 9:		sumString = valueInputString.substring(8,9);
							sum3 = Integer.parseInt(sumString);
							sum2= sum2 + sum3;				
				
				case 8:		sumString = valueInputString.substring(7,8);
							sum3 = Integer.parseInt(sumString);
							sum2= sum2 + sum3;
				
				case 7:		sumString = valueInputString.substring(6,7);
							sum3 = Integer.parseInt(sumString);
							sum2= sum2 + sum3;
				
				case 6:		sumString = valueInputString.substring(5,6);
							sum3 = Integer.parseInt(sumString);
							sum2= sum2 + sum3;
				
				case 5:		sumString = valueInputString.substring(4,5);
							sum3 = Integer.parseInt(sumString);
							sum2= sum2 + sum3;
				
				case 4:		sumString = valueInputString.substring(3,4);
							sum3 = Integer.parseInt(sumString);
							sum2= sum2 + sum3;
						
				case 3: 	sumString = valueInputString.substring(2,3);
							sum3 = Integer.parseInt(sumString);
							sum2= sum2 + sum3;
					
				case 2: 	sumString = valueInputString.substring(1,2);
							sum3 = Integer.parseInt(sumString);
							sum2= sum2 + sum3;
						
				case 1:		sumString = valueInputString.substring(0,1);
							sum1 = Integer.parseInt(sumString);
							sum1 = sum1 + sum2;
			
							System.out.println("Summation of " + valueInputString + " : " + sum1);
				
			}
		else
			System.out.print("Please key only up to 10 digits.");
			
	}

}
