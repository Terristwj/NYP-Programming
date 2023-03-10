package BookstoreApp.controller;

import java.io.IOException;
import java.util.concurrent.ConcurrentNavigableMap;
import org.mapdb.BTreeMap;
import org.mapdb.DB;
import BookstoreApp.BookstoreViewApp;
import BookstoreApp.model.Student;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class UserUpdateController {

	@FXML
	private Button btnUpdate;
	
	@FXML
	private Button btnLogout;
	
	@FXML
	private Button btnProceed;

	@FXML
	private Label lbcorrectMessage;

	@FXML
	private Label lberrorMessage;
	
	@FXML
	private TextField password;
	
    @FXML
	private TextField newPassword;
    
    @FXML
   	private TextField confirmNewPassword;    
    
	private String currentUser = LoginController.currentUser;
    
	private static DB database = BookstoreViewApp.database;
	
	public static ConcurrentNavigableMap<String, Student> studentDataTable = BookstoreViewApp.studentDataTable;

	private Stage dialogStage;
	
	public void setDialogStage(Stage dialogStage) {
		this.dialogStage = dialogStage;
	}

	@FXML
	private void handleLogout(ActionEvent event) throws IOException {				                                  //Logout
		Parent viewLogoutAlert = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/15 - Logout Alert.fxml"));
		Scene viewLogoutAlertScene = new Scene(viewLogoutAlert,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewLogoutAlertScene);
		window.show();
	}
	
	@FXML
	private void handleBackToPrevious(ActionEvent event) throws IOException {			                              //Previous Page
		Parent viewBack = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/29 - User.fxml"));
		Scene viewBackScene = new Scene(viewBack,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewBackScene);
		window.show();
	}
	
	@FXML
	private void handleUpdate(ActionEvent event) {
		BTreeMap<String, Student> studentMap = database.getTreeMap("student");
		
		Student oneStudent = studentMap.get(currentUser);
		
		String newUserPass = newPassword.getText();                         //to get user input 
		String confirmNewUserPass = confirmNewPassword.getText();           //to get user input 
		String currentPassword = password.getText();						//to get user input 
		
		if(newUserPass.equals(confirmNewUserPass) && (currentPassword.equals(oneStudent.getPassword()))) {
			oneStudent.setPassword(newUserPass);
			
			studentDataTable.replace(currentUser, oneStudent);
			
			database.commit();
			dialogStage.close();
		}	else if (!currentPassword.equals(oneStudent.getPassword())) {
			lberrorMessage.setText("Incorrect Password");
		}	else {
			lberrorMessage.setText("Password Mismatch, please enter again"); 
		}
	}
}

