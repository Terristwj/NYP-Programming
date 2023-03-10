package BookstoreApp.model;

import java.io.Serializable;

public class Item implements Serializable{
	
	private static final long serialVersionUID = -6272490777836030119L;

	String catergory;
	
	String name;
	
	String description;
	
	double price;
	
	int quantity;
	
	String searchAndFavouriteImageLink;
	
	String hotImageLink;
	
	String itemPageLink1;
	
	String itemPageLink2;
	
	String itemPageLink3;
	
	String itemPageLink4;
	
	public Item(){
		
	}
	
	public Item(String name) {
		this.name = name;
	}
	
	public Item(String name, double price){
		this.name = name;
		this.price = price;
	}
	
	public Item(String catergory, String name, String description, double price, int quantity, String searchAndFavouriteImageLink, String hotImageLink, String itemPageLink1, String itemPageLink2, String itemPageLink3, String itemPageLink4){
		this.catergory = catergory;
		this.name = name;
		this.description = description;
		this.price = price;
		this.quantity = quantity;
		this.searchAndFavouriteImageLink = searchAndFavouriteImageLink;
		this.hotImageLink = hotImageLink;
		this.itemPageLink1 = itemPageLink1;
		this.itemPageLink2 = itemPageLink2;
		this.itemPageLink3 = itemPageLink3;
		this.itemPageLink4 = itemPageLink4;
	}
	
	public String getCatergory(){
		return catergory;
	}
	
	public void setCatergory(String catergory){
		this.catergory = catergory;
	}
	
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	public String getDescription(){
		return description;
	}
	
	public void setDescription(String description){
		this.description = description;
	}
	
	public double getPrice(){
		return price;
	}
	
	public void setPrice(double price){
		this.price = price;
	}
	
	public int getQuantity(){
		return quantity;
	}
	
	public void setQuantity(int quantity){
		this.quantity = quantity;
	}
	
	public String getSearchAndFavouriteImageLink(){
		return searchAndFavouriteImageLink;
	}
	
	public void setSearchAndFavouriteImageLink(String searchAndFavouriteImageLink){
		this.searchAndFavouriteImageLink = searchAndFavouriteImageLink;
	}
	
	public String getHotImageLink(){
		return hotImageLink;
	}
	
	public void setHotImageLink(String hotImageLink){
		this.hotImageLink = hotImageLink;
	}
	
	public String getItemPageLink1(){
		return itemPageLink1;
	}
	
	public void setItemPageLink1(String itemPageLink){
		this.itemPageLink1 = itemPageLink;
	}
	
	public String getItemPageLink2(){
		return itemPageLink2;
	}
	
	public void setItemPageLink2(String itemPageLink){
		this.itemPageLink2 = itemPageLink;
	}
	
	public String getItemPageLink3(){
		return itemPageLink3;
	}
	
	public void setItemPageLink3(String itemPageLink){
		this.itemPageLink3 = itemPageLink;
	}
	
	public String getItemPageLink4(){
		return itemPageLink4;
	}
	
	public void setItemPageLink4(String itemPageLink){
		this.itemPageLink4 = itemPageLink;
	}
}
