package Qn1;

public class Student extends Person{
	private String adminNo;
	private double testMark;
	private double examMark;
	
	public Student(String name, String nric)
	{
		super(name, nric);
	}
	
	public void setAdminNo(String adminNo)
	{
		this.adminNo=adminNo;
	}
	
	public void setTestMark(double testMark)
	{
		this.testMark=testMark;
	}
	
	public void setExamMark(double examMark)
	{
		this.examMark=examMark;
	}
	
	public void view()
	{
		super.view();
		System.out.println("Admin number: "+adminNo);
		System.out.println("Test mark: "+testMark);
		System.out.println("Exam mark: "+examMark);
		double finalMark=computeFinalMark();
		System.out.println("Final mark: "+finalMark);
	}
	
	public double computeFinalMark()
	{
		double finalMark = testMark/2 + examMark/2;
		return finalMark;
	}
}
