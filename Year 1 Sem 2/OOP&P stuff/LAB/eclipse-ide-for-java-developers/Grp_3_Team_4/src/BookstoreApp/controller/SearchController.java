package BookstoreApp.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import org.mapdb.BTreeMap;
import org.mapdb.DB;
import BookstoreApp.BookstoreViewApp;
import BookstoreApp.model.Item;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.stage.Stage;

public class SearchController {
	protected static String itemKey;									// An item key for item database and favourite database(Other scenes)
	
	static String lastSearch = "";
	
	@FXML
	private Button btnLogout;
	
	@FXML
	private Button btnBackHome;
	
	@FXML
	private Button btnCart;
	
	@FXML
	private TextField searchBar;
	
	@FXML
	private Label item1;
	
	@FXML
	private Label item2;
	
	@FXML
	private Label item3;
	
	@FXML
	private Label item4;
	
	@FXML
	private Label item5;
	
	@FXML
	private Label item6;
	
	@FXML
	private Label item7;
	
	@FXML
	private Label item8;
	
	@FXML
	private Label item9;
	
	@FXML
	private ImageView image1;
	
	@FXML
	private Button imageBtn1;

	@FXML
	private ImageView image2;
	
	@FXML
	private Button imageBtn2;
	
	@FXML
	private ImageView image3;
	
	@FXML
	private Button imageBtn3;
	
	@FXML
	private ImageView image4;
	
	@FXML
	private Button imageBtn4;
	
	@FXML
	private ImageView image5;
	
	@FXML
	private Button imageBtn5;
	
	@FXML
	private ImageView image6;
	
	@FXML
	private Button imageBtn6;
	
	@FXML
	private ImageView image7;
	
	@FXML
	private Button imageBtn7;
	
	@FXML
	private ImageView image8;
	
	@FXML
	private Button imageBtn8;

	@FXML
	private ImageView image9;
	
	@FXML
	private Button imageBtn9;
	
	
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
		
