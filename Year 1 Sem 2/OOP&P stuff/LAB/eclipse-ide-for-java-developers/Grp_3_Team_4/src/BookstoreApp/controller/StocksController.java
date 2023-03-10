package BookstoreApp.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import org.mapdb.BTreeMap;
import org.mapdb.DB;
import BookstoreApp.BookstoreViewApp;
import BookstoreApp.model.Item;
import javafx.animation.PauseTransition;
import javafx.beans.property.BooleanProperty;
import javafx.beans.property.SimpleBooleanProperty;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.util.Duration;

public class StocksController {
	
	@FXML
	private TextField searchText;
	
	@FXML
	private Label errorMessage;
	
	@FXML
	private Label itemDescription;
	
	@FXML
	private Label itemQuantity;
	
	@FXML
	private Label itemName;
	
	@FXML
	private Label itemPrice;
	
	@FXML
	private Button btnUpdatePrice;
	
	@FXML
	private Button btnUpdateDesc;
	
	@FXML
	private Button btnUpdateQuantity;
	
	@FXML
	private Button btnBackMenu;
	
	@FXML
	private Button btnLogout;
	
	@FXML
	private Button btnAddItem;
	
	@FXML
	private Button btnRemoveItem;
	
	public static String itemKey;
	
	private static DB database = BookstoreViewApp.database;
	
	private String removedItemKey = RemoveItemDialogueController.itemKey;

	private BookstoreViewApp mainapp;
	
	private Stage primaryStage;
	
	public Stage getPrimaryStage() {
		return primaryStage;
	}
	
	public BookstoreViewApp getMainApp() {
		return mainapp;
	}
	
	public void setMainApp(BookstoreViewApp mainapp) {
		this.mainapp = mainapp;
	}
	
	public void initialize() {
		//Set variable to false to indicate that scene displayed is not the login scene
		BookstoreViewApp.checkPageLogin = false;
	}
	
	//This method gets the item by comparing user input against database information
	@FXML
	private void handleGetItem(ActionEvent event) throws IOException {
		
		BTreeMap<String, Item> itemMap = database.getTreeMap("item");
		
		String name;
		
		String input;
		
		boolean checkValid = false;
		
		//Get user input
		input = searchText.getText();
		
		//Take the tree map keys into a arraylist-like form and looping through it
		for (String key1 : itemMap.keySet()) {
			Item oneItem = itemMap.get(key1);
			
			name = oneItem.getName();//Each loop generates a new item object
			
			//If user input matches with database, display the item's information
			if (input.equalsIgnoreCase(name)) {
				checkValid = true;

				itemKey = name;
				
				refreshPage(oneItem);
			}
		}
		//If user input does not match any information in database, display error message
		if (checkValid == false) {
			errorMessage.setText("Please enter full name of the item");
		} else {
			errorMessage.setText("");
		}
	}
	
