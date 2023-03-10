package BookstoreApp.controller;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import java.util.InputMismatchException;
import java.util.concurrent.ConcurrentNavigableMap;
import org.mapdb.BTreeMap;
import org.mapdb.DB;
import BookstoreApp.BookstoreViewApp;
import BookstoreApp.model.Item;
import javafx.event.ActionEvent;
import javafx.scene.control.Label;

public class UpdatePriceDialogueController {
	@FXML
	private Button btnUpdate;
	@FXML
	private TextField userInput;
	@FXML
	private Label errorMessage;
	
	private static String itemKey = StocksController.itemKey;

	public static ConcurrentNavigableMap<String, Item> itemDataTable = BookstoreViewApp.itemDataTable;
	
	private static DB database = BookstoreViewApp.database;

	private Stage dialogStage;
	
	//This method updates the item price in the database
	@FXML
	public void handleUpdate(ActionEvent event) {
		BTreeMap<String, Item> itemMap = database.getTreeMap("item");
		
		Item oneItem = itemMap.get(itemKey);
		//Get user input
		String input = userInput.getText();

		boolean validate = true;
		
		try {
			double newPrice = Double.parseDouble(input);
		
			if (validate == true) {
				//Check of price given by user is within accepted range
				if (newPrice >= 0.0 || newPrice <= 300.0) {
					oneItem.setPrice(newPrice);;
					
					itemDataTable.replace(itemKey, oneItem);
					database.commit();
					
					dialogStage.close();
				}else {
					errorMessage.setText("Please enter a valid price");
				}
			}
		} catch(InputMismatchException e) {
			validate = false;
			errorMessage.setText("Please enter correct values");
		}
	}
	
	public void setDialogStage(Stage dialogStage) {
		this.dialogStage = dialogStage;
	}
}
