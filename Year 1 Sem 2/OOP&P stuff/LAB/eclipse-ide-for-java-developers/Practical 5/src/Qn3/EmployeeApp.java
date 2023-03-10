package Qn3;
import java.util.Scanner;
public class EmployeeApp {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		String name;
		String staffID;
		int option;
		
		do
		{
			System.out.print("Key in name: ");
			name=sc.nextLine();
			System.out.print("Key in staff ID: ");
			staffID=sc.nextLine();
			System.out.println();
			do
			{
				System.out.println("Are you a");
				System.out.println("1. Hourly Employee");
				System.out.println("2. Salaried Employee");
				System.out.println("3. Manager");
				System.out.print("Answer: ");
				option=sc.nextInt();
				if (option<=0 || option>3)
				{
					System.out.println("Please key in a valid option.");
					System.out.println();
				}
			}
			while(option<=0 || option>3);
			
			System.out.println();
			if (option==1)
			{
				double hours;
				double hourlyRate;
				System.out.println("You have selected \"Hourly Employee\" ");
				System.out.print("Key in total work hours: ");
				hours=sc.nextDouble();
				System.out.print("Key in hourly rate: ");
				hourlyRate=sc.nextDouble();
				System.out.println();
				HourlyEmployee employee = new HourlyEmployee(name, staffID, hours, hourlyRate);
				employee.view();
				System.out.println();
				System.out.println();
			}
			
			else if(option==2)
			{
				double monthlyRate;
				System.out.println("You have selected \"Salaried Employee\" ");
				System.out.print("Key in monthly pay rate: ");
				monthlyRate=sc.nextDouble();
				System.out.println();
				SalariedEmployee employee = new SalariedEmployee(name, staffID, monthlyRate);
				employee.view();
				System.out.println();
			}
			
			else
			{
				double monthlyRate;
				double annualBonus;
				System.out.println("You have selected \"Manager\" ");
				System.out.print("Key in monthly pay rate: ");
				monthlyRate=sc.nextDouble();
				System.out.print("Key in annual bonus: ");
				annualBonus=sc.nextDouble();
				System.out.println();
				Manager employee = new Manager(name, staffID, monthlyRate, annualBonus);
				employee.view();
				System.out.println();
				System.out.println();
			}
			
			System.out.println("Continue?");
			System.out.println("1.Yes");
			System.out.println("2.No");
			System.out.print("Answer: ");
			option=sc.nextInt();
			sc.nextLine();
			System.out.println();
		}
		while(option==1);
		sc.close();
		System.out.println("Leaving Program...");
	}
}
