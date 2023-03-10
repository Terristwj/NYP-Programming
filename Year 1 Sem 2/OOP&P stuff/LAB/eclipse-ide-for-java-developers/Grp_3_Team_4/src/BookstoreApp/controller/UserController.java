package BookstoreApp.controller;

import java.io.IOException;

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
import javafx.scene.layout.AnchorPane;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class UserController { //see if got member or not if not put NIL

	@FXML
	private AnchorPane AnchorPane;
	
	@FXML
	private Button btnLogout;
	
	@FXML
	private Button btnBackHome;
	
	@FXML
	private Button btnChangePW;
	
	@FXML
	private Label lbName;
	
	@FXML
	private Label lbAdminNo; 
	
	@FXML
	private Label lbMembershipNo;
	
	private String currentUser = LoginController.currentUser;
	
	private BookstoreViewApp mainapp;
	
	private static DB database = BookstoreViewApp.database;

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
	
	public void initialize() {
		//Set variable to false to indicate that scene displayed is not the login scene
		BookstoreViewApp.checkPageLogin = false;
		
		BTreeMap<String, Student> studentMap = database.getTreeMap("student");
		Student oneStudent = studentMap.get(currentUser);
		
		String name = oneStudent.getfullName();
		String adminNo = oneStudent.getadminNo();
		String userPass = oneStudent.getPassword();
		String membershipStatus = oneStudent.getMembershipStatus();	
	
		refreshPage(name, adminNo, userPass, membershipStatus);
	}
	
	@FXML
	private void handleLogout(ActionEvent event) throws IOException {				                                                //Logout
		Parent viewLogoutAlert = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/15 - Logout Alert.fxml"));
		Scene viewLogoutAlertScene = new Scene(viewLogoutAlert,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewLogoutAlertScene);
		window.show();
	}
	
	@FXML
	private void handleBackHome(ActionEvent event) throws IOException {			                                                        //Home
		Parent viewBack = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/2 - Home.fxml"));
		Scene viewBackScene = new Scene(viewBack,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewBackScene);
		window.show();
	}
	
	@FXML
	private void handleChangePW(ActionEvent event) throws IOException {		//change password
		BTreeMap<String, Student> studentMap = database.getTreeMap("student");
		
		Student oneStudent = studentMap.get(currentUser);
		
		try {
			FXMLLoader loader=new FXMLLoader(); // to load view
			loader.setLocation(getClass().getResource("/BookstoreApp/view/30 - Update User.fxml"));
			AnchorPane root = loader.load();
			UserUpdateController dialogCtrl = loader.getController();	
			Scene scene = new Scene(root,700,300);
			Stage dialogStage = new Stage();
			dialogStage.setTitle("Change password");	
			dialogStage.setScene(scene);
			dialogStage.initModality(Modality.WINDOW_MODAL);
			dialogStage.initOwner(primaryStage);
			dialogCtrl.setDialogStage(dialogStage);
			dialogStage.show(); 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			String name = oneStudent.getfullName();
			String adminNo = oneStudent.getadminNo();
			String userPass = oneStudent.getPassword();
			String membershipStatus = oneStudent.getMembershipStatus();
			//Refresh scene to display updated student information
			refreshPage(name, adminNo, userPass, membershipStatus);
		}
	}
	
	public void refreshPage (String name, String adminNo, String userPass, String membershipStatus) {
		lbName.setText(name.toString());
		lbAdminNo.setText(adminNo.toString());
		lbMembershipNo.setText(membershipStatus.toString());
	}
}