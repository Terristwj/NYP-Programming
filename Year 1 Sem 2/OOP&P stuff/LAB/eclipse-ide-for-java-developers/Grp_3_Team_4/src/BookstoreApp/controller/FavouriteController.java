package BookstoreApp.controller;

import java.io.File;
import java.io.IOException;
import org.mapdb.BTreeMap;
import org.mapdb.DB;
import BookstoreApp.BookstoreViewApp;
import BookstoreApp.model.Favourite;
import BookstoreApp.model.Item;
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
import javafx.stage.Stage;

public class FavouriteController {
	private String studentID = LoginController.currentUser;//For favourite database
	
	private static DB database = BookstoreViewApp.database;
	
	@FXML
	private Button btnLogout;
	
	@FXML
	private Button btnBackHome;
	
	@FXML
	private Button btnCart;
	
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
	
	private BookstoreViewApp mainapp;
	
	public BookstoreViewApp getMainApp() {
		return mainapp;
	}
	
	public void setMainApp(BookstoreViewApp mainapp) {
		this.mainapp = mainapp;
	}
	
	@FXML
	void initialize() {
		//Set variable to false to indicate that scene displayed is not the login scene
		BookstoreViewApp.checkPageLogin = false;
		
		
		BTreeMap<String, Favourite> favouriteMap = database.getTreeMap("favourite");//Use favourite database using the student ID and using the item database
		Favourite oneFavourite = favouriteMap.get(studentID);					
		
		BTreeMap<String, Item> itemMap = database.getTreeMap("item");
		
		for (String itemKey : itemMap.keySet()) {         // Displays the items in student's favourite database
			Item oneItem = itemMap.get(itemKey);              // If the array set is empty, it display nothing and not clickable
			if (oneFavourite.getItemName1().equals(oneItem.getName())) {
				File file = new File(oneItem.getSearchAndFavouriteImageLink());
				Image image = new Image(file.toURI().toString());
				image1.setImage(image);
				imageBtn1.setDisable(false);
				item1.setText(oneFavourite.getItemName1());
			} else if (oneFavourite.getItemName2().equals(oneItem.getName())) {
				File file = new File(oneItem.getSearchAndFavouriteImageLink());
				Image image = new Image(file.toURI().toString());
				image2.setImage(image);
				imageBtn2.setDisable(false);
				item2.setText(oneFavourite.getItemName2());
			} else if (oneFavourite.getItemName3().equals(oneItem.getName())) {
				File file = new File(oneItem.getSearchAndFavouriteImageLink());
				Image image = new Image(file.toURI().toString());
				image3.setImage(image);
				imageBtn3.setDisable(false);
				item3.setText(oneFavourite.getItemName3());
			} else if (oneFavourite.getItemName4().equals(oneItem.getName())) {
				File file = new File(oneItem.getSearchAndFavouriteImageLink());
				Image image = new Image(file.toURI().toString());
				image4.setImage(image);
				imageBtn4.setDisable(false);
				item4.setText(oneFavourite.getItemName4());
			} else if (oneFavourite.getItemName5().equals(oneItem.getName())) {
				File file = new File(oneItem.getSearchAndFavouriteImageLink());
				Image image = new Image(file.toURI().toString());
				image5.setImage(image);
				imageBtn5.setDisable(false);
				item5.setText(oneFavourite.getItemName5());
			} else if (oneFavourite.getItemName6().equals(oneItem.getName())) {
				File file = new File(oneItem.getSearchAndFavouriteImageLink());
				Image image = new Image(file.toURI().toString());
				image6.setImage(image);
				imageBtn6.setDisable(false);
				item6.setText(oneFavourite.getItemName6());
			} else if (oneFavourite.getItemName7().equals(oneItem.getName())) {
				File file = new File(oneItem.getSearchAndFavouriteImageLink());
				Image image = new Image(file.toURI().toString());
				image7.setImage(image);
				imageBtn7.setDisable(false);
				item7.setText(oneFavourite.getItemName7());
			} else if (oneFavourite.getItemName8().equals(oneItem.getName())) {
				File file = new File(oneItem.getSearchAndFavouriteImageLink());
				Image image = new Image(file.toURI().toString());
				image8.setImage(image);
				imageBtn8.setDisable(false);
				item8.setText(oneFavourite.getItemName8());
			} else if (oneFavourite.getItemName9().equals(oneItem.getName())) {
				File file = new File(oneItem.getSearchAndFavouriteImageLink());
				Image image = new Image(file.toURI().toString());
				image9.setImage(image);
				imageBtn9.setDisable(false);
				item9.setText(oneFavourite.getItemName9());
			}																								
		}
	}
	
