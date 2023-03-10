import java.util.Scanner;
public class ReadIntoIntArray {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		int [] arr = new int[5];
		int displayAt5 = 0;
		int total = 0;
		
		for (int i = 0; i<arr.length; i++)
		{
			System.out.println("Please key a number ("+(i+1)+") :");
			arr[i] = sc.nextInt();
		}
		for (int i = 0; i<arr.length; i++)
		{
			System.out.println(arr[i]);
		}
		
		for (int i = 0; i<arr.length; i++)
		{	
			total += arr[i];
			++displayAt5;
			if (displayAt5 == 4)
			{
				System.out.println("The sum is: "+total);
			}
		}
	}
}
