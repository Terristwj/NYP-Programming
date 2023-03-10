package Qn3;

public class Comic extends Book{
	private int volume;
	private int issue;
	private int ratings;
	
	public Comic() {
		
	}
	
	public Comic(int bookID, String title, String author, double price, int volume, int issue, int ratings) {
		super(bookID, title, author, price);
		this.volume=volume;
		this.issue=issue;
		this.ratings=ratings;
	}
	
	public int getVolume() {
		return volume;
	}
	
	public void setVolume(int volume) {
		this.volume=volume;
	}
	
	public int getIssue() {
		return issue;
	}
	
	public void setIssue(int issue) {
		this.issue=issue;
	}
	
	public int getRatings() {
		return ratings;
	}
	
	public void setRatings(int ratings) {
		this.ratings=ratings;
	}
	
	@Override
	public void display() {
		super.display();
		System.out.println("Volume : "+volume);
		System.out.println("Issue: "+issue);
		System.out.println("User Ratings: "+ratings+" out of 10");
	}
	
	public void addNewRating(int newRatings) {
		ratings = ratings+newRatings;
		ratings = ratings/2;
	}
}
