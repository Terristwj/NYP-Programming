package BookstoreApp.controller;

import java.io.IOException;
import BookstoreApp.BookstoreViewApp;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.event.ActionEvent;
import javafx.stage.Stage;

public class HomeController {
	public static String backSetting = "Homepage";		//For Cart's back btn
	
	public static String backSetting2;					//For Item Page's back btn
	
	@FXML
	private Button btnLogout;
	
	@FXML
	private Button btnSearch;
	
	@FXML 
	private Button btnInstruction;
	
	@FXML
	private Button btnCart;
	
	@FXML
	private Button btnHottestItems;
	
	@FXML
	private Button btnReservations;
	
	@FXML
	private Button btnPurchaseHistory;
	
	@FXML
	private Button btnFavourites;
	
	@FXML
	private Button btnFeedback;
	
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
	private void handleSearch(ActionEvent event) throws IOException {
		backSetting = "Homepage";
		Parent viewSearch = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/5 - Search.fxml"));
		Scene viewSearchScene = new Scene(viewSearch,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewSearchScene);
		window.setTitle("Search");
		window.show();
	}
	
	@FXML
	private void handleInstruction(ActionEvent event) throws IOException {
		backSetting = "Homepage";
		Parent viewInstruction = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/3 - Instruction.fxml"));
		Scene viewInstructionScene = new Scene(viewInstruction,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewInstructionScene);
		window.setTitle("Instruction");
		window.show();
	}
	
	@FXML
	private void handleCart(ActionEvent event) throws IOException {
		backSetting = "Homepage";
		Parent viewCart = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/12 - Cart.fxml"));
		Scene viewCartScene = new Scene(viewCart,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewCartScene);
		window.setTitle("Cart");
		window.show();
	}
	
	@FXML
	private void handleHottestItems(ActionEvent event) throws IOException {
		backSetting = "Homepage";
		Parent viewHottestItems = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/7 - Hot Items.fxml"));
		Scene viewHottestItemsScene = new Scene(viewHottestItems,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewHottestItemsScene);
		window.setTitle("Hottest items");
		window.show();
	}
	
	@FXML
	private void handleFavourites(ActionEvent event) throws IOException {
		backSetting = "Homepage";
		Parent viewFavourites = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/4 - Favourite.fxml"));
		Scene viewFavouritesScene = new Scene(viewFavourites,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewFavouritesScene);
		window.setTitle("Favourites");
		window.show();
	}
	
	@FXML
	private void handlePurchaseHistory(ActionEvent event) throws IOException {
		backSetting = "Homepage";
		Parent viewPurchaseHistory = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/8 - Purchase History.fxml"));
		Scene viewPurchaseHistoryScene = new Scene(viewPurchaseHistory,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewPurchaseHistoryScene);
		window.setTitle("Purchase History");
		window.show();
	}
	
	@FXML
	private void handleReservation(ActionEvent event) throws IOException {
		backSetting = "Homepage";
		Parent viewReservation = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/11 - Reservation.fxml"));
		Scene viewReservationScene = new Scene(viewReservation,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewReservationScene);
		window.setTitle("Reservation");
		window.show();
	}
	
	@FXML
	private void handleFeedback(ActionEvent event) throws IOException {
		backSetting = "Homepage";
		Parent viewFeedback = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/9 - Feedback.fxml"));
		Scene viewFeedbackScene = new Scene(viewFeedback,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewFeedbackScene);
		window.setTitle("Feedback");
		window.show();
	}
	
	@FXML
	private void handleUser(ActionEvent event) throws IOException {
		Parent viewUser = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/29 - User.fxml"));
		Scene viewUserScene = new Scene(viewUser,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewUserScene);
		window.setTitle("Profile");
		window.show();
	}
}
