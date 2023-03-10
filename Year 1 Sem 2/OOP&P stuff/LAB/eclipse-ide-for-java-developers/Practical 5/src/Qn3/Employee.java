package Qn3;

public class Employee {
	private String name;
	private String staffID;
	
	public Employee(String name, String staffID)
	{
		this.name=name;
		this.staffID=staffID;
	}
	
	public void view()
	{
		System.out.println("Name: "+name);
		System.out.println("Staff ID: "+staffID);
	}
}
