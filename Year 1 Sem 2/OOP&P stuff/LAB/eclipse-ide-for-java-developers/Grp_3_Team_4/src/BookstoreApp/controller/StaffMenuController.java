package BookstoreApp.controller;

import java.io.IOException;
import BookstoreApp.BookstoreViewApp;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.stage.Stage;

public class StaffMenuController {
	@FXML
	private Button btnLogout;
	
	@FXML
	private Button btnUserProfiles;
	
	@FXML
	private Button btnHotItems;
	
	@FXML
	private Button btnStocks;
	
	@FXML
	private Button btnCustomerFeedback;
	
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
	private void handleUserProfiles(ActionEvent event) throws IOException {
		Parent viewUserProfiles = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/17 - User Profiles.fxml"));
		Scene viewUserProfilesScene = new Scene(viewUserProfiles,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewUserProfilesScene);
		window.setTitle("User Profiles");
		window.show();
	}
	
	@FXML
	private void handleStocks(ActionEvent event) throws IOException {
		Parent viewStocks= FXMLLoader.load(getClass().getResource("/BookstoreApp/view/20 - Stocks.fxml"));
		Scene viewStocksScene = new Scene(viewStocks,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewStocksScene);
		window.setTitle("Stocks");
		window.show();
	}
	
	@FXML
	private void handleEditHot(ActionEvent event) throws IOException {
		Parent viewHot= FXMLLoader.load(getClass().getResource("/BookstoreApp/view/23 - ManageHotItems.fxml"));
		Scene viewHotScene = new Scene(viewHot,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewHotScene);
		window.setTitle("Edit hottest items");
		window.show();
	}
	
	@FXML
	private void handleCustomerFeedback(ActionEvent event) throws IOException {
		Parent viewReviewFeedback = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/28 - ReviewCustomerFeedback.fxml"));
		Scene viewReviewFeedbackScene = new Scene(viewReviewFeedback,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewReviewFeedbackScene);
		window.setTitle("Review Customer Feedback");
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
