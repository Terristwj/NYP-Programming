import java.util.Scanner;
public class Challenge8 {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		int day;
		
		System.out.print("(Eg. 1 is Monday, 2 is Tuesday)\nPlease key in the day : ");
		day = sc.nextInt();
		
		switch (day)
		{
			case 1 :
				System.out.println("Today is Monday.");
				break;
			case 2 : 
				System.out.println("Today is Tuesday.");
				break;
			case 3 : 
				System.out.println("Today is Wednesday.");
				break;
			case 4 : 
				System.out.println("Today is Thursday.");
				break;
			case 5 : 
				System.out.println("Today is Friday.");
				break;
			case 6 : 
				System.out.println("Today is Saturday.");
				break;
			case 7 :
				System.out.println("Today is Sunday.");
				break;
			default :
				System.out.println("Error. \nTry again.");
				
		}
			
		//	System.out.println("Today is Monday.");
		//else if (day==2)
			//System.out.println("Today is Tuesday.");
		//else if (day==3)
			//System.out.println("Today is Wednesday.");
		//else if (day==4)
			//System.out.println("Today is Thursday.");
		//else if (day==5)
			//System.out.println("Today is Friday.");
		//else if (day==6)
			//System.out.println("Today is Saturday.");
		//else if (day==7)
			//System.out.println("Today is Sunday.");
		//else if ((day<1)||(day>7))
			//System.out.println("Invalid input.");
	}
}
