package q1;

public class Person {
	private String nric;
	private String name;
	
	public Person(String nric, String name) {
		this.nric = nric;
		this.name = name;
	}
	public String getNric() {
		return nric;
	}
	public void setNric(String nric) {
		this.nric = nric;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void view() {
		System.out.println("Nric: " + nric);
		System.out.println("Name: " + name);
		
	}
}
