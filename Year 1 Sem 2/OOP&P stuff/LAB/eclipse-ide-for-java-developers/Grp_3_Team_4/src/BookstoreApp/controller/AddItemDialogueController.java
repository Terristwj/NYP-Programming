package BookstoreApp.controller;

import javafx.fxml.FXML;

import javafx.scene.control.Button;

import javafx.scene.control.TextField;
import javafx.stage.Stage;
import java.util.concurrent.ConcurrentNavigableMap;
import org.mapdb.DB;
import BookstoreApp.BookstoreViewApp;
import BookstoreApp.model.Item;
import javafx.event.ActionEvent;

import javafx.scene.control.Label;

public class AddItemDialogueController {
	@FXML
	private Label errorMessage;
	
	@FXML
	private TextField newItemDesc;
	
	@FXML
	private TextField newItemName;
	
	@FXML
	private TextField newItemPrice;
	
	@FXML
	private TextField HotLink;
	
	@FXML
	private TextField imageOneLink;
	
	@FXML
	private TextField searchAndFavouriteLink;
	
	@FXML
	private TextField imageTwoLink;
	
	@FXML
	private TextField imageThreeLink;
	
	@FXML
	private TextField imageFourLink;
	
	@FXML
	private TextField newItemCategory;
	
	@FXML
	private Button btnUpdate;
	
	private ConcurrentNavigableMap<String, Item> itemDataTable = BookstoreViewApp.itemDataTable;
	
	private static DB database = BookstoreViewApp.database;
	
	private Stage dialogStage;

	public void setDialogStage(Stage dialogStage) {
		this.dialogStage = dialogStage;
	}
	
	//This method is to create a new item object and store it into the database
	//by getting all user input
	@FXML
	public void handleUpdate(ActionEvent event) {
		boolean valid = true;
		
		String itemCategory = "";
		
		String itemDesc = "";
		
		String itemName = "";
		
		String readItemPrice = "";
		
		double itemPrice = 0.00;
		
		String hotImageLink = "";
		
		String searchAndFavLink = "";
		
		String imageOne = "";
		
		String imageTwo = "";
		
		String imageThree = "";
		
		String imageFour = "";
		
		try {
			itemCategory = newItemCategory.getText();
			
			itemDesc = newItemDesc.getText();
			
			itemName = newItemName.getText();
			
			readItemPrice = newItemPrice.getText();
			
			//If first four textfields are empty, display error and stop process
			if (itemCategory.equals("") && itemDesc.equals("") && itemName.equals("") && readItemPrice.equals("")) {
				errorMessage.setText("Please fill up all text fields.");
			}
			//If first four textfields are filled, continue process
			else {
				//Convert String into a double data type variable
				itemPrice = Double.parseDouble(readItemPrice);
				
				//If remaining textfields are empty, display error and stop process
				if (hotImageLink.equals("") && searchAndFavLink.equals("") && imageOne.equals("") && imageTwo.equals("") && imageThree.equals("") && imageFour.equals("")) {
					errorMessage.setText("Please fill up all text fields.");
				}
				//Else, continue on with process and add new item into database
				else {
					if (valid == true) {
						hotImageLink = HotLink.getText();
						
						searchAndFavLink = searchAndFavouriteLink.getText();
						
						imageOne = imageOneLink.getText();
						
						imageTwo = imageTwoLink.getText();
						
						imageThree = imageThreeLink.getText();
						
						imageFour = imageFourLink.getText();
					}
				}
			}	
		}
		//If converted double type variable throws exception, display error and stop process
		catch (NumberFormatException e) {
			valid = false;
			errorMessage.setText("Please enter valid price value");
		} finally {
			//Create a new item object with new item details and add to database
			if (valid == true) {
				Item oneItem = new Item(itemCategory, itemName, itemDesc, itemPrice, 100, searchAndFavLink, hotImageLink, imageOne, imageTwo, imageThree, imageFour);
				
				itemDataTable.put(itemName, oneItem);
				database.commit();

				dialogStage.close();
			}
		}
	}
}
