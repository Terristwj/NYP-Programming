package BookstoreApp.model;

import java.util.ArrayList;

public class Student extends Person {
	
	private static final long serialVersionUID = 2759992940215581468L;
	
	String adminNo;
	
	String membershipStatus;
	
	String userPass;
	
	String email;
	
	ArrayList<Order> purchaseHistory;
	
	ArrayList<FeedbackForm> feedbackForms;
	
	public Student() {
		
	}

	public Student(String adminNo, String pass, String name, String membershipStatus, String email, ArrayList<Order> purchaseHistory, ArrayList<FeedbackForm> feedbackForms) {
		super(name);
		this.adminNo = adminNo;
		this.userPass = pass;
		this.membershipStatus = membershipStatus;
		this.email = email;
		this.purchaseHistory = purchaseHistory;
		this.feedbackForms = feedbackForms;
	}
	
	public ArrayList<FeedbackForm> getFeedbackForms() {
		return feedbackForms;
	}
	
	public void setFeedbackForms(ArrayList<FeedbackForm> feedbackForms) {
		this.feedbackForms = feedbackForms;
	}
	
	public ArrayList<Order> getPurchaseHistory() {
		return purchaseHistory;
	}

	public void setPurchaseHistory(ArrayList<Order> purchaseHistory) {
		this.purchaseHistory = purchaseHistory;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getEmail() {
		return this.email;
	}
	protected void setadminNo(String adminNo) {
		this.adminNo = adminNo;
	}
	
	public String getadminNo() {
		return this.adminNo;
	}
	
	public void setMembershipStatus(String membershipStatus) {
		this.membershipStatus = membershipStatus;
	}
	
	public String getMembershipStatus() {
		return this.membershipStatus;
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
