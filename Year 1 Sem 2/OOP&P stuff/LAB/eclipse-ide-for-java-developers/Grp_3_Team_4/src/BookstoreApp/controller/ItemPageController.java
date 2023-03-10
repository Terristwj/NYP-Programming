package BookstoreApp.controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.concurrent.ConcurrentNavigableMap;
import org.mapdb.BTreeMap;
import org.mapdb.DB;
import BookstoreApp.controller.SearchController;
import BookstoreApp.model.OrderedItem;
import BookstoreApp.model.Favourite;
import BookstoreApp.model.Item;
import BookstoreApp.BookstoreViewApp;
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
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.text.Text;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.util.Duration;

public class ItemPageController {
	
	private String itemKey = SearchController.itemKey;
	
	private String currentUser = LoginController.currentUser;
	
	private static DB database = BookstoreViewApp.database;
	
	private static ConcurrentNavigableMap<String, Favourite> favouriteDataTable = BookstoreViewApp.favouriteDataTable;
	
	@FXML
	private Button btnAddToCart;
	
	@FXML
	private Button btnLogout;
	
	@FXML
	private Button btnBackHome;
	
	@FXML
	private Button btnCart;
	
	@FXML
	private ImageView image1;
	
	@FXML
	private ImageView image2;
	
	@FXML
	private ImageView image3;
	
	@FXML
	private ImageView image4;
	
	@FXML
	private Button btnFavourite;
	
	@FXML
	private Button btnReservation;
	
	@FXML
	private Text itemName;
	
	@FXML
	private Text itemDescription;
	
	@FXML
	private Label itemPrice;
	
	@FXML
	private Label itemQuantity;
	
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
	
	@FXML
	void initialize(){
		//Set variable to false to indicate that scene displayed is not the login scene
		BookstoreViewApp.checkPageLogin = false;
		
		//setting item information, such as name & price
		DecimalFormat twoDecimal = new DecimalFormat("0.00"); 
		BTreeMap<String, Item> itemMap = database.getTreeMap("item"); //Using items database
		Item oneItem = itemMap.get(itemKey);//Sets item key
		itemName.setText(oneItem.getName());
		itemDescription.setText(oneItem.getDescription());
		itemPrice.setText(twoDecimal.format(oneItem.getPrice()));
		itemQuantity.setText(Integer.toString(oneItem.getQuantity()));
		File file1 = new File(oneItem.getItemPageLink1());		
		Image image_1 = new Image(file1.toURI().toString());
		image1.setImage(image_1);
		File file2 = new File(oneItem.getItemPageLink2());							
		Image image_2 = new Image(file2.toURI().toString());
		image2.setImage(image_2);
		File file3 = new File(oneItem.getItemPageLink3());						
		Image image_3 = new Image(file3.toURI().toString());
		image3.setImage(image_3);
		File file4 = new File(oneItem.getItemPageLink4());							
		Image image_4 = new Image(file4.toURI().toString());
		image4.setImage(image_4);
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
		
		if (HomeController.backSetting2.equals("Search")) {
			Parent viewSearch = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/5 - Search.fxml"));
			Scene viewSearchScene = new Scene(viewSearch,1300,850);
			Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
			window.setScene(viewSearchScene);
			window.setTitle("Search");
			window.show();
		} else if (HomeController.backSetting2.equals("Favourite")) {
			Parent viewFavourites = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/4 - Favourite.fxml"));
			Scene viewFavouritesScene = new Scene(viewFavourites,1300,850);
			Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
			window.setScene(viewFavouritesScene);
			window.setTitle("Favourite");
			window.show();
		} else if (HomeController.backSetting2.equals("Hottest Item")) {
			Parent viewHottestItems = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/7 - Hot Items.fxml"));
			Scene viewHottestItemsScene = new Scene(viewHottestItems,1300,850);
			Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
			window.setScene(viewHottestItemsScene);
			window.setTitle("Hottest Items");
			window.show();
		}
	}
	
	@FXML
	private void handleAddToCart(ActionEvent event) {  //Press the add to cart button
		BTreeMap<String, Item> itemMap = database.getTreeMap("item");
		
		Item oneItem = itemMap.get(itemKey); //Sets item key
		
		String name1 = oneItem.getName();//Sets item name
		
		boolean checkDuplicate = false;
		int listNum = 0;
		//This loop is meant to increase the quantity of a duplicate item already in the arraylist of cart (x2 of a single item)
		for (int x = 0; x < CartController.cart.size(); x++) {
			OrderedItem oneCartItem = CartController.cart.get(x);
			String name2 = oneCartItem.getName();
			
			if (name1.equals(name2)) {
				checkDuplicate = true;
				listNum = x;
			}
		}
		//If checkduplicate is true, plus one to duplicate cart item
		if (checkDuplicate == true) {
			OrderedItem oneCartItem = CartController.cart.get(listNum); //into cart
			int quantity = oneCartItem.getItemQuantity();
			oneCartItem.setItemQuantity(quantity + 1);
			CartController.cart.set(listNum, oneCartItem); 
		} 
		//If checkduplicate is false, add item into cart with quantity set as 1
		else {
			double itemPrice = oneItem.getPrice();
			OrderedItem oneCartItem = new OrderedItem(name1, itemPrice, 1);
			CartController.cart.add(oneCartItem);
		}
	}
	
