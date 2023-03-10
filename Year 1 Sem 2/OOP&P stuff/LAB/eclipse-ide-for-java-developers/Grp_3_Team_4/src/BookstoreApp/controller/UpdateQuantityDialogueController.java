package BookstoreApp.controller;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import java.util.InputMismatchException;
import java.util.concurrent.ConcurrentNavigableMap;
import BookstoreApp.controller.StocksController;
import org.mapdb.BTreeMap;
import org.mapdb.DB;
import BookstoreApp.BookstoreViewApp;
import BookstoreApp.model.Item;
import javafx.event.ActionEvent;

import javafx.scene.control.Label;

public class UpdateQuantityDialogueController {
	@FXML
	private Button btnUpdate;
	@FXML
	private TextField userInput;

	private static String itemKey = StocksController.itemKey;

	public static ConcurrentNavigableMap<String, Item> itemDataTable = BookstoreViewApp.itemDataTable;
	
	private static DB database = BookstoreViewApp.database;
	
	@FXML
	private Label errorMessage;
	
	private Stage dialogStage;

	//This method updates the stock quantity of the shop in the database
	@FXML
	private void handleUpdate(ActionEvent event) {
		BTreeMap<String, Item> itemMap = database.getTreeMap("item");
		
		Item oneItem = itemMap.get(itemKey);
		
		//Get user input
		String input = userInput.getText();
		
		boolean validate = true;
		
		try {
			int newQuantity = Integer.parseInt(input);
			
			if (validate == true) {
				if (newQuantity >= 0 && newQuantity <=100) {
					oneItem.setQuantity(newQuantity);
					
					itemDataTable.replace(itemKey, oneItem);
					database.commit();
					
					dialogStage.close();
				}
				else {
					errorMessage.setText("Please enter a valid number. (Max price = 100)");
				}
			}
		} catch(InputMismatchException e) {
			validate = false;
			errorMessage.setText("Please enter correct values");
		} catch(NumberFormatException e) {
			validate = false;
			errorMessage.setText("Please enter a number between 0 and 100");
		}
	}

	public void setDialogStage(Stage dialogStage) {
		this.dialogStage = dialogStage;
	}
}
