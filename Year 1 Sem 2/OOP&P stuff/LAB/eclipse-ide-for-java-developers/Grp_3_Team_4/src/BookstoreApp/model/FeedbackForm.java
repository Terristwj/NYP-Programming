package BookstoreApp.model;

import java.io.Serializable;

public class FeedbackForm  implements Serializable{
	
	private static final long serialVersionUID = -4163527223112770022L;
	
	private String adminNo;

	private String feedbackname;
	
	private String feedbacksubject;
	
	private String feedbackcontact;
	
	private String feedbackcontent;
	
	public FeedbackForm() {
		
	}
	
	public FeedbackForm(String adminNo, String feedbackname, String feedbacksubject, String feedbackcontact, String feedbackcontent) {
		this.adminNo = adminNo;
		this.feedbackname = feedbackname;
		this.feedbacksubject = feedbacksubject;
		this.feedbackcontact = feedbackcontact;
		this.feedbackcontent = feedbackcontent;
	}

	public String getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(String adminNo) {
		this.adminNo = adminNo;
	}

	public String getFeedbackname() {
		return feedbackname;
	}

	public void setFeedbackname(String feedbackname) {
		this.feedbackname = feedbackname;
	}

	public String getFeedbacksubject() {
		return feedbacksubject;
	}

	public void setFeedbacksubject(String feedbacksubject) {
		this.feedbacksubject = feedbacksubject;
	}

	public String getFeedbackcontact() {
		return feedbackcontact;
	}

	public void setFeedbackcontact(String feedbackcontact) {
		this.feedbackcontact = feedbackcontact;
	}

	public String getFeedbackcontent() {
		return feedbackcontent;
	}

	public void setFeedbackcontent(String feedbackcontent) {
		this.feedbackcontent = feedbackcontent;
	}
}
