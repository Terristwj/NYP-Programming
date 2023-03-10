package BookstoreApp.model;

public class Staff extends Person {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3888265078914662877L;
	
	String staffID;
	
	String userPass;
	
	public Staff() {
		
	}
	public Staff(String staffID, String pass) {
		this.staffID = staffID;
		this.userPass = pass;
	}
	
	public Staff(String fullName, String staffID, String pass) {
		super(fullName);
		this.staffID = staffID;
		this.userPass = pass;
	}
	
	public String getstaffID() {
		return staffID;
	}
	
	public void setstaffID(String staffID) {
		this.staffID = staffID;
	}
	
	@Override
	public String getPassword() {
		return this.userPass;
	}
	
	@Override
	public void setPassword(String userPass) {
		this.userPass = userPass;
	}
}
