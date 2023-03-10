import java.util.Scanner;
public class Qn3 {
	public static void main (String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		int score;
		System.out.print("Key in your test score : ");
		score = sc.nextInt();
		
		if ((score<0)||(score>100))
		{
			System.out.println("That is invalid test score.");
			System.out.println("Please try again.");
		}
		else
		{
			System.out.println("That is a valid test score.");
			System.out.print("Noted.");
		}
	}

}
