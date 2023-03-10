package e2.view;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;
import javafx.scene.control.Button;

import javafx.scene.control.TextField;

import java.io.IOException;

import e2.FriendsApp;
import e2.model.User;
import javafx.event.ActionEvent;

import javafx.scene.control.PasswordField;

public class LoginScreenController {
	@FXML
	private Button btnLogin;
	@FXML
	private Button btnClear;
	@FXML
	private TextField tfUsername;
	@FXML
	private PasswordField pwfPassword;
	
	private FriendsApp mainApp;  // reference to the main application of this Controller
		
	public FriendsApp getMainApp() {
		return mainApp;
	}
	
	public void setMainApp(FriendsApp mainApp) {
		this.mainApp = mainApp;
	}
	// Event Listener on Button[#btnLogin].onAction
	@FXML
	public void handleLogin(ActionEvent event) {
		 String username=tfUsername.getText();
		 String password=pwfPassword.getText();
		 User user=new User(username,password);
		 if (mainApp.validateLogin(user)){
			 System.out.println("Successfully");
		 }
		 else {
			Alert alert=new Alert(AlertType.INFORMATION);
			alert.setTitle("Error");
			alert.setHeaderText("Invalid Login!!");
			alert.setContentText("Wrong username or password");
			alert.showAndWait();
			System.out.println("Login failed!!");
		 }
		// mainApp.validateLogin(user);
	}
	// Event Listener on Button[#btnClear].onAction
	@FXML
	public void handleClear(ActionEvent event) {
		tfUsername.setText("");
		pwfPassword.setText("");
	}
}
