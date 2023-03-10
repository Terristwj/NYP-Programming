import java.util.Scanner;
public class Sample2 {
	public static void main (String[] args)
	{
		Scanner sc = new Scanner (System.in);
		
		int day;
		
		System.out.print("Enter day of week (1-7): ");
		day = sc.nextInt();

		while (day < 1 || day > 7)
		{
			System.out.println("Invalid input!");
			System.out.print("Enter day of week (1-7): ");
			day = sc.nextInt();
		}

	}

}
