package Qn4;

public class Customer {
	private String ID;
	private String name;
	
	public Customer()
	{
		
	}
	
	public Customer(String ID, String name)
	{
		this.ID = ID;
		this.name = name;
	}
	
	public void setID(String ID)
	{
		this.ID=ID;
	}
	
	public void setName(String name)
	{
		this.name=name;
	}
	
	public void print1()
	{
		System.out.println("== Customer object instantiated using default constructor ==");
		System.out.println("Customer id: "+ID);
		System.out.println("Customer name: "+name);
		System.out.println("");
	}
	
	public void print2()
	{
		System.out.println("== Customer object created using default constructor ==");
		System.out.println("Customer id: "+ID);
		System.out.println("Customer name: "+name);
		System.out.println("");
	}
}