	@FXML																													//Cart Button
	private void handleCart(ActionEvent event) throws IOException {
		HomeController.backSetting = "Item Page";
		Parent viewCart = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/12 - Cart.fxml"));
		Scene viewCartScene = new Scene(viewCart,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewCartScene);
		window.setTitle("Cart");
		window.show();
	}
	
	@FXML
	private void handleFavourite(ActionEvent event) throws IOException{//Press the favourite button
		BTreeMap<String, Favourite> favouriteMap = database.getTreeMap("favourite");// Using the favourite database
		Favourite oneFavourite = favouriteMap.get(currentUser);// and using the student ID to fill in the student's favourite
		
		if (oneFavourite.getItemName1().equals(" ")) {//Add item to favourite list
			oneFavourite.setItemName1(itemKey);
		} else if (oneFavourite.getItemName1().equals(itemKey)) {//Remove the item from favourite list
			oneFavourite.setItemName1(" ");
		} 
		else if (oneFavourite.getItemName2().equals(" ")) {//Checks carefully for each item in the favourite list
			oneFavourite.setItemName2(itemKey);//to make sure no duplicate favourites
		} else if (oneFavourite.getItemName2().equals(itemKey)) {//If item already exist, it removes the item
			oneFavourite.setItemName2(" ");
		} 
		else if (oneFavourite.getItemName3().equals(" ")) { 							
			oneFavourite.setItemName3(itemKey);
		} else if (oneFavourite.getItemName3().equals(itemKey)) {				
			oneFavourite.setItemName3(" ");
		} 
		else if (oneFavourite.getItemName4().equals(" ")) {						
			oneFavourite.setItemName4(itemKey);
		} else if (oneFavourite.getItemName4().equals(itemKey)) {						
			oneFavourite.setItemName4(" ");
		} 
		else if (oneFavourite.getItemName5().equals(" ")) { 							
			oneFavourite.setItemName5(itemKey);	
		} else if (oneFavourite.getItemName5().equals(itemKey)) {
			oneFavourite.setItemName5(" ");
		} 
		else if (oneFavourite.getItemName6().equals(" ")) { 
			oneFavourite.setItemName6(itemKey);
		} else if (oneFavourite.getItemName6().equals(itemKey)) {
			oneFavourite.setItemName6(" ");
		} 
		else if (oneFavourite.getItemName7().equals(" ")) {
			oneFavourite.setItemName7(itemKey);
		} else if (oneFavourite.getItemName7().equals(itemKey)) {
			oneFavourite.setItemName7(" ");
		} 
		else if (oneFavourite.getItemName8().equals(" ")) {
			oneFavourite.setItemName8(itemKey);
		} else if (oneFavourite.getItemName8().equals(itemKey)) {
			oneFavourite.setItemName8(" ");
		} 
		else if (oneFavourite.getItemName9().equals(" ")) {
			oneFavourite.setItemName9(itemKey);
		} else if (oneFavourite.getItemName9().equals(itemKey)) {
			oneFavourite.setItemName9(" ");
		} else {
			try {
				FXMLLoader loader=new FXMLLoader(); // to load view
				loader.setLocation(getClass().getResource("/BookstoreApp/view/31 - FavouriteFullDialogue.fxml"));
				AnchorPane root = loader.load();
				FavouriteFullDialogueController dialogCtrl=loader.getController();
				Scene scene = new Scene(root);
				Stage dialogStage = new Stage();
				dialogStage.setTitle("Favourit is Full");			
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
		
		favouriteDataTable.replace(oneFavourite.getStudentID(), oneFavourite);//Add the new favourite list into the favourite database
		database.commit();//Save the changes permanently
	}
	
	@FXML
	private void handleReservation(ActionEvent event) throws IOException{//Press the reserve button
		BTreeMap<String, Item> itemMap = database.getTreeMap("item");  //get item database
		Item oneItem = itemMap.get(itemKey);
		String name1 = oneItem.getName();
		
		boolean checkDuplicate = false;
		int listNum = 0;
		//This loop is meant to increase the quantity of a duplicate item already in the arraylist of cart
		for (int x = 0; x < ReservationController.reserve.size(); x++) {
			OrderedItem oneCartItem = ReservationController.reserve.get(x);
			String name2 = oneCartItem.getName();
			
			if (name1.equals(name2)) {
				checkDuplicate = true;
				listNum = x;
			}
		}
		//If checkduplicate is true, plus one to duplicate cart item
		if (checkDuplicate == true) {
			OrderedItem oneCartItem = ReservationController.reserve.get(listNum);
			int quantity = oneCartItem.getItemQuantity();
			oneCartItem.setItemQuantity(quantity + 1);
			ReservationController.reserve.set(listNum, oneCartItem);
		} 
		//If checkduplicate is false, add item into cart with quantity set as 1
		else {
			double itemPrice = oneItem.getPrice();
			OrderedItem oneCartItem = new OrderedItem(name1, itemPrice, 1);
			ReservationController.reserve.add(oneCartItem);
		}
	}
}