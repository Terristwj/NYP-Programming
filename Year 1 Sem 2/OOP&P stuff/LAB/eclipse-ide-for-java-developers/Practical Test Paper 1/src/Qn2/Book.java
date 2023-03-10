package Qn2;

public class Book {
	private int bookID;
	private String title;
	private String author;
	private double price;
	
	public Book() {
		
	}
	
	public Book(int bookID, String title, String author, double price) {
		super();
		this.bookID=bookID;
		this.title=title;
		this.author=author;
		this.price=price;
	}
	
	public int getBookID() {
		return bookID;
	}
	
	public void setBookID(int bookID) {
		this.bookID=bookID;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title=title;
	}
	
	public String getAuthor() {
		return author;
	}
	
	public void setAuthor(String author) {
		this.author=author;
	}
	
	public double getPrice() {
		return price;
	}
	
	public void setPrice(double price) {
		this.price=price;
	}
	
	public void display() {
		System.out.println("==================================");
		System.out.println("Book ID : "+bookID);
		System.out.println("Book Title : "+title);
		System.out.println("Book Author : "+author);
		System.out.printf("Book Price : $%.2f",price);
		System.out.println();
	}
}
