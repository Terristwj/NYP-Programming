
public class ArrayDemo1 {
	public static void main(String[] args)
	{
		int [] arr = {60, 55, 91, 80, 75, 64};
		int sum = 0;
		double average;
		for (int i = 0; i<arr.length;i++)
		{
			sum += arr[i];
		}
		average = sum/arr.length;
		System.out.println("The sum is " + sum);
		System.out.println("The average is " + average);
		
	}
}
