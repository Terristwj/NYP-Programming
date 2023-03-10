package Qn1;

public class Lecturer extends Person{
	private String staffId;
	private double totalTeachingHour;
	
	public Lecturer(String name, String nric)
	{
		super(name, nric);
	}
	
	public void setstaffId(String staffId)
	{
		this.staffId=staffId;
	}
	
	public void setTotalTeachingHour(double totalTeachingHour)
	{
		this.totalTeachingHour=totalTeachingHour;
	}
	
	public void view()
	{
		super.view();
		System.out.println("Staff ID: "+staffId);
		System.out.println("Total teaching hour: "+totalTeachingHour);
		double salary = computeSalary();
		System.out.printf("Salary: $%.2f",salary);
	}
	
	public double computeSalary()
	{
		double salary = totalTeachingHour*90;
		return salary;
	}
}
