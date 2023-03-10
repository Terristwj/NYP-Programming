package BookstoreApp.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.mapdb.BTreeMap;
import org.mapdb.DB;
import java.util.concurrent.ConcurrentNavigableMap;
import BookstoreApp.BookstoreViewApp;
import BookstoreApp.model.FeedbackForm;
import BookstoreApp.model.Student;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class FeedbackController {
	@FXML
	private Button btnLogout;
	
	@FXML
	private Button btnCart;
	
	@FXML
	private Button btnBackHome;
	
	@FXML
	private TextField feedbackName;
	
	@FXML
	private TextField feedbackSubject;
	
	@FXML
	private TextField feedbackContact;
	
	@FXML
	private TextArea feedbackContent;
	
	private static String currentUser = LoginController.currentUser;
	
	public static ConcurrentNavigableMap<String , Student> studentDataTable = BookstoreViewApp.studentDataTable;
	
	@FXML
	private Button btnSubmit;
	
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
		BookstoreViewApp.checkPageLogin = false;
		
		BTreeMap<String, Student> studentMap = database.getTreeMap("student");	//Default set the name
		feedbackName.setText(studentMap.get(LoginController.currentUser).getfullName());
	}
	
	@FXML
	private void handleCart(ActionEvent event) throws IOException {
		HomeController.backSetting = "Feedback";
		Parent viewCart = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/12 - Cart.fxml"));
		Scene viewCartScene = new Scene(viewCart,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewCartScene);
		window.setTitle("Cart");
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
	
	@FXML
	private void handleBackHome(ActionEvent event) throws IOException {
		Parent viewBack = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/2 - Home.fxml"));
		Scene viewBackScene = new Scene(viewBack,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewBackScene);
		window.setTitle("Home");
		window.show();
	}
	
	//Handles submission and storing of form into database
	@FXML
	private void handleSubmit(ActionEvent event) throws IOException {
		BTreeMap<String, Student> studentMap = database.getTreeMap("student");
		
		Student oneStudent = studentMap.get(currentUser);
		
		ArrayList<FeedbackForm> forms = oneStudent.getFeedbackForms();
		
		String feedbackname = feedbackName.getText();
		String feedbacksubject = feedbackSubject.getText();
		String feedbackcontact = feedbackContact.getText();
		String feedbackcontent = feedbackContent.getText();
		 
		//Create a feedback form and add it to arraylist of feedback forms
		FeedbackForm oneForm = new FeedbackForm(currentUser, feedbackname, feedbacksubject, feedbackcontact, feedbackcontent);
		forms.add(oneForm);
		
		//Replace existing arraylist of feedback forms in database with the newly generated arraylist
		oneStudent.setFeedbackForms(forms);
		studentDataTable.replace(currentUser, oneStudent);
		database.commit();
		
		Parent viewFeedbackAlert = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/10 - Feedback Submit.fxml"));
		Scene viewFeedbackAlertScene = new Scene(viewFeedbackAlert,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewFeedbackAlertScene);
		window.setTitle("Feedback Submit");
		window.show();
	}
}	
