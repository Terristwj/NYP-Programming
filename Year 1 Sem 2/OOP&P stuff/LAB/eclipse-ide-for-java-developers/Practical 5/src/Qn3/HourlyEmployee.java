package Qn3;

public class HourlyEmployee extends Employee{
	private double hours;
	private double hourlyRate;
	
	public HourlyEmployee(String name, String staffID, double hours, double hourlyRate)
	{
		super(name, staffID);
		this.hours=hours;
		this.hourlyRate=hourlyRate;
	}
	
	public void view()
	{
		super.view();
		System.out.println("Total work hours: "+hours);
		System.out.println("Hourly rate: "+hourlyRate);
		double salary=computeSalary();
		System.out.printf("Salary: $%.2f",salary);
	}
	
	public double computeSalary()
	{
		double salary;
		if (hours <=160)
			salary= hours*hourlyRate;
		else
		{
			double initialSalary=160*hourlyRate;
			salary= (hours-160)*(hourlyRate*1.5);
			salary += initialSalary;
		}
		return salary;
	}
}
