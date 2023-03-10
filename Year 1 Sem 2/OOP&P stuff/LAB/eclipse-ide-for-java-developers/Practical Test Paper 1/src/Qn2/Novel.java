package Qn2;

public class Novel extends Book{
	private String genre;
	private String reviews;
	
	public Novel() {
		
	}
	
	public Novel(int bookID, String title, String author, double price, String genre, String reviews) {
		super(bookID, title, author, price);
		this.genre=genre;
		this.reviews=reviews;
	}
	
	public String getGenre() {
		return genre;
	}
	
	public void setGenre(String genre) {
		this.genre=genre;
	}
	
	public String getReviews() {
		return reviews;
	}
	
	public void setReviews(String reviews) {
		this.reviews=reviews;
	}
	
	@Override
	public void display() {
		super.display();
		System.out.println("Genre : "+genre);
		System.out.println("User reviews: \n"+reviews);
	}
}
