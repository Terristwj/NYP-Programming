package Qn3;
public class Student {
	// Attributes of Student
	private String name;
	private char gender;
	private double mark;
	private String enrolmentDate;

	// Constructor
	public Student(String name, char gender, String enrolmentDate) {
		this.name = name;
		this.gender = gender;
		this.enrolmentDate = enrolmentDate;
	}

	// Accessor & Mutator methods
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public double getMark() {
		return mark;
	}

	public void setMark(double mark) {
		this.mark = mark;
	}
	
	public String getEnrolmentDate(){
		return enrolmentDate;
	}
	
	public void setEnrolmentDate(String enrolmentDate){
		this.enrolmentDate = enrolmentDate;
	}
	
	// User defined or service method
	public void view() {
		System.out.println("Name: " + name);
		System.out.println("Gender: " + gender);
		System.out.println("Marks: " + mark);
		System.out.println("Enrolment Date: "+ enrolmentDate);
	}
}
