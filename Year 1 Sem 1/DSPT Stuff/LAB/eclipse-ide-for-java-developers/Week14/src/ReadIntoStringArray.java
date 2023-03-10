import java.util.Scanner;
public class ReadIntoStringArray {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		String [] arr = new String [5];
		
		for (int i = 0; i<arr.length; i++)
		{
			System.out.println("Please key a word ("+(i+1)+") :");
			arr[i] = sc.nextLine();
		}
		for (int i = 0; i<arr.length; i++)
		{
			System.out.println(arr[i]);
		}
	}
}
