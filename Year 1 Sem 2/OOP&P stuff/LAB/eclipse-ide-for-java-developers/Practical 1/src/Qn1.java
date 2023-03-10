import java.util.Scanner;
public class Qn1 {

	public static void main(String[] args)
	{
		double salary;
		double payRaise;
		
		salary = readDouble("Please enter salary: $");
		payRaise = readDouble("Please enter salary increment in %: ");
		payRaise = salary/100*payRaise;
		salary += payRaise;
		
		System.out.printf("Your new salary is: $%.2f",salary);
	}
	
	public static double readDouble(String prompt)
	{
		Scanner sc = new Scanner(System.in);
		System.out.print(prompt);
		
		double num = sc.nextDouble();
		return num;
	}
}
