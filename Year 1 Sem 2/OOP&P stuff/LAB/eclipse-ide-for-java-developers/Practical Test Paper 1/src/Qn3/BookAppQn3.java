package Qn3;

import Qn3.Comic;
import Qn3.Novel;
import java.util.ArrayList;
import java.util.Scanner;

public class BookAppQn3 {
	public static void main(String[] args){
		int bookID, volume, issue, ratings;
		String title, author, genre, reviews;
		double price;
		
		bookID = 1234;
		title = "My first Novel";
		author = "Siti Nurhaliza";
		price = 11.20;
		genre = "Thriller";
		reviews = "1) I love this book!\n2) Makes me cry!";
		
		Novel novel1 = new Novel(bookID, title, author, price, genre, reviews);
		
		bookID = 4567;
		title = "My second Novel";
		author = "Siti Nurhaliza";
		price = 17.80;
		genre = "Comedy";
		reviews = "1) Great sequal!\n2) Nothing fantastic!";
		
		Novel novel2 = new Novel(bookID, title, author, price, genre, reviews);
		
		bookID = 7586;
		title = "My first Comics";
		author = "Shah Rukh Khan";
		price = 15.60;
		volume = 1;
		issue = 1;
		ratings = 4;
		
		Comic comic1 = new Comic(bookID, title, author, price, volume, issue, ratings);
		
		bookID = 9876;
		title = "My second Comics";
		author = "Shah Rukh Khan";
		price = 18.00;
		volume = 1;
		issue = 2;
		ratings = 9;
		
		Comic comic2 = new Comic(bookID, title, author, price, volume, issue, ratings);
		
		ArrayList<Novel> novels= new ArrayList<Novel>();
		novels.add(novel1);
		novels.add(novel2);
		ArrayList<Comic> comics= new ArrayList<Comic>();
		comics.add(comic1);
		comics.add(comic2);
		
		for (int i=0; i<novels.size(); i++)
			novels.get(i).display();
		
		for (int i=0; i<comics.size(); i++)
			comics.get(i).display();
		
		System.out.println();
		System.out.println();
		
		Scanner sc = new Scanner(System.in);
		String responds;
		int rating;
		System.out.print("Add a review for the first novel: ");
		responds=sc.nextLine();
		novels.get(0).addReview(responds);
		System.out.print("Add a rating for the first comic: ");
		rating=sc.nextInt();
		comics.get(0).addNewRating(rating);
		System.out.println();
		
		getTopComicsBook(comics);
		System.out.println(comic2.getRatings());
	}
	
	public static void getTopComicsBook(ArrayList<Comic> comics) {
		int comicID = comics.get(0).getBookID();
		int comicRating = comics.get(0).getRatings();
		for (int i = 1; i<comics.size(); i++) {
			int nextComicRating = comics.get(i).getRatings();
			if (nextComicRating>comicRating){
				comicID = comics.get(i).getBookID();
				comicRating = comics.get(i).getRatings();
			}
		}
		
		System.out.println();
		System.out.println();
		System.out.println("The Comics book with the highest ratings is:");
		System.out.println("Book ID: "+comicID);
		System.out.println("Ratings: "+comicRating);
		
	}
}
