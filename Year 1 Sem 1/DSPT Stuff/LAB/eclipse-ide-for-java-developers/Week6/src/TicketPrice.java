import java.util.Scanner;
public class TicketPrice {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		double price1, price2, price3;
		price1 = 7.50;    //Price for 16>x
		price2 = 10.00;   //Price for 65>x>=16
		price3 = 5.50;    //Price for 65<=x
		
		int age;
		int day;
		
		System.out.print("(eg. 1 = Monday, 2 = Tuesday)\nPlease key in the day of the week : ");
		day = sc.nextInt();
		
		if ((day==6)||(day==7))
			System.out.println("The price of a ticket will be $10.00");
		else if ((day<6)&&(day>=1))
			{
			System.out.print("Please key in your age : ");
			age = sc.nextInt();
		
			if ((age<=4)||(age>=130))
			System.out.println("The age is invalid. \nExiting now.");
		
			else if (age<16)
			System.out.printf("The price of a ticket is : $%.2f", price1);
		
			else if ((age>=16)&&(age<65))
			System.out.printf("The price of a ticket is : $%.2f", price2);
		
			else if (age>=65)
			System.out.printf("The price of a ticket is : $%.2f", price3);
			}
		else if ((day<1)||(day>7))
			System.out.println("The day is invalid. \nExiting now.");
	}

}