		searchBar.setText(lastSearch);
		searchItem();
	}
	
	@FXML																													//Logout Button
	private void handleLogout(ActionEvent event) throws IOException {
		Parent viewLogoutAlert = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/15 - Logout Alert.fxml"));
		Scene viewLogoutAlertScene = new Scene(viewLogoutAlert,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewLogoutAlertScene);
		window.setTitle("Logout Alert");
		window.show();
	}
	
	@FXML																													//Back Button
	private void handleBackHome(ActionEvent event) throws IOException {
		Parent viewHome = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/2 - Home.fxml"));
		Scene viewHomeScene = new Scene(viewHome,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewHomeScene);
		window.setTitle("Home");
		window.show();
	}
	
	@FXML																													//Cart Button
	private void handleCart(ActionEvent event) throws IOException {
		HomeController.backSetting = "Search";
		Parent viewCart = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/12 - Cart.fxml"));
		Scene viewCartScene = new Scene(viewCart,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewCartScene);
		window.setTitle("Cart");
		window.show();
	}
	
	@FXML																													//Search Bar
	private void onEnter(ActionEvent event) throws IOException {
		searchItem();
		
		lastSearch = searchBar.getText();
	}
	
	private void searchItem() {

		BTreeMap<String, Item> itemMap = database.getTreeMap("item");	//Collect item from database and put into Arrays
		
		String itemName;
		ArrayList<String> itemName2 = new ArrayList<String>();
		String itemCatergory;
		ArrayList<String> itemLink2 = new ArrayList<String>();
		int itemCounter=0;;
		
		String searchInput;
		searchInput = searchBar.getText();
		
		if (searchInput.equals("")) {				//Search Nothing
			image1.setImage(null);
			imageBtn1.setDisable(true);
			item1.setText("");
			image2.setImage(null);
			imageBtn2.setDisable(true);
			item2.setText("");
			image3.setImage(null);
			imageBtn3.setDisable(true);
			item3.setText("");
			image4.setImage(null);
			imageBtn4.setDisable(true);
			item4.setText("");
			image5.setImage(null);
			imageBtn5.setDisable(true);
			item5.setText("");
			image6.setImage(null);
			imageBtn6.setDisable(true);
			item6.setText("");
			image7.setImage(null);
			imageBtn7.setDisable(true);
			item7.setText("");
			image8.setImage(null);
			imageBtn8.setDisable(true);
			item8.setText("");
			image9.setImage(null);
			imageBtn9.setDisable(true);
			item9.setText("");

		} else {									//Actual searches
			for (String itemKey : itemMap.keySet()) {
				Item oneItem = itemMap.get(itemKey);//Checks the item category and name
				
				itemName = oneItem.getName();
				itemCatergory = oneItem.getCatergory();
		        
				if (searchInput.equalsIgnoreCase(itemCatergory)) {
					itemCounter++;
					itemName2.add(oneItem.getName());
					itemLink2.add(oneItem.getSearchAndFavouriteImageLink());
				} else if (searchInput.equalsIgnoreCase(itemName)){
					itemCounter++;
					itemName2.add(oneItem.getName());
					itemLink2.add(oneItem.getSearchAndFavouriteImageLink());
				} else {}
			}
			
			image1.setImage(null);	//Set all to nothing first
			imageBtn1.setDisable(true);
			item1.setText("");
			image2.setImage(null);
			imageBtn2.setDisable(true);
			item2.setText("");
			image3.setImage(null);
			imageBtn3.setDisable(true);
			item3.setText("");
			image4.setImage(null);
			imageBtn4.setDisable(true);
			item4.setText("");
			image5.setImage(null);
			imageBtn5.setDisable(true);
			item5.setText("");
			image6.setImage(null);
			imageBtn6.setDisable(true);
			item6.setText("");
			image7.setImage(null);
			imageBtn7.setDisable(true);
			item7.setText("");
			image8.setImage(null);
			imageBtn8.setDisable(true);
			item8.setText("");
			image9.setImage(null);
			imageBtn9.setDisable(true);
			item9.setText("");
			
			switch (itemCounter) {												//Slowly add items inside
			
			case 9:
				File file = new File(itemLink2.get(8));
				Image image = new Image(file.toURI().toString());
				image9.setImage(image);
				imageBtn9.setDisable(false);
				item9.setText(itemName2.get(8));
				
			case 8:
				file = new File(itemLink2.get(7));
				image = new Image(file.toURI().toString());
				image8.setImage(image);
				imageBtn8.setDisable(false);
				item8.setText(itemName2.get(7));
				
			case 7:
				file = new File(itemLink2.get(6));
				image = new Image(file.toURI().toString());
				image7.setImage(image);
				imageBtn7.setDisable(false);
				item7.setText(itemName2.get(6));
				
			case 6:
				file = new File(itemLink2.get(5));
				image = new Image(file.toURI().toString());
				image6.setImage(image);
				imageBtn6.setDisable(false);
				item6.setText(itemName2.get(5));
				
			case 5:
				file = new File(itemLink2.get(4));
				image = new Image(file.toURI().toString());
				image5.setImage(image);
				imageBtn5.setDisable(false);
				item5.setText(itemName2.get(4));
				
			case 4:
				file = new File(itemLink2.get(3));
				image = new Image(file.toURI().toString());
				image4.setImage(image);
				imageBtn4.setDisable(false);
				item4.setText(itemName2.get(3));
				
			case 3:
				file = new File(itemLink2.get(2));
				image = new Image(file.toURI().toString());
				image3.setImage(image);
				imageBtn3.setDisable(false);
				item3.setText(itemName2.get(2));
				
			case 2:
				file = new File(itemLink2.get(1));
				image = new Image(file.toURI().toString());
				image2.setImage(image);
				imageBtn2.setDisable(false);
				item2.setText(itemName2.get(1));
				
			case 1:
				file = new File(itemLink2.get(0));					
				image = new Image(file.toURI().toString());
				image1.setImage(image);
				imageBtn1.setDisable(false);
				item1.setText(itemName2.get(0));
				
			case 0:
				break;
			}
		}
	}
	
	@FXML																			
	private void toItemPage1(ActionEvent event) throws IOException {				//Item frame
		itemKey = item1.getText();													//For item page
		goToItemPage(event);														//Go to Line 397
	}
	
	@FXML
	private void toItemPage2(ActionEvent event) throws IOException {				//Item frame
		itemKey = item2.getText();													//For item page
		goToItemPage(event);														//Go to Line 397
	}
	
	@FXML
	private void toItemPage3(ActionEvent event) throws IOException {				//Item frame
		itemKey = item3.getText();													//For item page
		goToItemPage(event);														//Go to Line 397
	}
	
	@FXML
	private void toItemPage4(ActionEvent event) throws IOException {				//Item frame
		itemKey = item4.getText();													//For item page
		goToItemPage(event);														//Go to Line 397
	}
	
	@FXML
	private void toItemPage5(ActionEvent event) throws IOException {				//Item frame
		itemKey = item5.getText();													//For item page
		goToItemPage(event);														//Go to Line 397
	}	
	
	@FXML
	private void toItemPage6(ActionEvent event) throws IOException {				//Item frame
		itemKey = item6.getText();													//For item page
		goToItemPage(event);														//Go to Line 397
	}
	
	@FXML
	private void toItemPage7(ActionEvent event) throws IOException {				//Item frame
		itemKey = item7.getText();													//For item page
		goToItemPage(event);														//Go to Line 397
	}
	
	@FXML
	private void toItemPage8(ActionEvent event) throws IOException {				//Item frame
		itemKey = item8.getText();													//For item page
		goToItemPage(event);														//Go to Line 397
	}
	
	@FXML
	private void toItemPage9(ActionEvent event) throws IOException {				//Item frame
		itemKey = item9.getText();													//For item page
		goToItemPage(event);														//Go to Line 397
	}
	
	private void goToItemPage(ActionEvent event) throws IOException 				//Go to the item page
	{
		HomeController.backSetting2 = "Search";
		Parent viewItemPage = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/6 - Item Page.fxml"));
		Scene viewItemPageScene = new Scene(viewItemPage,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewItemPageScene);
		window.setTitle("Item page");
		window.show();
	}
}
