package BookstoreApp.controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;

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
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class HottestItemsController {

	@FXML
	private ImageView image1;
	
	@FXML
	private ImageView image2;
	
	@FXML
	private ImageView image3;
	
	@FXML
	private ImageView image4;
	
	@FXML
	private ImageView image5;

	@FXML
	private ImageView image6;
	
	@FXML
	private ImageView image7;
	
	@FXML
	private ImageView image8;
	
	@FXML
	private ImageView image9;
	
	@FXML
	private Button imageBtn1;
	
	@FXML
	private Button imageBtn2;
	
	@FXML
	private Button imageBtn3;
	
	@FXML
	private Button imageBtn4;
	
	@FXML
	private Button imageBtn5;
	
	@FXML
	private Button imageBtn6;
	
	@FXML
	private Button imageBtn7;
	
	@FXML
	private Button imageBtn8;
	
	@FXML
	private Button imageBtn9;
	
	@FXML
	private Text itemName1;
	
	@FXML
	private Text itemName2;
	
	@FXML
	private Text itemName3;
	
	@FXML
	private Text itemName4;
	
	@FXML
	private Text itemName5;
	
	@FXML
	private Text itemName6;
	
	@FXML
	private Text itemName7;
	
	@FXML
	private Text itemName8;
	
	@FXML
	private Text itemName9;
	
	@FXML
	private Label itemPrice1;
	
	@FXML
	private Label itemPrice2;
	
	@FXML
	private Label itemPrice3;
	
	@FXML
	private Label itemPrice4;
	
	@FXML
	private Label itemPrice5;
	
	@FXML
	private Label itemPrice6;
	
	@FXML
	private Label itemPrice7;
	
	@FXML
	private Label itemPrice8;
	
	@FXML
	private Label itemPrice9;
	
	@FXML
	private Button btnLogout;
	
	@FXML
	private Button btnCart;
	
	@FXML
	private Button btnBackHome;
	
	private BookstoreViewApp mainapp;
	
	private static DB database = BookstoreViewApp.database;
	
	public BookstoreViewApp getMainApp() {
		return mainapp;
	}
	
	public void setMainApp(BookstoreViewApp mainapp) {
		this.mainapp = mainapp;
	}
	
	//Sets and displays the hot items page
	@FXML
	void initialize() {
		//Set variable to false to indicate that scene displayed is not the login scene
		BookstoreViewApp.checkPageLogin = false;
		
		DecimalFormat twoDecimal = new DecimalFormat(".00");
		BTreeMap<String, Item> hotItemsMap = database.getTreeMap("hot items");//Using hot items database
		
		File file = new File(hotItemsMap.get("1").getHotImageLink());//create file object to save the link
		Image image = new Image(file.toURI().toString());//to create image object to save the file link 
		image1.setImage(image);//set image 1 to image link
		imageBtn1.setDisable(false); //enable button for the next page
		itemName1.setText(hotItemsMap.get("1").getName()); //item name
		itemPrice1.setText(twoDecimal.format(hotItemsMap.get("1").getPrice())); //item price
		
		file = new File(hotItemsMap.get("2").getHotImageLink());
		image = new Image(file.toURI().toString());
		image2.setImage(image);
		imageBtn2.setDisable(false);
		itemName2.setText(hotItemsMap.get("2").getName());
		itemPrice2.setText(twoDecimal.format(hotItemsMap.get("2").getPrice()));
		
		file = new File(hotItemsMap.get("3").getHotImageLink());
		image = new Image(file.toURI().toString());
		image3.setImage(image);
		imageBtn3.setDisable(false);
		itemName3.setText(hotItemsMap.get("3").getName());
		itemPrice3.setText(twoDecimal.format(hotItemsMap.get("3").getPrice()));
		
		file = new File(hotItemsMap.get("4").getHotImageLink());
		image = new Image(file.toURI().toString());
		image4.setImage(image);
		imageBtn4.setDisable(false);
		itemName4.setText(hotItemsMap.get("4").getName());
		itemPrice4.setText(twoDecimal.format(hotItemsMap.get("4").getPrice()));
		
		file = new File(hotItemsMap.get("5").getHotImageLink());
		image = new Image(file.toURI().toString());
		image5.setImage(image);
		imageBtn5.setDisable(false);
		itemName5.setText(hotItemsMap.get("5").getName());
		itemPrice5.setText(twoDecimal.format(hotItemsMap.get("5").getPrice()));
		
		file = new File(hotItemsMap.get("6").getHotImageLink());
		image = new Image(file.toURI().toString());
		image6.setImage(image);
		imageBtn6.setDisable(false);
		itemName6.setText(hotItemsMap.get("6").getName());
		itemPrice6.setText(twoDecimal.format(hotItemsMap.get("6").getPrice()));
		
		file = new File(hotItemsMap.get("7").getHotImageLink());
		image = new Image(file.toURI().toString());
		image7.setImage(image);
		imageBtn7.setDisable(false);
		itemName7.setText(hotItemsMap.get("7").getName());
		itemPrice7.setText(twoDecimal.format(hotItemsMap.get("7").getPrice()));
		
		file = new File(hotItemsMap.get("8").getHotImageLink());
		image = new Image(file.toURI().toString());
		image8.setImage(image);
		imageBtn8.setDisable(false);
		itemName8.setText(hotItemsMap.get("8").getName());
		itemPrice8.setText(twoDecimal.format(hotItemsMap.get("8").getPrice()));
	}
	
	@FXML
	private void handleLogout(ActionEvent event) throws IOException {														//Logout
		Parent viewLogoutAlert = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/15 - Logout Alert.fxml"));
		Scene viewLogoutAlertScene = new Scene(viewLogoutAlert,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewLogoutAlertScene);
		window.setTitle("Logout Alert");
		window.show();
	}
	
	@FXML
	private void handleBackHome(ActionEvent event) throws IOException {			//Home
		Parent viewBack = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/2 - Home.fxml"));
		Scene viewBackScene = new Scene(viewBack,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewBackScene);
		window.setTitle("Home");
		window.show();
	}
	
	@FXML																		//Cart Button
	private void handleCart(ActionEvent event) throws IOException {
		HomeController.backSetting = "Hottest Item";
		Parent viewCart = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/12 - Cart.fxml"));
		Scene viewCartScene = new Scene(viewCart,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewCartScene);
		window.setTitle("Cart");
		window.show();
	}
	
	@FXML																						
	private void toItemPage1(ActionEvent event) throws IOException {//Item frame
		SearchController.itemKey = itemName1.getText();				//Sets item key
		goToItemPage(event);										//To Line 311
	}
	
	@FXML
	private void toItemPage2(ActionEvent event) throws IOException {//Item frame
		SearchController.itemKey = itemName2.getText();				//Sets item key
		goToItemPage(event);										//To Line 311
	}
	
	@FXML
	private void toItemPage3(ActionEvent event) throws IOException {//Item frame	
		SearchController.itemKey = itemName3.getText();				//Sets item key
		goToItemPage(event);										//To Line 311
	}
	
	@FXML
	private void toItemPage4(ActionEvent event) throws IOException {//Item frame
		SearchController.itemKey = itemName4.getText();				//Sets item key
		goToItemPage(event);										//To Line 311
	}
	
	@FXML
	private void toItemPage5(ActionEvent event) throws IOException {//Item frame
		SearchController.itemKey = itemName5.getText();				//Sets item key
		goToItemPage(event);										//To Line 311
	}
	
	@FXML
	private void toItemPage6(ActionEvent event) throws IOException {//Item frame
		SearchController.itemKey = itemName6.getText();				//Sets item key
		goToItemPage(event);										//To Line 311
	}
	
	@FXML
	private void toItemPage7(ActionEvent event) throws IOException {//Item frame
		SearchController.itemKey = itemName7.getText();				//Sets item key
		goToItemPage(event);										//To Line 311
	}
	
	@FXML
	private void toItemPage8(ActionEvent event) throws IOException {//Item frame
		SearchController.itemKey = itemName8.getText();				//Sets item key
		goToItemPage(event);										//To Line 311
	}
	
	@FXML
	private void toItemPage9(ActionEvent event) throws IOException {//Item frame
		SearchController.itemKey = itemName9.getText();				//Sets item key
		goToItemPage(event);										//To Line 311
	}
	
	private void goToItemPage(ActionEvent event) throws IOException//To item page
	{
		HomeController.backSetting2 = "Hottest Item";
		Parent viewItemPage = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/6 - Item Page.fxml"));
		Scene viewItemPageScene = new Scene(viewItemPage,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewItemPageScene);
		window.setTitle("Item page");
		window.show();
	}
}
