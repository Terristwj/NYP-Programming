import java.util.ArrayList;
import java.util.Scanner;
public class ArrayDemo2{
	
	public static void main(String[] args){
		int input;
		int [] arrayInput = new int [5];
		int i = 0;
		int maxValue;
		
		System.out.print("Enter 5 numbers.\n");
		
		do
		{
			input = UserInput();
			arrayInput[i] = input;
			++i;
		}
		while( i != arrayInput.length );
		
		maxValue = findMax(arrayInput);
		System.out.println("The max value is " + maxValue);
	}
	
	public static int UserInput(){
		Scanner sc = new Scanner (System.in);
		int numInput;
		int redo;
			
		do
		{
			redo = 0;
			System.out.print("Enter a number between 0 and 100(inclusive) : ");
			numInput = sc.nextInt();
			
			if ( numInput < 0 || numInput > 100)
			{
				++redo;
				System.out.println("Wrong input!\n");
			}
		}
		while (redo == 1);
		return numInput;
	}
	
	public static int findMax( int [] arr )
	{
		int max = arr[0];
		
		for (int i = 1; i<arr.length; i++)
		{
			if (arr[i] > max)
				max = arr[i];
		}
		
		return max;
	}
}
