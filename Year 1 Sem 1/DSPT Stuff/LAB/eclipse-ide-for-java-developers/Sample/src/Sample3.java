import java.util.Scanner;
public class Sample3 {
	public static void main (String[] args)
	{
		Scanner sc = new Scanner (System.in);
		
		int day;
		
		System.out.println("(If input is invalid, retype input.)");
		
		do
			{
				System.out.print("Enter day of week (1-7): ");
				day = sc.nextInt();
			}

			while (day < 1 || day > 7);
		
		System.out.println("Valid input.");
			
	}

}
