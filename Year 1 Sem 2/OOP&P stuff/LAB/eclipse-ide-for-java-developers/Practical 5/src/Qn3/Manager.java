package Qn3;

public class Manager extends SalariedEmployee{
	private double annualBonus;
	
	public Manager(String name, String staffID, double monthlyRate, double annualBonus) 
	{
		super(name, staffID, monthlyRate);
		this.annualBonus=annualBonus;
	}
	
	public void view()
	{
		super.view();
		System.out.printf("Annual bonus: $%.2f\n",annualBonus);
		double annualSalary=computeAnnualSalary();
		System.out.printf("Annual salary: $%.2f", annualSalary);
	}
	
	public double computeAnnualSalary()
	{
		double annualSalary = monthlyRate*12+annualBonus;
		return annualSalary;
	}
}
