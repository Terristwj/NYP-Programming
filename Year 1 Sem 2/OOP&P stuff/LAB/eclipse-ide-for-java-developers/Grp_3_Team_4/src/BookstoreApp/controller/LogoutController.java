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

public class LogoutController {
	
	@FXML
	private Button btnConfirm;
	
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
	
	//Brings user back to login page once the "Ok" button is clicked
	@FXML
	private void handleConfirm(ActionEvent event) throws IOException {
		SearchController.lastSearch = "";
		Parent viewLogout = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/1 - Login.fxml"));
		Scene viewLogoutScene = new Scene(viewLogout,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewLogoutScene);
		window.setTitle("Popular Bookstore App");
		window.show();
	}
}
