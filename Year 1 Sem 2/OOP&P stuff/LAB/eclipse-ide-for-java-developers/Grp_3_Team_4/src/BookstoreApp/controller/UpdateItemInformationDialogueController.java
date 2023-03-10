package BookstoreApp.controller;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import java.util.concurrent.ConcurrentNavigableMap;
import org.mapdb.BTreeMap;
import org.mapdb.DB;
import BookstoreApp.BookstoreViewApp;
import BookstoreApp.model.Item;
import javafx.event.ActionEvent;
import javafx.scene.control.Label;

public class UpdateItemInformationDialogueController {
	@FXML
	private Button btnUpdate;
	
	@FXML
	private Label errorMessage;
	
	@FXML
	private TextField userInput;
	
	private String itemKey = StocksController.itemKey;
	
	private ConcurrentNavigableMap<String, Item> itemDataTable = BookstoreViewApp.itemDataTable;
	
	private static DB database = BookstoreViewApp.database;
	
	private Stage dialogStage;
	
	public void setDialogStage(Stage dialogStage) {
		this.dialogStage = dialogStage;
	}

	//This method is used to update the item description of the item in the database
	@FXML
	public void handleUpdate(ActionEvent event) {
		BTreeMap<String, Item> itemMap = database.getTreeMap("item");
		//Get user input
		String input = userInput.getText();
		
		//Codes in if condition will run so long as text field userInput is not empty
		if ( !(input.equals("")) ) {
			Item oneItem = itemMap.get(itemKey);
			
			oneItem.setDescription(input);
			
			itemDataTable.replace(itemKey, oneItem);
			database.commit();
			
			dialogStage.close();
		}
		//Display error information if user input is empty.
		else {
			errorMessage.setText("Please fill in item information before updating.");
		}
	}
}
