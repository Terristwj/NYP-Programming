package BookstoreApp.controller;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import javafx.scene.control.TextField;
import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentNavigableMap;

import org.mapdb.DB;
import org.mapdb.BTreeMap;
import BookstoreApp.BookstoreViewApp;
import javafx.event.ActionEvent;
import javafx.scene.control.TextArea;
import javafx.scene.layout.AnchorPane;
import BookstoreApp.model.FeedbackForm;
import BookstoreApp.model.Student;

public class ReviewCustomerFeedbackController {
	@FXML
	private AnchorPane AnchorPane;
	
	@FXML
	private Button btnPrevious;
	
	@FXML
	private Button btnRemove;
	
	@FXML
	private Text feedbackNumber;
	
	@FXML
	private Button btnNext;
	
	@FXML
	private TextField feedbackName;
	
	@FXML
	private TextField feedbackSubject;
	
	@FXML
	private TextField feedbackContact;
	
	@FXML
	private TextArea feedbackContent;
	
	@FXML
	private Button btnBackHome;
	
	@FXML
	private Button btnLogout;

	private ConcurrentNavigableMap<String, Student> studentDataTable = BookstoreViewApp.studentDataTable;
	
	private ArrayList<FeedbackForm> feedbackForms = new ArrayList<FeedbackForm>();

	private int num; //Used to cycle through
	
	private int positionNum;
	
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
		
		num = 0;
		positionNum = 1;
		//Store feedback forms into arraylist feedbackForms
		getFeedbackForms();
		
		//Display first feedback form
		displayForm();
	}
	
	//Go to next form
	@FXML
	private void handleNext(ActionEvent event) {
		if (num < (feedbackForms.size()-1)) {
			num += 1;
			positionNum += 1;
			displayForm();
		}
	}
	
	//Go to previous form
	@FXML
	private void handlePrevious(ActionEvent event) {
		if (num > 0) {
			num -= 1;
			positionNum -= 1;
			displayForm();
		}
	}
	
	public void handleRemove(ActionEvent event) {
		//Remove feedback form
		BTreeMap<String, Student> studentMap = database.getTreeMap("student");
		//The two for loops are used find the exact feedback form
		//First for loop finds the student who submited the form and gets the list of feedback forms he/she has.
		for (String key : studentMap.keySet()) {
			Student oneStudent = studentMap.get(key);
			ArrayList<FeedbackForm> studentFeedback = oneStudent.getFeedbackForms();
			
			//Second for loop searches through the feedback forms for the form that staff wants to remove
			for (int i = 0; i < studentFeedback.size(); i++) {
				FeedbackForm oneFeedback = studentFeedback.get(i);
				String feedbackSubject = oneFeedback.getFeedbacksubject();
				
				FeedbackForm currentForm = feedbackForms.get(num);
				String subject = currentForm.getFeedbacksubject();
				String student = currentForm.getAdminNo();
				
				String adminNo = oneStudent.getadminNo();
				studentFeedback.remove(i);
				//Check and compare,based on feedback form subject, if feedback form displayed 
				//and generated feedback form is the same.
				if (feedbackSubject.equals(subject) && student.equals(adminNo)) {
					//If so then...
					//Update student object in database in order to update removal of feedback form
					oneStudent.setFeedbackForms(studentFeedback);
					studentDataTable.replace(adminNo, oneStudent);
					database.commit();
					
					//Remove feedback from arraylist
					feedbackForms.remove(num);
					displayForm();
				}
			}
		}
	}
	
	//Get feedback forms of all students and store them into feedbackForms
	public void getFeedbackForms() {
		BTreeMap<String, Student> studentMap = database.getTreeMap("student");
		
		for (String key : studentMap.keySet()) {
			Student oneStudent = studentMap.get(key);
			ArrayList<FeedbackForm> studentFeedback = oneStudent.getFeedbackForms();
			
			for (FeedbackForm oneFeedback : studentFeedback) {
				feedbackForms.add(oneFeedback);
			}
		}
	}
	
	//Display feedback form
	@FXML
	private void displayForm() {
		//If there are no more feedback forms to be viewed, set all text to dashes
		if (feedbackForms.size() == 0) {
			feedbackNumber.setText(String.valueOf("-"));
			feedbackName.setText("--------");
			feedbackSubject.setText("--------");
			feedbackContact.setText("--------");
			feedbackContent.setText("--------");
		}
		//If there are still feedback forms, continue displaying desired feedback form
		else {
			FeedbackForm oneFeedback = feedbackForms.get(num);
			
			String name = oneFeedback.getFeedbackname();
			String subject = oneFeedback.getFeedbacksubject();
			String contact = oneFeedback.getFeedbackcontact();
			String content = oneFeedback.getFeedbackcontent();
			
			feedbackNumber.setText(String.valueOf(positionNum));
			feedbackName.setText(name);
			feedbackSubject.setText(subject);
			feedbackContact.setText(contact);
			feedbackContent.setText(content);
		}
	}

	@FXML
	public void handleBackHome(ActionEvent event) throws IOException {
		Parent viewStaffMenu = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/16 - Staff Menu.fxml"));
		Scene viewStaffMenuScene = new Scene(viewStaffMenu,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewStaffMenuScene);
		window.setTitle("Staff Menu");
		window.show();
	}
	
	@FXML
	public void handleLogout(ActionEvent event) throws IOException {
		Parent viewLogoutAlert = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/15 - Logout Alert.fxml"));
		Scene viewLogoutAlertScene = new Scene(viewLogoutAlert,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewLogoutAlertScene);
		window.setTitle("Logout Alert");
		window.show();
	}
}
