package BookstoreApp.controller;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.HPos;
import javafx.scene.control.Label;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import org.mapdb.DB;
import org.mapdb.BTreeMap;
import BookstoreApp.BookstoreViewApp;
import BookstoreApp.model.Voucher;
import BookstoreApp.model.OrderedItem;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.GridPane;
import javafx.scene.text.Font;
import javafx.stage.Stage;

public class CartController {
	@FXML
	private AnchorPane AnchorPane;
	
	@FXML
	private Button btnBackHome;
	
	@FXML
	private Button btnCheckout;
	
	@FXML
	private Button btnApplyMembership;
	
	@FXML
	private Button btnApplyVoucher;
	
	@FXML
	private Button btnLogout;
	
	@FXML
	private TextField voucherCode;
	
	@FXML
	private GridPane gridPane;
	
	@FXML
	private Label errorMessage;
	
	public static ArrayList<OrderedItem> cart = new ArrayList<OrderedItem>();
	
	private int itemNum = 0;
	
	public static boolean checkCart = false;
	
	public static ArrayList<Voucher> usedVouchers = new ArrayList<Voucher>();
	
	private static ArrayList<String> duplicateCodes = new ArrayList<String>();
	
	private static DB database = BookstoreViewApp.database;
	
	private BookstoreViewApp mainapp;
	
	public BookstoreViewApp getMainApp() {
		return mainapp;
	}
	
	public void setMainApp(BookstoreViewApp mainapp) {
		this.mainapp = mainapp;
	}
	
	public void initialize() {
		//Set variable to false to indicate that scene displayed is not the login scene
		BookstoreViewApp.checkPageLogin = false;
		
		BindGridPane();
	}
	
