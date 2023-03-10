package Qn2;

import Qn2.Book;

public class BookAppQ2 {
	public static void main(String[] args) {
		int bookID, volume, issue, ratings;
		String title, author, genre, reviews;
		double price;
		
		bookID = 1234;
		title = "My first Novel";
		author = "Siti Nurhaliza";
		price = 11.20;
		genre = "Thriller";
		reviews = "1) Fantastic book! I love it!\n2) Engaging!";
		
		Novel novel = new Novel(bookID, title, author, price, genre, reviews);
		
		novel.display();
		
		bookID = 9876;
		title = "My first Comics";
		author = "Shah Rukh Khan";
		price = 15.60;
		volume = 1;
		issue = 1;
		ratings = 4;
		
		Comic comic = new Comic(bookID, title, author, price, volume, issue, ratings);
		
		comic.display();
	}
}
