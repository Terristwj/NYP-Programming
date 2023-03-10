import java.util.Scanner;
public class Qn4 {
	public static void main (String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		int scoreNumb;
		
		System.out.println("Enter a number between 1-20: ");
		scoreNumb = sc.nextInt();
		
		if (scoreNumb<10)
			System.out.println("Smaller than 10.");
		
		else
			System.out.println("Not smaller than 10");

		if (scoreNumb>10)
			System.out.println("Bigger than 10");
		else 
			System.out.println("Not bigger than 10");
	}

}