	public void BindGridPane(){
		DecimalFormat twoDecimal = new DecimalFormat("0.00");
		
		int positionNum = 1;
		
		for(int x = 0; x < cart.size(); x++){
			itemNum = x;

			OrderedItem oneItem = cart.get(x);
			
			Button rowHeight = new Button("rowHeight");	//creates invisible button at col/row 1 to set the height of each row
			rowHeight.setFont(new Font(25));
			rowHeight.setOpacity(0);
			gridPane.add(rowHeight, 0, positionNum);
			GridPane.setHalignment(rowHeight, HPos.CENTER); 
			
			Label lblItem = new Label("lblItem" + positionNum);
			lblItem.setFont(new Font(25.0));
			lblItem.setText(oneItem.getName());
			gridPane.add(lblItem, 0, positionNum);
			GridPane.setHalignment(lblItem, HPos.CENTER); 
						
			Label txtQty = new Label("txtQty" + positionNum); //create a storage space for the number of quantity  as the "x" loop through the array list.
			txtQty.setFont(new Font(25.0));
			txtQty.setText(Integer.toString(oneItem.getItemQuantity())); //add the value into the storage space.
			gridPane.add(txtQty, 2, positionNum); 
			GridPane.setHalignment(txtQty, HPos.CENTER); 
			
			double totalPrice = oneItem.getPrice() * oneItem.getItemQuantity();
			Label lbltotalPrice = new Label("lbltotalprice" + positionNum ); //create a storage space for the total price as the "x" loop through the array list.
			lbltotalPrice.setFont(new Font(25.0));
			lbltotalPrice.setText(String.format("%.2f", totalPrice)); //add the value into the the storage space.
			gridPane.add(lbltotalPrice, 5, positionNum);
			GridPane.setHalignment(lbltotalPrice, HPos.CENTER); 
			
			Button btnMinus = new Button("btnMinus" + positionNum); //create the same number of storage spaces as the number of items that are in the cart, while "x" loop through the array list. 
			btnMinus.setFont(new Font(20));
			btnMinus.setText("-"); //store the symbol in the respective storage spaces.
			
			btnMinus.setOnAction(new EventHandler<ActionEvent>() {
				@Override
				public void handle(ActionEvent Arg0){
					if (oneItem.getItemQuantity() > 1){ //set a limit such that when the quantity is 0, user can no longer decrease.
						int qty = oneItem.getItemQuantity(); //invoke the method to store the quantity value inside the "int qty".
						qty--; //user can decrease the quantity as they wish.
						
						oneItem.setItemQuantity(qty); //set the final quantity value into cartItem.
						cart.set(itemNum, oneItem);
						
						txtQty.setText(Integer.toString(qty)); //convert the value's integer Type into String value
						
						double totalPrice = oneItem.getPrice() * oneItem.getItemQuantity();
						lbltotalPrice.setText(String.format("%.2f", totalPrice)); //display out the total price.
					}
				}
			});
			gridPane.add(btnMinus, 1, positionNum); //add minus button in 2nd column and the number of rows that they are being positioned depends on the number of added items that are in the cart.
			GridPane.setHalignment(btnMinus, HPos.CENTER);
			
			Button btnPlus = new Button("btnPlus" + positionNum);
			btnPlus.setFont(new Font(20));
			btnPlus.setText("+");
			btnPlus.setOnAction(new EventHandler<ActionEvent>() {
				@Override
				public void handle(ActionEvent Arg0){
					int qty = oneItem.getItemQuantity();
					qty++;
					
					oneItem.setItemQuantity(qty); //set the final quantity value into cartItem.
					cart.set(itemNum, oneItem);
					
					txtQty.setText(Integer.toString(qty));
					
					double totalPrice = oneItem.getPrice() * oneItem.getItemQuantity();
					lbltotalPrice.setText(String.format("%.2f", totalPrice));
				}
			});
			gridPane.add(btnPlus, 3, positionNum);	 //add plus button in 4th column and the number of rows that they are being positioned depends on the number of added items that are in the cart.		
			GridPane.setHalignment(btnPlus, HPos.CENTER);
			
			Label lblPrice = new Label("lblPrice" + positionNum); //create storage space for unit price.
			lblPrice.setFont(new Font(25.0));
			lblPrice.setText(twoDecimal.format(oneItem.getPrice())); //add the value of the unit price into the storage space.
			gridPane.add(lblPrice, 4,positionNum); //display the unit price in 5th column and the number of rows that they are being positioned depends on the number of added items that are in the cart.
			GridPane.setHalignment(lblPrice, HPos.CENTER); 						
			
			Button btnRemove = new Button("btnRemove" + positionNum); //create storage space for the remove button
			btnRemove.setFont(new Font(20));
			btnRemove.setText("X"); // add "x" symbol in the storage space
			
			btnRemove.setOnAction(new EventHandler<ActionEvent>() {
				@Override
				public void handle(ActionEvent Arg0){				
					cart.remove(itemNum);
					gridPane.getChildren().retainAll(gridPane.getChildren().get(0)); //to prevent the entire controllers from being deleted when user remove one of the items that they have selected.
					BindGridPane();
				}
			});
			gridPane.add(btnRemove, 6, positionNum); //add the remove button in 7th column and the number of rows that they are being positioned depends on the number of added items that are in the cart.			
			GridPane.setHalignment(btnRemove, HPos.CENTER);
			
			positionNum++;
		}		
		
	}
	
	@FXML
	public void handleCheckout(ActionEvent event) throws IOException {
		//If cart is not empty, continue to order for checkout.
		if (cart.size() != 0 || cart != null) {
			checkCart = true;
			duplicateCodes = new ArrayList<String>();
			Parent viewOrder = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/13 - Order.fxml"));
			Scene viewOrderScene = new Scene(viewOrder,1300,850);
			Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
			window.setScene(viewOrderScene);
			window.setTitle("Order");
			window.show();
		}
	}
	
