package BookstoreApp.controller;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.text.Text;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.util.Duration;

import java.io.File;
import java.io.IOException;
import org.mapdb.DB;
import org.mapdb.BTreeMap;
import BookstoreApp.BookstoreViewApp;
import javafx.animation.PauseTransition;
import javafx.beans.property.BooleanProperty;
import javafx.beans.property.SimpleBooleanProperty;
import javafx.event.ActionEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import BookstoreApp.model.Item;

public class ManageHotItemsController {
	@FXML
	private AnchorPane AnchorPane;
	@FXML
	private Button btnNext;
	@FXML
	private Text itemNumber;
	@FXML
	private Button btnPrevious;
	@FXML
	private Text itemPrice;
	@FXML
	private Button btnChangeItem;
	@FXML
	private ImageView itemImage;
	@FXML
	private Text itemName;
	@FXML
	private Button btnBackHome;
	@FXML
	private Button btnLogout;

	private BookstoreViewApp mainapp;
	
	private int num; //Used to cycle through
	
	public static int positionNum;
	
	private static DB database = BookstoreViewApp.database;
	
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
	
	//Display the first item in the "hot items" tree in database
	public void initialize() {
		//Set variable to false to indicate that scene displayed is not the login scene
		BookstoreViewApp.checkPageLogin = false;

		num = 1;
		displayInfo();
	}
	
	//This method is for displaying information of one item from the "hot items" tree in database
	public void displayInfo() {
		BTreeMap<String, Item> HotItemMap = database.getTreeMap("hot items");
		
		Item oneItem = HotItemMap.get(String.valueOf(num));
		
		String checkName = oneItem.getName();
		
		//If item position is not empty, display item.
		if (!checkName.equalsIgnoreCase("")) {
			File file = new File(oneItem.getHotImageLink());
			Image image = new Image(file.toURI().toString());
			
			//Display position number of item in hot items list
			itemNumber.setText(String.valueOf(num));
			
			//Set item information
			itemName.setText(oneItem.getName());
			itemPrice.setText(String.valueOf(oneItem.getPrice()));
			itemImage.setImage(image);
		}
		//If item position is empty, set labels to empty text and dashes.
		else if (checkName.equalsIgnoreCase("")){
			itemNumber.setText(String.valueOf(num));
			
			itemName.setText("---------");
			
			itemPrice.setText("0.00");
			
			File file = new File("src/Images/no_image_available.jpg");
			Image image = new Image(file.toURI().toString());
			
			itemImage.setImage(image);
		}
	}
	
	@FXML
	public void handleChangeItem(ActionEvent event) {
		positionNum = num;
		
		try {
			FXMLLoader loader=new FXMLLoader(); // to load view
			loader.setLocation(getClass().getResource("/BookstoreApp/view/26 - ChangeHotItem.fxml"));
			AnchorPane root = loader.load();
			ChangeHotItemController dialogCtrl=loader.getController();
			Scene scene = new Scene(root,700,300);
			Stage dialogStage = new Stage();
			dialogStage.setTitle("Change existing item");
			dialogStage.setScene(scene);
			dialogStage.initModality(Modality.WINDOW_MODAL);
			dialogStage.initOwner(primaryStage);
			dialogCtrl.setDialogStage(dialogStage);
			dialogStage.show();
			
			 //This mouse event listener is for taking action if mouse is idling/inactive
	        BooleanProperty mouseMoving = new SimpleBooleanProperty();
	        mouseMoving.addListener((obs, wasMoving, isNowMoving) -> {
	        	//If mouse is in idle/inactive,
		        if (! isNowMoving) {
		        	dialogStage.close();
		        }
	        });
	        
	        //Set amount of time in minutes before user is counted as inactive
	        PauseTransition pause = new PauseTransition(Duration.minutes(3));
	        pause.setOnFinished(e -> mouseMoving.set(false));
	        
	        //Set as mouse moving first
	        root.addEventHandler(MouseEvent.ANY, e -> {
	            mouseMoving.set(true);
	            pause.playFromStart();
	        });
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//Display next item in "hot items" database
	@FXML
	private void handleNext(ActionEvent event) throws IOException {
		BTreeMap<String, Item> HotItemMap = database.getTreeMap("hot items");
		int max = HotItemMap.size();
		
		if (num < (max)) {
			num += 1;
			displayInfo();
		}
	}
	
	//Display previous item in "hot items" database
	@FXML
	private void handlePrevious(ActionEvent event) throws IOException {
		if (num > 1) {
			num -= 1;
			displayInfo();
		}
		
	}
	
	@FXML
	private void handleBackHome(ActionEvent event) throws IOException {
		Parent viewBack = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/16 - Staff Menu.fxml"));
		Scene viewBackScene = new Scene(viewBack,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewBackScene);
		window.setTitle("Staff Menu");
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
}
