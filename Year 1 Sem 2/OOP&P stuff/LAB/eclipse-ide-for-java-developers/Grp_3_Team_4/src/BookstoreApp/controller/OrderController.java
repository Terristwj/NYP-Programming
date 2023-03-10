package BookstoreApp.controller;

import javafx.fxml.FXML;
import java.util.Date;
import javafx.fxml.FXMLLoader;
import javafx.geometry.HPos;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import java.io.IOException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentNavigableMap;
import org.mapdb.BTreeMap;
import org.mapdb.DB;
import BookstoreApp.BookstoreViewApp;
import BookstoreApp.model.OrderedItem;
import BookstoreApp.model.Voucher;
import BookstoreApp.model.Item;
import BookstoreApp.model.Order;
import BookstoreApp.model.Student;
import javafx.event.ActionEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.control.Label;
import javafx.scene.control.RadioButton;
import javafx.scene.control.ToggleGroup;
import javafx.scene.layout.GridPane;
import javafx.scene.text.Font;
import javafx.stage.Stage;

public class OrderController {
	@FXML
	private AnchorPane AnchorPane;
	
	@FXML
	private Button btnCancel;
	
	@FXML
	private Label errorMessage;
	
	@FXML
	private GridPane gridPane;
	
	@FXML
	private RadioButton cash;
	
	@FXML
	private RadioButton card;
	
	@FXML
	private Button btnConfirm;
	
	@FXML
	private Button btnBack;
	
	@FXML
	private Button btnLogout;
	
	@FXML
	private Label subtotal;
	
	@FXML
	private Label gstValue;
	
	@FXML
	private Label voucherDiscount;
	
	@FXML
	private Label membershipDiscount;
	
	@FXML
	private Label grandtotal;
	
	@FXML
	private ToggleGroup payment;
	
	private String currentUser = LoginController.currentUser;
	
	public boolean checkPayment;
	
	private ArrayList<OrderedItem> cart;
	
	private static ArrayList<Voucher> usedVouchers;
	
	private static final double memberDiscountPercent = 0.10;

	private ConcurrentNavigableMap<String, Student> studentDataTable = BookstoreViewApp.studentDataTable;
	
	private ConcurrentNavigableMap<String, Item> itemDataTable = BookstoreViewApp.itemDataTable;
	
	private ConcurrentNavigableMap<String, Voucher> voucherDataTable = BookstoreViewApp.voucherDataTable;

	private static DB database = BookstoreViewApp.database;
	
	Order orderForm;
	
	public static int trackOrderNum;
	
	protected static String queueNum;
	
	private BookstoreViewApp mainapp;
	
	public BookstoreViewApp getMainApp() {
		return mainapp;
	}
	
	public void setMainApp(BookstoreViewApp mainapp) {
		this.mainapp = mainapp;
	}
	
	public void initialize () {
		//Set variable to false to indicate that scene displayed is not the login scene
		BookstoreViewApp.checkPageLogin = false;
		
		//If user came from cart page
		if (CartController.checkCart == true) {
			usedVouchers = CartController.usedVouchers;
			cart = CartController.cart;//to get arraylist from cart controller
			orderForm = new Order();//create a new order object
			checkPayment = false; //set value for checkpayment
			displaySelectedPdts();//display selected items from arraylist called cart in order controller.
		} 
		//If user came from reservation page
		else if (ReservationController.checkReserve == true) {
			usedVouchers = ReservationController.usedVouchers;
			cart = ReservationController.reserve;//to get arraylist from reservation controller.
			orderForm = new Order();//create a new order object
			checkPayment = false;//set value for checkpayment
			displaySelectedPdts();//display selected items from arraylist called cart in order controller.
		}
	}
	
