package Qn1;

public class Person {
	private String name;
	private String nric;
	
	public Person(String name, String nric)
	{
		this.name=name;
		this.nric=nric;
	}
	
	public void setName(String name)
	{
		this.name=name;
	}
	
	public void setNRIC(String nric)
	{
		this.nric=nric;
	}
	
	public void view()
	{
		System.out.println("Name: "+name);
		System.out.println("NRIC: "+nric);
	}
}
