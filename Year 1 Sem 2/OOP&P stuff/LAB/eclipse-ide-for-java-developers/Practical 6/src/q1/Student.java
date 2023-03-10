package q1;

public class Student extends Person{
	private String adminNo;
	private double testMark;
	private double examMark;
	
	public Student (String nric, String name, String adminNo) {
		super(nric, name);
		setAdminNo (adminNo);
	}
	
	public String getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(String adminNo) {
		this.adminNo = adminNo;
	}
	public double getTestMark() {
		return testMark;
	}
	public void setTestMark(double testMark) {
		this.testMark = testMark;
	}
	public double getExamMark() {
		return examMark;
	}
	public void setExamMark(double examMark) {
		this.examMark = examMark;
	}
	public double computeFinalMark() {
		return (testMark + examMark)/2;
	}
	public void view() {
		super.view();
		System.out.println("Admin No: " + adminNo);
		System.out.printf("Test Mark: %.1f\n", testMark);
		System.out.printf("Exam Mark: %.1f\n", examMark);
		System.out.printf("Final Mark: %.1f\n\n", computeFinalMark());
	}
}