	public void displaySelectedPdts(){	
		DecimalFormat twoDecimal = new DecimalFormat("0.00");
		
		int positionNum = 1;
		double SubTotal = 0.0;
		
		for(int x = 0; x < cart.size(); x++){
			OrderedItem oneItem = cart.get(x);
			
			Label lblItem = new Label("lblItem" + positionNum); //create a storage space for every item in the cartList as the "x" loop through the array list.
			lblItem.setFont(new Font(25));
			lblItem.setText(oneItem.getName()); // add the value into the storage space. 
			gridPane.add(lblItem, 0, positionNum); //add item name in 1st column and the number of rows that they are being positioned depends on the number of added items that are in the cart. (starting from 2nd row as the header is included)
			GridPane.setHalignment(lblItem, HPos.CENTER); 
			
			Label lblQty = new Label("lblQty" + positionNum); //create a storage space for every item in the cartList as the "x" loop through the array list.
			lblQty.setFont(new Font(25));
			lblQty.setText(Integer.toString(oneItem.getItemQuantity())); // add the value into the storage space. 
			gridPane.add(lblQty, 1, positionNum); //add item name in 1st column and the number of rows that they are being positioned depends on the number of added items that are in the cart. (starting from 2nd row as the header is included)
			GridPane.setHalignment(lblQty, HPos.CENTER); 
			
			Label lblPrice = new Label("lblPrice" + positionNum); //create storage space for unit price.
			lblPrice.setFont(new Font(25));
			lblPrice.setText(twoDecimal.format(oneItem.getPrice())); //add the value of the unit price into the storage space.
			gridPane.add(lblPrice, 2, positionNum);
			GridPane.setHalignment(lblPrice, HPos.CENTER); 
			
			double totalPrice = oneItem.getPrice() * oneItem.getItemQuantity();
			Label lbltotalPrice = new Label("lbltotalprice" + positionNum ); //create a storage space for the total price as the "x" loop through the array list.
			lbltotalPrice.setFont(new Font(25));
			lbltotalPrice.setText(String.format("%.2f", totalPrice)); //add the value into the the storage space.
			gridPane.add(lbltotalPrice, 3, positionNum); //add and display total price in the 4th column and the number of rows that they are being positioned depends on the number of added items that are in the cart.
			GridPane.setHalignment(lbltotalPrice, HPos.CENTER); 
			
			SubTotal = SubTotal + totalPrice;
			
			positionNum++;	
		}		
		
		subtotal.setText(twoDecimal.format(SubTotal));
		
		//Check if student has membership
		BTreeMap<String, Student> studentMap = database.getTreeMap("student");
		
		Student oneStudent = studentMap.get(currentUser);
		
		double membershipDiscountPrice = 0.0;
		
		//If student has membership, calculate discounted price
		if (oneStudent.getMembershipStatus().equals("Yes")) {
			membershipDiscountPrice = SubTotal * memberDiscountPercent;
			
			membershipDiscount.setText(twoDecimal.format(membershipDiscountPrice));
		}
		else {
			membershipDiscount.setText("------");
		}
		
		double voucherDiscountPrice = 0.0;
		
		//Check if there is any vouchers used
		if (usedVouchers.size() != 0) {
			//Calculate total discount from used 
			for (int i = 0; i < usedVouchers.size(); i++) {
				Voucher oneVoucher = usedVouchers.get(i);
				
				double discountValue = oneVoucher.getDiscountValue();
				
				voucherDiscountPrice += discountValue;
			}
			
			voucherDiscount.setText(twoDecimal.format(voucherDiscountPrice));
		} else {
			//If no voucher is used, set text to null
			voucherDiscount.setText("------");
		}
		
		double gst = SubTotal * 0.07;
		
		gstValue.setText(twoDecimal.format(gst)); //add the value of the unit price into the storage space.
		
		double finalTotal = SubTotal - membershipDiscountPrice - voucherDiscountPrice + gst;
		
		//If discount exceeds grand total amount, set it to zero.
		if (finalTotal<0) {
			finalTotal = 0.0;
			grandtotal.setText(twoDecimal.format(finalTotal));
		} else if (finalTotal >= 0) {
			grandtotal.setText(twoDecimal.format(finalTotal));
		}
	}

	@FXML
	public void handleCancel(ActionEvent event) throws IOException {
		if (CartController.checkCart == true) {
			usedVouchers = new ArrayList<Voucher>();
			CartController.usedVouchers = new ArrayList<Voucher>();
			ReservationController.usedVouchers = new ArrayList<Voucher>();
			Parent viewCart = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/12 - Cart.fxml"));
			Scene viewCartScene = new Scene(viewCart,1300,850);
			Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
			window.setScene(viewCartScene);
			window.setTitle("Cart");
			window.show();
		} else if (ReservationController.checkReserve == true) {
			usedVouchers = new ArrayList<Voucher>();
			CartController.usedVouchers = new ArrayList<Voucher>();
			ReservationController.usedVouchers = new ArrayList<Voucher>();
			Parent viewReservation = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/11 - Reservation.fxml"));
			Scene viewReservationScene = new Scene(viewReservation,1300,850);
			Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
			window.setScene(viewReservationScene);
			window.setTitle("Reservation");
			window.show();
		}
	}
	
	@FXML
	public void handleRadioButton(ActionEvent event){
		if(cash.isSelected()){			
			//set payment as cash
			checkPayment = true;//if user select payment as cash
			orderForm.setCash("Cash");//set payment as cash
			orderForm.setCard("");//set payment as cash
		}
		
		if(card.isSelected()){
			//set payment as credit
			checkPayment = true; //if user select payment as card
			orderForm.setCash("");//set payment as null
			orderForm.setCard("Credit");//set value as null if cash is selected.
		}
	}
	
	public void createOrder(ArrayList<OrderedItem> cart) {
		//Create time stamp of order
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date date = new Date();
		String timeStamp = dateFormat.format(date);
		orderForm.setDate(timeStamp);
		
		//Puts in items purchased by customer
		orderForm.setOrderList(cart);
		
		//Store grandtotal of order into order object
		double totalPrice = Double.parseDouble(grandtotal.getText());
		orderForm.setTotalPrice(totalPrice);	
	}
	
