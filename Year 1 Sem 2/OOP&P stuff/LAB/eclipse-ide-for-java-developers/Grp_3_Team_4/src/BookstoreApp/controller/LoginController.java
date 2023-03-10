package BookstoreApp.controller;


import java.io.IOException;
import BookstoreApp.BookstoreViewApp;
import BookstoreApp.model.Staff;
import BookstoreApp.model.Student;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.event.ActionEvent;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import org.mapdb.BTreeMap;
import org.mapdb.DB;

public class LoginController {
	
	@FXML
	private Button btnLogin;
	
	@FXML
	private TextField userID;
	
	public static String currentUser;
	
	@FXML
	private TextField userPass;
	
	@FXML
	private Label errorMessage;
	
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
		BookstoreViewApp.checkPageLogin = true;
	}

	@FXML
	private void handleLogin(ActionEvent event) throws IOException {
		BTreeMap<String, Student> studentMap = database.getTreeMap("student");
		BTreeMap<String, Staff> staffMap = database.getTreeMap("staff");
		
		String inputID;
		String inputPass;
		String ID;
		String Pass;
		
		//For checking if person logging into system is a student or a staff
		boolean studentCheck = false;
		boolean staffCheck = false;
		
		//Take textfield input and store it for both inputID and inputPass
		inputID = userID.getText();
		
		inputPass = userPass.getText();
		
		if (inputID.equals("") || inputPass.equals("")) {
			errorMessage.setText("Please enter your admin number or password");
		} 
		else {
			//Cycle through student treemap in database
			for(String key1 : studentMap.keySet()) {
				Student onestudent = studentMap.get(key1);
				
				ID = onestudent.getadminNo();
				//If user input matches with studentID in database, check password next
				if (inputID.equals(ID)) {
					Pass = onestudent.getPassword();
					
					//If password given by user matches with a password in database
					if (inputPass.equals(Pass)) {
						studentCheck = true;
						currentUser = ID;//Stores students ID so that any changes related to his/her account
										 //will be implemented.
					} 
					else {
						errorMessage.setText("Incorrect password");
					}
				}
			}
			//Cycle through staff treemap in database
			for (String key2 : staffMap.keySet()) {
				Staff onestaff = staffMap.get(key2);
				
				ID = onestaff.getstaffID();
				//If user input matches with staffID in database, check password next
				if (inputID.equals(ID)) {
					Pass = onestaff.getPassword();
					
					//If password given by user matches with a password in database
					if (inputPass.equals(Pass)) {
						staffCheck = true;
					}
					//Display error message if condition is false
					else {
						errorMessage.setText("Incorrect password");
					}
				}
				//Display error message if condition is false
				else {
					errorMessage.setText("Incorrect admin number or password");
				}
			}
		}
		//If user is idenfitied as Student after checking ID and password, bring Student to home page
		if (studentCheck == true) {
			//go to login and check for student
			//Test Code - System.out.println("Student");
			studentLogin(event);
			studentCheck = false;
		} 
		//If user is idenfitied as Staff after checking ID and password, bring Staff to staff menu page
		if (staffCheck == true) {
			//go to login and check for staff
			//Test Code - System.out.println("Staff");
			staffLogin(event);
			staffCheck = false;
		}
		
	}
	//This method is for student users, brings student to home
	private void studentLogin(ActionEvent event) throws IOException {
		BookstoreViewApp.checkPageLogin = false;
		AnchorPane viewHome = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/2 - Home.fxml"));
		Scene viewHomeScene = new Scene(viewHome,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewHomeScene);
		window.setTitle("Home");
		window.show();
	}
	
	//This method is for staff users, brings staff to staff menu
	private void staffLogin(ActionEvent event) throws IOException {
		BookstoreViewApp.checkPageLogin = false;
		Parent viewHome = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/16 - Staff Menu.fxml"));
		Scene viewHomeScene = new Scene(viewHome,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewHomeScene);
		window.setTitle("Staff Menu");
		window.show();
	}
}