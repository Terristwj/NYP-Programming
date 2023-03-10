package BookstoreApp.controller;

import java.io.IOException;
import java.util.ArrayList;
import org.mapdb.BTreeMap;
import org.mapdb.DB;
import BookstoreApp.BookstoreViewApp;
import BookstoreApp.model.OrderedItem;
import BookstoreApp.model.Order;
import BookstoreApp.model.Student;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.HPos;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.stage.Stage;

public class PurchaseHistoryController {
	@FXML
	private Button btnLogout;
	
	@FXML
	private GridPane gridPane;
	
	@FXML
	private VBox vBox;
	
	@FXML
	private Button btnCart;
	
	@FXML
	private Button btnBackHome;

	private String currentUser = LoginController.currentUser;

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
		BTreeMap<String, Student> studentMap = database.getTreeMap("student");

		Student student = studentMap.get(currentUser);
		ArrayList<Order> purchaseHistory = student.getPurchaseHistory();
		int positionNum = 1;
		
		//Refer to each order number in students purchase history
		for(Order oneOrder: purchaseHistory ) {

			ArrayList<OrderedItem> orderedItems = oneOrder.getOrderList();
			String items = "";
			
			for (int y = 0; y < orderedItems.size(); y++) {
				OrderedItem oneItem = orderedItems.get(y);//get the list of ordered items and put in the table form
				String name = oneItem.getName();//get the item from the user
				int itemQuantity = oneItem.getItemQuantity();//get the quanity of item from the user
				
				String line = name + " x " + itemQuantity;
				
				if (y == 0) {
					items += line; //As item increment by 1 , the line will follow the incremented number of the item
				}
				else {
					items += "\n" + line; //Make the item appear line by line
				}
			}
			
			Label lblOrderDate = new Label("lblDate" + positionNum);//create a storage space for date
			lblOrderDate.setFont(new Font(25.0));
			lblOrderDate.setText(oneOrder.getDate());//add the value of the date into the storage space
			gridPane.add(lblOrderDate, 0, positionNum);//display the date in 
			GridPane.setHalignment(lblOrderDate, HPos.CENTER); 
			
			Label lblOrderedItems = new Label("lblitems" + positionNum ); //create a storage space for the total price as the "x" loop through the array list.
			lblOrderedItems.setFont(new Font(25.0));
			lblOrderedItems.setText(items); //add the value into the the storage space.
			gridPane.add(lblOrderedItems, 1, positionNum);
			GridPane.setHalignment(lblOrderedItems, HPos.CENTER);
			
			Label lblGrandTotal = new Label("lblGrandTotal" + positionNum); //create storage space for unit price.
			lblGrandTotal.setFont(new Font(25.0));
			lblGrandTotal.setText(String.format("%.2f",oneOrder.getTotalPrice())); //add the value of the unit price into the storage space.
			gridPane.add(lblGrandTotal, 2, positionNum); //display the unit price in 5th column and the number of rows that they are being positioned depends on the number of added items that are in the cart.
			GridPane.setHalignment(lblGrandTotal, HPos.CENTER); 
			
			
			vBox.setPrefHeight(vBox.getPrefHeight()+12*orderedItems.size());
			gridPane.setPrefHeight(vBox.getPrefHeight());
			
			positionNum++;
		}		
		
	}
	
	
	@FXML
	private void handleCart(ActionEvent event) throws IOException {
		HomeController.backSetting = "Purchase History";
		Parent viewCart = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/12 - Cart.fxml"));
		Scene viewCartScene = new Scene(viewCart,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewCartScene);
		window.setTitle("Cart");
		window.show();
	}
	
	@FXML
	private void handleLogout(ActionEvent event) throws IOException {
		Parent viewLogoutAlert = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/15 - Logout Alert.fxml"));
		Scene viewLogoutAlertScene = new Scene(viewLogoutAlert,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewLogoutAlertScene);
		window.setTitle("Logout Alert");
		window.show();
	}
	
	@FXML
	private void handleBackHome(ActionEvent event) throws IOException {
		Parent viewLogout = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/2 - Home.fxml"));
		Scene viewLogoutScene = new Scene(viewLogout,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewLogoutScene);
		window.setTitle("Home");
		window.show();
	}
}
