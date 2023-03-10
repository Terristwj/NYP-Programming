
public class ArrayListDemo1 {
	public static void main(String[] args)
	{
		int [] arr = {60, 55, 91, 80, 75, 64};
		int sum = 0;
		double avg;
		
		
		for (int i=0; i<arr.length; i++)
		{
			sum += arr[i];
		}
		avg = sum/arr.length;
		System.out.println("Sum is " + sum);
		System.out.println("Average is " + avg);
	}

}
