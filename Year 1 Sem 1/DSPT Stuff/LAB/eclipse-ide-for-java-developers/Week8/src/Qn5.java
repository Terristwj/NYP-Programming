import java.util.Objects;
import java.util.Scanner;
public class Qn5 {
	public static void main(String [] args)
	{
		Scanner sc = new Scanner (System.in);
		String line1;
		String line2 = "a";
		
		System.out.println("Enter line 1:");
		line1 = sc.nextLine();
		
		System.out.println("Enter line 2:");
		line2 = sc.nextLine();
		
		if ( line1.equals(line2) )
		{
			System.out.print("Both lines are equal.");
			
		}
		else
		{
			System.out.print("Both lines are not equal");
		}
	}

}