	@FXML
	public void handleApplyVoucher(ActionEvent event) {
		BTreeMap<String, Voucher> voucherMap = database.getTreeMap("voucher");
		
		String input = voucherCode.getText();
		
		boolean checkValid = false;
		
		boolean checkDuplicate = false;
		
		//Check if coupon code given exists in database
		for (String key: voucherMap.keySet()) {
			Voucher oneVoucher = voucherMap.get(key);
			
			String code = oneVoucher.getCode();
			
			if (input.equals(code)) {
				checkValid = true;
				
				if (oneVoucher.getUsed() == 0) {
					//To check if arraylist duplicateCodes contains any data, if there is no data, continue on.
					if (duplicateCodes != null) {
						//Checks through arraylist duplicateCodes for vouchers that have been used
						for (int i = 0; i < duplicateCodes.size(); i ++) {
							String duplicateCode = duplicateCodes.get(i);
							
							if (code.equals(duplicateCode)) {
								checkDuplicate = true;
							}
						}
					}
					//If Code has been used, error message is displayed
					if (checkDuplicate == true) {
						errorMessage.setText("Voucher can only be used once");
					}
					//If code has not been used, add it to usedCodes arraylist to reuse 
					//and duplicate codes arraylist to check for vouchers being used twice.
					if (checkDuplicate == false){
						duplicateCodes.add(code);
						usedVouchers.add(oneVoucher);
					}
				}
				else {
					errorMessage.setText("Voucher has been used");
				}
			}
		}
		
		if (checkValid == false) {
			errorMessage.setText("Invalid voucher code");
		}
	}
	
	@FXML
	public void handleBackHome(ActionEvent event) throws IOException {
		duplicateCodes = new ArrayList<String>();
		usedVouchers = new ArrayList<Voucher>();
		if (HomeController.backSetting.equals("Homepage")) {
			Parent viewBack = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/2 - Home.fxml"));
			Scene viewBackScene = new Scene(viewBack,1300,850);
			Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
			window.setScene(viewBackScene);
			window.setTitle("Home");
			window.show();
		} else if (HomeController.backSetting.equals("Search")) {
			Parent viewSearch = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/5 - Search.fxml"));
			Scene viewSearchScene = new Scene(viewSearch,1300,850);
			Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
			window.setScene(viewSearchScene);
			window.setTitle("Search");
			window.show();
		} else if (HomeController.backSetting.equals("Item Page")) {
			Parent viewItemPage = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/6 - Item Page.fxml"));
			Scene viewItemPageScene = new Scene(viewItemPage,1300,850);
			Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
			window.setScene(viewItemPageScene);
			window.setTitle("Item page");
			window.show();
		} else if (HomeController.backSetting.equals("Instruction")) {
			Parent viewInstruction = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/3 - Instruction.fxml"));
			Scene viewInstructionScene = new Scene(viewInstruction,1300,850);
			Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
			window.setScene(viewInstructionScene);
			window.setTitle("Instruction");
			window.show();
		} else if (HomeController.backSetting.equals("Hottest Item")) {
			Parent viewHottestItems = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/7 - Hot Items.fxml"));
			Scene viewHottestItemsScene = new Scene(viewHottestItems,1300,850);
			Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
			window.setScene(viewHottestItemsScene);
			window.setTitle("Hot items");
			window.show();
		} else if (HomeController.backSetting.equals("Favourite")) {
			Parent viewFavourites = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/4 - Favourite.fxml"));
			Scene viewFavouritesScene = new Scene(viewFavourites,1300,850);
			Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
			window.setScene(viewFavouritesScene);
			window.setTitle("Favourite");
			window.show();
		} else if (HomeController.backSetting.equals("Purchase History")) {
			Parent viewPurchaseHistory = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/8 - Purchase History.fxml"));
			Scene viewPurchaseHistoryScene = new Scene(viewPurchaseHistory,1300,850);
			Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
			window.setScene(viewPurchaseHistoryScene);
			window.setTitle("Purhcase History");
			window.show();
		} else if (HomeController.backSetting.equals("Feedback")) {
			Parent viewFeedback = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/9 - Feedback.fxml"));
			Scene viewFeedbackScene = new Scene(viewFeedback,1300,850);
			Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
			window.setScene(viewFeedbackScene);
			window.setTitle("Feedback");
			window.show();
		}
	}

	@FXML
	public void handleLogout(ActionEvent event) throws IOException {
		duplicateCodes = new ArrayList<String>();
		usedVouchers = new ArrayList<Voucher>();
		Parent viewLogoutAlert = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/15 - Logout Alert.fxml"));
		Scene viewLogoutAlertScene = new Scene(viewLogoutAlert,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewLogoutAlertScene);
		window.setTitle("Logout Alert");
		window.show();
	}
}
