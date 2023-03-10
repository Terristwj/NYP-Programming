import java.util.Scanner;
public class MarkCheckerQ1 {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		int userResult;
		System.out.print("Please key in your results: ");
		userResult = sc.nextInt();
		
		if (userResult>=50)
			System.out.println("You have passed");
		
		
	}

}
