import java.util.ArrayList;
import java.util.Scanner;
public class ArrayListDemo2{
	
	public static void main(String[] args){
		ArrayList<Integer> arrayList = new ArrayList<Integer>();
		
		int input;
		int maxValue;
		
		System.out.print("Enter as much value as you want.\n");
		
		do
		{
			input = UserInput();
			arrayList.add(input);
			
			maxValue = findMax(arrayList);
			System.out.println("The max value is " + maxValue);
		}
		while( 1 == 1);
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
	
	public static int findMax( ArrayList<Integer> arrayList )
	{
		int max = arrayList.get(0);
		
		for (int i = 1; i<arrayList.size(); i++)
		{
			if (arrayList.get(i) > max)
				max = arrayList.get(i);
		}
		
		return max;
	}
}