	@FXML
	public void handleConfirm(ActionEvent event) throws IOException {
		BTreeMap<String, Student> studentMap = database.getTreeMap("student");
		
		if (checkPayment == true) {
			//Make vouchers unusable for next use
			for (int i = 0; i < usedVouchers.size(); i++) {
				Voucher oneVoucher = usedVouchers.get(i);
				String code = oneVoucher.getCode();
				oneVoucher.setUsed(1);
				voucherDataTable.replace(code, oneVoucher);
			}
			//Clear used codes list for next use
			usedVouchers = new ArrayList<Voucher>();
			
			if (CartController.checkCart == true) {
				CartController.cart = new ArrayList<OrderedItem>();
				CartController.usedVouchers = new ArrayList<Voucher>();
				ReservationController.usedVouchers = new ArrayList<Voucher>();
			} else if (ReservationController.checkReserve == true) {
				ReservationController.reserve = new ArrayList<OrderedItem>();
				ReservationController.usedVouchers = new ArrayList<Voucher>();
				CartController.usedVouchers = new ArrayList<Voucher>();
			}
			
			CartController.checkCart = false;
			ReservationController.checkReserve = false;
			
			//Create order object and store into student
			createOrder(cart);
			generateNum();
			
			//Update stock quantity since purchase is confirmed
			updateItemDatabase();
			
			//Add new order number into existing arraylist of order forms and store into student object
			//and replace exisiting student object with new instantiated student object
			Student oneStudent = studentMap.get(currentUser);
			ArrayList<Order> purchases = oneStudent.getPurchaseHistory();
			purchases.add(orderForm);
			
			oneStudent.setPurchaseHistory(purchases);
			studentDataTable.put(currentUser, oneStudent);
			database.commit();
			
			Parent viewOrderSuccess = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/14 - Order Successful.fxml"));
			Scene viewOrderSuccessScene = new Scene(viewOrderSuccess,1300,850);
			Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
			window.setScene(viewOrderSuccessScene);
			window.setTitle("Order successfully sent");
			window.show();
		}
		else {
			errorMessage.setText("Select payment type");
		}
	}
	
	//Update stock quantity for each item related to the order
	public void updateItemDatabase() {
		BTreeMap<String, Item> itemMap = database.getTreeMap("item");
		
		for (int i = 0; i < cart.size(); i ++) {
			OrderedItem oneOrderedItem = cart.get(i);
			
			String itemName = oneOrderedItem.getName();
			int quantity = oneOrderedItem.getItemQuantity();
			
			Item oneItem = itemMap.get(itemName);
			int stockQuantity = oneItem.getQuantity();
			
			int newQuantity = stockQuantity - quantity;
			oneItem.setQuantity(newQuantity);
			
			itemDataTable.replace(itemName, oneItem);
		}
	}
	
	//This method handles the order number between 0 to 1000
	public void generateNum() {
		
		//If there is no queue number, set it to 1
		if (queueNum == null) {
			queueNum = "1";
			trackOrderNum = 1;
		}
		//If tracked order number is 1, increase it by 1 and store value into queueNum
		else if (trackOrderNum == 1) {
			trackOrderNum += 1;
			queueNum = String.valueOf(trackOrderNum);
		}
		//If order number reaches 4000, go back to 1 and store value into queueNum
		else if (trackOrderNum == 4000) {
			trackOrderNum = 1;
			queueNum = String.valueOf(trackOrderNum);
		}
		//If tracked order number is more than 1, increase it by 1 and store value into queueNum
		else {
			trackOrderNum += 1;
			queueNum = String.valueOf(trackOrderNum);
		}
		
	}
	
	@FXML
	public void handleBack(ActionEvent event) throws IOException {
		if (CartController.checkCart == true) {
			usedVouchers = new ArrayList<Voucher>();
			Parent viewCart = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/12 - Cart.fxml"));
			Scene viewCartScene = new Scene(viewCart,1300,850);
			Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
			window.setScene(viewCartScene);
			window.setTitle("Cart");
			window.show();
		} else if (ReservationController.checkReserve == true) {
			usedVouchers = new ArrayList<Voucher>();
			Parent viewReservation = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/11 - Reservation.fxml"));
			Scene viewReservationScene = new Scene(viewReservation,1300,850);
			Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
			window.setScene(viewReservationScene);
			window.setTitle("Reservation");
			window.show();
		}
	}
	
	@FXML
	public void handleLogout(ActionEvent event) throws IOException {
		usedVouchers = new ArrayList<Voucher>();
		CartController.usedVouchers = new ArrayList<Voucher>();
		ReservationController.usedVouchers = new ArrayList<Voucher>();
		Parent viewLogoutAlert = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/15 - Logout Alert.fxml"));
		Scene viewLogoutAlertScene = new Scene(viewLogoutAlert,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewLogoutAlertScene);
		window.setTitle("Logout Alert");
		window.show();
	}
}
