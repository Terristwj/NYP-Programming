package BookstoreApp.model;

import java.io.Serializable;
import java.util.ArrayList;

public class Order implements Serializable{
	
	private static final long serialVersionUID = -2820627970963985785L;
	
	private String date;

	private String cash;
	
	private String card;
	
	private ArrayList<OrderedItem> orderList = new ArrayList<OrderedItem>(); 
	
	private double totalPrice;
	
	public Order () {
		
	}
	
	public Order(ArrayList<OrderedItem> orderList, double totalPrice, String date) {
		this.orderList = orderList;
		this.totalPrice = totalPrice;
		this.date = date;
	}
	
	public Order(String cash, String card, ArrayList<OrderedItem> orderList, double totalPrice, String date){
		this.cash = cash;
		this.card = card;
		this.orderList = orderList;
		this.totalPrice = totalPrice;
		this.date = date;
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public ArrayList<OrderedItem> getOrderList() {
		return orderList;
	}

	public void setOrderList(ArrayList<OrderedItem> orderList) {
		this.orderList = orderList;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public void setCash(String cash){
		this.cash=cash;
	}
	
	public String getCash(){
		return cash;
	}
	
	public void setCard(String card){
		this.card=card;
	}
	
	public String getCard(){
		return card;
	}

}
