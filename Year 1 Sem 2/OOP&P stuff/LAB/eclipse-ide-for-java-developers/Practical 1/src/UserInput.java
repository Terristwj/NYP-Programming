
import java.util.Scanner;

public class UserInput 
{
	/**
	  Prompts a user to enter a value in a given range until the user
	  provides a valid input.
	  @param low the low end of the range
	  @param high the high end of the range
	  @return the value provided by the user
	*/
	public static int readValueBetween(int low, int high) 
	{
		int input;
		if (low==1&&high==12)
		{
			do
			{
				input=readInt("Please key in a value between 1 to 12:");
			}
			while(input<1 || input>12);
		}
		else
		{
			do
			{
				input=readInt("Please key in a value between 0 to 59:");
			}
			while(input<0 || input>59);
		}
		return input;
	}
	/**
	 * Reads a floating-point value from input and returns its value
	 * 
	 * @param prompt
	 *            the prompt string
	 * @return the floating point number the user enters after the prompt
	 */
	public static int readInt(String prompt) 
	{
		System.out.print(prompt + " ");
		Scanner in = new Scanner(System.in);
		
		return in.nextInt();
	}
	// Can add readString
	// Can add readDoubleBetween
	// Can add readDoubleGreaterTan
	// Can add readValueGreaterThan
	// etc...

	public static boolean confirmation(String prompt)
	{
		int num;
		int redo;
		boolean confirmation=true;
		do
		{
			redo=0;
			Scanner sc = new Scanner(System.in);
			System.out.println(prompt);
			num = sc.nextInt();
			
			if (num==1)
				confirmation = true;
			else if (num==0)
				confirmation = false;
			else
			{
				System.out.println("Please key in a valid answer.\n");
				++redo;
			}
		}
		while (redo==1);
		return confirmation;
	}
	
	public static void display(int hours, int minutes)
	{
		System.out.println(hours + " hours and " + minutes + " minutes.");;
	}
	
	
	public static void main(String[] args) 
	{
		boolean confirm=false;
		int hours;
		int minutes;
		do
		{
			hours = readValueBetween(1, 12);
			minutes = readValueBetween(0, 59);
			// Output
			confirm = confirmation("Are you sure?\nPlease key in 0 for No and 1 for Yes.");
		}
		while (confirm==false);
		display(hours,minutes);
	}
}