	//This method creates a dialog scene for the user to continue the process of adding a new item to the shop
	@FXML
	private void handleAddItem(ActionEvent event) {
		try {
			FXMLLoader loader=new FXMLLoader(); // to load view
			loader.setLocation(getClass().getResource("/BookstoreApp/view/22 - AddItemDialogue.fxml"));
			AnchorPane root = loader.load();
			AddItemDialogueController dialogCtrl=loader.getController();
			Scene scene = new Scene(root,700,435);
			Stage dialogStage = new Stage();
			dialogStage.setTitle("Add new item to shop");			
			dialogStage.setScene(scene);
			dialogStage.initModality(Modality.WINDOW_MODAL);
			dialogStage.initOwner(primaryStage);
			dialogCtrl.setDialogStage(dialogStage);
			
			//This mouse event listener is for taking action if mouse is idling/inactive
	        BooleanProperty mouseMoving = new SimpleBooleanProperty();
	        mouseMoving.addListener((obs, wasMoving, isNowMoving) -> {
	        	//If mouse is in idle/inactive,
		        if (! isNowMoving) {
		        	dialogStage.close();
		        }
	        });
	        
	        //Set amount of time in minutes before user is counted as inactive
	        PauseTransition pause = new PauseTransition(Duration.minutes(2.5));
	        pause.setOnFinished(e -> mouseMoving.set(false));
	        
	        //Set as mouse moving first
	        root.addEventHandler(MouseEvent.ANY, e -> {
	            mouseMoving.set(true);
	            pause.playFromStart();
	        });
	        
			dialogStage.showAndWait();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//This method creates a dialog scene for the user to continue the process of removing an item from the shop
	@FXML
	private void handleRemoveItem (ActionEvent event) {
		String input = searchText.getText();
		
		try {
			FXMLLoader loader=new FXMLLoader(); // to load view
			loader.setLocation(getClass().getResource("/BookstoreApp/view/27 - RemoveItemDialogue.fxml"));
			AnchorPane root = loader.load();
			RemoveItemDialogueController dialogCtrl=loader.getController();
			Scene scene = new Scene(root,700,300);
			Stage dialogStage = new Stage();
			dialogStage.setTitle("Remove item from shop");			
			dialogStage.setScene(scene);
			dialogStage.initModality(Modality.WINDOW_MODAL);
			dialogStage.initOwner(primaryStage);
			dialogCtrl.setDialogStage(dialogStage);
			
			//This mouse event listener is for taking action if mouse is idling/inactive
	        BooleanProperty mouseMoving = new SimpleBooleanProperty();
	        mouseMoving.addListener((obs, wasMoving, isNowMoving) -> {
	        	//If mouse is in idle/inactive,
		        if (! isNowMoving) {
		        	dialogStage.close();
		        }
	        });
	        
	        //Set amount of time in minutes before user is counted as inactive
	        PauseTransition pause = new PauseTransition(Duration.minutes(2.5));
	        pause.setOnFinished(e -> mouseMoving.set(false));
	        
	        //Set as mouse moving first
	        root.addEventHandler(MouseEvent.ANY, e -> {
	            mouseMoving.set(true);
	            pause.playFromStart();
	        });
	        
			dialogStage.showAndWait();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			//If current page is display removed item, set all values dash and zero respectively
			if (input.equals(removedItemKey)) {
				Item newItem = new Item("---------", "0.00", "0", 0, 0, "---------", "", "", "", "", "");
				
				refreshPage(newItem);
			}
		}
		
		
	}
	
	//This method is used to update item description
	@FXML
	private void handleUpdateDesc(ActionEvent event) {
		BTreeMap<String, Item> itemMap = database.getTreeMap("item");
		
		//Get user input
		String input = searchText.getText();
		
		//If user does not give input, the line of codes in this if condition will not run
		if (itemKey != null) {
			Item oneItem = itemMap.get(itemKey);
			
			String name = oneItem.getName();
			
			if (name.equals(input)) {
				try {
					FXMLLoader loader=new FXMLLoader(); // to load view
					loader.setLocation(getClass().getResource("/BookstoreApp/view/25 - UpdateItemInformationDialogue.fxml"));
					AnchorPane root = loader.load();
					UpdateItemInformationDialogueController dialogCtrl=loader.getController();			
					Scene scene = new Scene(root,700,435);
					Stage dialogStage = new Stage();
					dialogStage.setTitle("Update item description");			
					dialogStage.setScene(scene);
					dialogStage.initModality(Modality.WINDOW_MODAL);
					dialogStage.initOwner(primaryStage);
					dialogCtrl.setDialogStage(dialogStage);
					
					//This mouse event listener is for taking action if mouse is idling/inactive
			        BooleanProperty mouseMoving = new SimpleBooleanProperty();
			        mouseMoving.addListener((obs, wasMoving, isNowMoving) -> {
			        	//If mouse is in idle/inactive,
				        if (! isNowMoving) {
				        	dialogStage.close();
				        }
			        });
			        
			        //Set amount of time in minutes before user is counted as inactive
			        PauseTransition pause = new PauseTransition(Duration.minutes(2.5));
			        pause.setOnFinished(e -> mouseMoving.set(false));
			        
			        //Set as mouse moving first
			        root.addEventHandler(MouseEvent.ANY, e -> {
			            mouseMoving.set(true);
			            pause.playFromStart();
			        });
					
					dialogStage.showAndWait();
				} catch(Exception e) {
					e.printStackTrace();
				} finally {
					Item newItem = itemMap.get(itemKey);
					
					refreshPage(newItem);
				}
			}
			else {
				errorMessage.setText("Please enter full name of the item");
			}
		}
		else {
			errorMessage.setText("Please enter a item name");
		}
	}
	
	//This method is used to update item price
	@FXML
	private void handleUpdatePrice(ActionEvent event) throws IOException {
		BTreeMap<String, Item> itemMap = database.getTreeMap("item");

		//Get user input
		String input = searchText.getText();
		
		//If user does not give input, the line of codes in this if condition will not run
		if (itemKey != null) {
			Item oneItem = itemMap.get(itemKey);
			
			String name = oneItem.getName();

			if (name.equals(input)) { 
				try {
					FXMLLoader loader=new FXMLLoader(); // to load view
					loader.setLocation(getClass().getResource("/BookstoreApp/view/24 - UpdatePriceDialogue.fxml"));
					AnchorPane root = loader.load();
					UpdatePriceDialogueController dialogCtrl=loader.getController();			
					Scene scene = new Scene(root,700,300);
					Stage dialogStage = new Stage();
					dialogStage.setTitle("Update item price");			
					dialogStage.setScene(scene);
					dialogStage.initModality(Modality.WINDOW_MODAL);
					dialogStage.initOwner(primaryStage);
					dialogCtrl.setDialogStage(dialogStage);
					
					//This mouse event listener is for taking action if mouse is idling/inactive
			        BooleanProperty mouseMoving = new SimpleBooleanProperty();
			        mouseMoving.addListener((obs, wasMoving, isNowMoving) -> {
			        	//If mouse is in idle/inactive,
				        if (! isNowMoving) {
				        	dialogStage.close();
				        }
			        });
			        
			        //Set amount of time in minutes before user is counted as inactive
			        PauseTransition pause = new PauseTransition(Duration.minutes(2.5));
			        pause.setOnFinished(e -> mouseMoving.set(false));
			        
			        //Set as mouse moving first
			        root.addEventHandler(MouseEvent.ANY, e -> {
			            mouseMoving.set(true);
			            pause.playFromStart();
			        });
			        
					dialogStage.showAndWait();
				} catch(Exception e) {
					e.printStackTrace();
				} finally {
					Item newItem = itemMap.get(itemKey);
					
					refreshPage(newItem);
				}
			}
			else {
				errorMessage.setText("Please enter full name of the item");
				
			}
		}
		else {
			errorMessage.setText("Please enter a item name");
		}
	}
	//This method is used to update item  quantity
	@FXML
	private void handleUpdateQuantity(ActionEvent event) throws IOException {
		BTreeMap<String, Item> itemMap = database.getTreeMap("item");
	
		//Get user input
		String input = searchText.getText();
		
		//If user does not give input, the line of codes in this if condition will not run
		if (itemKey != null) {
			Item oneItem = itemMap.get(itemKey);
			
			String name = oneItem.getName();
			
			if (name.equals(input)) {
				//Create a dialogue window and display
				try {
					FXMLLoader loader=new FXMLLoader(); // to load view
					loader.setLocation(getClass().getResource("/BookstoreApp/view/21 - UpdateQuantityDialogue.fxml"));
					AnchorPane root = loader.load();
					UpdateQuantityDialogueController dialogCtrl=loader.getController();			
					Scene scene = new Scene(root,700,300);
					Stage dialogStage = new Stage();
					dialogStage.setTitle("Update item quantity");			
					dialogStage.setScene(scene);
					dialogStage.initModality(Modality.WINDOW_MODAL);
					dialogStage.initOwner(primaryStage);
					dialogCtrl.setDialogStage(dialogStage);
					
					//This mouse event listener is for taking action if mouse is idling/inactive
			        BooleanProperty mouseMoving = new SimpleBooleanProperty();
			        mouseMoving.addListener((obs, wasMoving, isNowMoving) -> {
			        	//If mouse is in idle/inactive,
				        if (! isNowMoving) {
				        	dialogStage.close();
				        }
			        });
			        
			        //Set amount of time in minutes before user is counted as inactive
			        PauseTransition pause = new PauseTransition(Duration.minutes(2.5));
			        pause.setOnFinished(e -> mouseMoving.set(false));
			        
			        //Set as mouse moving first
			        root.addEventHandler(MouseEvent.ANY, e -> {
			            mouseMoving.set(true);
			            pause.playFromStart();
			        });
			        
					dialogStage.showAndWait();
				} catch(Exception e) {
					e.printStackTrace();
				} finally {
					Item newItem = itemMap.get(itemKey);
					
					refreshPage(newItem);
				}
			}
			else {
				errorMessage.setText("Please enter full name of the item");
			}
		}
		else {
			errorMessage.setText("Please enter a item name");
		}
	}
	
	public void refreshPage(Item oneItem) {
		DecimalFormat twoDecimal = new DecimalFormat("0.00");
		
		itemName.setText(oneItem.getName());
		itemPrice.setText("$" + twoDecimal.format(oneItem.getPrice()));
		itemQuantity.setText(String.valueOf(oneItem.getQuantity()));
		itemDescription.setText(oneItem.getDescription());
	}
	
	@FXML
	private void handleBackMenu(ActionEvent event) throws IOException {
		Parent viewStaffMenu = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/16 - Staff Menu.fxml"));
		Scene viewStaffMenuScene = new Scene(viewStaffMenu,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewStaffMenuScene);
		window.setTitle("Staff Menu");
		window.show();
	}
	
	@FXML
	public void handleLogout(ActionEvent event) throws IOException {
		Parent viewLogoutAlert = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/15 - Logout Alert.fxml"));
		Scene viewLogoutAlertScene = new Scene(viewLogoutAlert,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewLogoutAlertScene);
		window.setTitle("Logout Alert");
		window.show();
	}
}
