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

public class RemoveItemDialogueController {
	@FXML
	private Button btnUpdate;
	
	@FXML
	private TextField userInput;
	
	@FXML
	private Label errorMessage;
	
	private ConcurrentNavigableMap<String, Item> itemDataTable = BookstoreViewApp.itemDataTable;
	
	private ConcurrentNavigableMap<String, Item> hotItemDataTable = BookstoreViewApp.hotItemDataTable;
	
	private static DB database = BookstoreViewApp.database;

	public static String itemKey;
	
	private Stage dialogStage;

	public void setDialogStage(Stage dialogStage) {
		this.dialogStage = dialogStage;
	}
	
	//This method is used to change items from the database.
	@FXML
	public void handleUpdate(ActionEvent event) {
		BTreeMap<String, Item> itemMap = database.getTreeMap("item");
		BTreeMap<String, Item> hotItemMap = database.getTreeMap("hot items");
		
		//Get user input to know what item is being changed
		String input = userInput.getText();
		
		String itemName = "";
		
		boolean ifHotItem = false;
		
		boolean check = false;
		//Find item within database
		for (String key : itemMap.keySet()) {
			Item oneItem = itemMap.get(key);
			
			String name = oneItem.getName();
			//Once item is found and confirmed, proceed to change item
			if (input.equalsIgnoreCase(key)) {
				check = true;
				itemName = name;
				itemKey = name;
			}
		}
		//Begin changing item
		if (check == true) {			
			for (int i = 1; i <= 8; i++) {
				String num = String.valueOf(i);
				
				Item hotItem = hotItemMap.get(num);
				String hotItemName = hotItem.getName();
				
				if (hotItemName.equalsIgnoreCase(itemName)) {
					ifHotItem = true;
					itemDataTable.remove(itemName);
					Item emptyItem = new Item("","","",0.0,0,"","","","","","");
					hotItemDataTable.replace(num, emptyItem);
					
					//If removed item is not in first position,
					//then bring all items after removed item forward by 1 position
					for (int x = i; x <= 8; x++) {
						int nextPosition = x + 1;
						
						if (x!=8) {
							Item nextItem = hotItemMap.get(String.valueOf(nextPosition));
							hotItemDataTable.replace(String.valueOf(x), nextItem);
						}
						if (x == 8){
							Item lastItem = new Item("","","",0.0,0,"","","","","","");
							hotItemDataTable.replace("8", lastItem);
						}
					}
				}
				
			}
			if (ifHotItem == false) {
				itemDataTable.remove(itemName);
			}
			//Save all changes to database and close dialogue box
			database.commit();
			dialogStage.close();
		} else {
			errorMessage.setText("Invalid name, input is not found in database");
		}
	}
}
