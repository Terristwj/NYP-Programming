package Qn3;

public class SalariedEmployee extends Employee{
	double monthlyRate;
	
	public SalariedEmployee(String name, String staffID, double monthlyRate)
	{
		super(name, staffID);
		this.monthlyRate=monthlyRate;
	}
	
	public void view()
	{
		super.view();
		System.out.println("Monthly pay rate: "+monthlyRate);
		System.out.printf("Salary: $%.2f\n",monthlyRate);
	}
}
