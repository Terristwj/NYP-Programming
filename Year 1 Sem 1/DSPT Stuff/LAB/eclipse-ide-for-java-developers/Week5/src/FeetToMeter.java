import java.util.Scanner;
public class FeetToMeter {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		double feet, meter;
		
		System.out.print("Enter lenth in feet: ");
		feet=sc.nextDouble();
		
		meter = feet*0.3048;
		System.out.print(feet + "feet = " + meter + " meters");
	}
}