	@FXML			//Logout
	private void handleLogout(ActionEvent event) throws IOException {						
		Parent viewLogoutAlert = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/15 - Logout Alert.fxml"));
		Scene viewLogoutAlertScene = new Scene(viewLogoutAlert,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewLogoutAlertScene);
		window.show();
	}
	
	@FXML			//Home
	private void handleBackHome(ActionEvent event) throws IOException {				
		Parent viewHome = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/2 - Home.fxml"));
		Scene viewHomeScene = new Scene(viewHome,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewHomeScene);
		window.show();
	}
	
	@FXML			//Cart Button
	private void handleCart(ActionEvent event) throws IOException {
		HomeController.backSetting = "Favourite";
		Parent viewCart = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/12 - Cart.fxml"));
		Scene viewCartScene = new Scene(viewCart,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewCartScene);
		window.show();
	}
				
	@FXML			//Item frame
	private void toItemPage1(ActionEvent event) throws IOException {		
		SearchController.itemKey = item1.getText();			//Set item key for item page
		goToItemPage(event);								//To Line 280
	}
	
	@FXML
	private void toItemPage2(ActionEvent event) throws IOException {//Item frame
		SearchController.itemKey = item2.getText();					//Set item key for item page
		goToItemPage(event);										//To Line 280
	}
	
	@FXML
	private void toItemPage3(ActionEvent event) throws IOException {//Item frame
		SearchController.itemKey = item3.getText();					//Set item key for item page
		goToItemPage(event);										//To Line 280
	}
	
	@FXML
	private void toItemPage4(ActionEvent event) throws IOException {//Item frame	
		SearchController.itemKey = item4.getText();					//Set item key for item page
		goToItemPage(event);										//To Line 280
	}						
	
	@FXML
	private void toItemPage5(ActionEvent event) throws IOException {//Item frame
		SearchController.itemKey = item5.getText();					//Set item key for item page
		goToItemPage(event);										//To Line 280
	}
	
	@FXML
	private void toItemPage6(ActionEvent event) throws IOException {//Item frame
		SearchController.itemKey = item6.getText();					//Set item key for item page
		goToItemPage(event);										//To Line 280
	}
	
	@FXML
	private void toItemPage7(ActionEvent event) throws IOException {//Item frame
		SearchController.itemKey = item7.getText();					//Set item key for item page
		goToItemPage(event);										//To Line 280
	}
	
	@FXML
	private void toItemPage8(ActionEvent event) throws IOException {//Item frame
		SearchController.itemKey = item8.getText();					//Set item key for item page
		goToItemPage(event);										//To Line 280
	}	
	
	@FXML
	private void toItemPage9(ActionEvent event) throws IOException {//Item frame
		SearchController.itemKey = item9.getText();					//Set item key for item page
		goToItemPage(event);										//To Line 280
	}
	
	private void goToItemPage(ActionEvent event) throws IOException //To item page
	{
		HomeController.backSetting2 = "Favourite";
		Parent viewItemPage = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/6 - Item Page.fxml"));
		Scene viewItemPageScene = new Scene(viewItemPage,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewItemPageScene);
		window.show();
	}
}
