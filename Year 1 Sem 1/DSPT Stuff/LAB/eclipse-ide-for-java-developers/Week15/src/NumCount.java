import java.util.Scanner;
public class NumCount {
	public static void main(String[] args){
		Scanner sc = new Scanner(System.in);
		
		int valueCapture;
		int redo = 1;
		
		int [] valueInputs = new int [1000];
		int i = 0; //for valueInputs
		
		int [] valueOccurrences = new int [20];
		for (int x=0; x<valueOccurrences.length;x++)
		{
			valueOccurrences[x] = 0;
		}
		
		int [] value = new int [20];
		int fillValue = 0;
		for (int x=0; x<value.length;x++)
		{
			value[x] = fillValue;
			fillValue++;
		}
		
		do
		{
			System.out.print("Enter a number between 0 to 19 (enter -1 to exit): ");
			valueCapture = sc.nextInt();
		
			if (valueCapture<-1 || valueCapture>19)
			{
				System.out.println("Input is invalid.");
			}
			
			else if (valueCapture == -1)
			{
				redo = 0;
			}
			
			else
			{
				valueInputs[i] = valueCapture;
				++i;
			}
		}
		while (redo == 1);
		
		for (int x=0; x<i; x++)
		{
			valueOccurrences[valueInputs[x]] += 1;
		}
		
		System.out.println("\nNumber of occurrences:");
		
		for (int n=0; n<value.length; n++)
		{
			System.out.print(value[n] + "\t");
			System.out.println(valueOccurrences[n]);
		}
	}
}
