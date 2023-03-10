package Qn1;

public class BookAppQ1 {
	public static void main(String[] args){
		
		int bookID;
		String title, author;
		double price;
		
		bookID = 376066;
		title = "Introduction to Programming with Java: A Problem Solving Approach";
		author = "John Dean and Ray Dean";
		price = 88.15;
		
		Book book1 = new Book(bookID, title, author, price);
		
		book1.display();
		
		bookID = 163316;
		title = "Java For Everyone: Late Objects";
		author = "Cay S. Horstmann";
		price = 75.78;
		
		Book book2 = new Book(bookID, title, author, price);
		
		book2.display();
	}
}
