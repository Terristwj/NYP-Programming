package q1;

public class Lecturer extends Person {
	final static int HOURLY_RATE = 90;
	private String staffId;
	private int totalTeachingHr;
	
	public Lecturer (String nric, String name, String staffId) {
		super(nric, name);
		setStaffId (staffId);
	}
	public String getStaffId() {
		return staffId;
	}
	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}
	public int getTotalTeachingHr() {
		return totalTeachingHr;
	}
	public void setTotalTeachingHr(int totalTeachingHr) {
		this.totalTeachingHr = totalTeachingHr;
	}
	public double computeSalary() {
		return totalTeachingHr * HOURLY_RATE;
	}
	public void view() {
		super.view();
		System.out.println("Staff Id: " + staffId);
		System.out.printf("Total Teaching Hours: %d", totalTeachingHr);
		System.out.println();
		System.out.printf("Salary ($): %.2f\n\n", computeSalary());
	}
}
