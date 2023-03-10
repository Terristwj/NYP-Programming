package BookstoreApp.controller;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import java.io.IOException;
import BookstoreApp.BookstoreViewApp;
import javafx.event.ActionEvent;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

public class FeedbackConfirmController {
	@FXML
	private AnchorPane AnchorPane;
	
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
		BookstoreViewApp.checkPageLogin = false;
	}

	//Brings user back to home page
	@FXML
	public void handleConfirm(ActionEvent event) throws IOException {
		Parent viewHome = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/2 - Home.fxml"));
		Scene viewHomeScene = new Scene(viewHome,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewHomeScene);
		window.setTitle("Home");
		window.show();
	}
}
