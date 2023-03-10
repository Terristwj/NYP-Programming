package BookstoreApp.controller;

import java.util.concurrent.ConcurrentNavigableMap;
import org.mapdb.BTreeMap;
import org.mapdb.DB;
import BookstoreApp.controller.UserProfilesController;
import BookstoreApp.BookstoreViewApp;
import BookstoreApp.model.Student;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class UpdateMembershipDialogueController {
	
	@FXML
	private TextField userInput;
	
	@FXML
	private Label errorMessage;
	
	@FXML
	private Button btnUpdate;
	
	private static String userKey = UserProfilesController.userKey;

	public static ConcurrentNavigableMap<String, Student> studentDataTable = BookstoreViewApp.studentDataTable;
	
	private static DB database = BookstoreViewApp.database;
	
	public static boolean check;
	
	private Stage dialogStage;
	
	public void setDialogStage(Stage dialogStage) {
		this.dialogStage = dialogStage;
	}
	
	//Update membership status
	@FXML
	private void handleUpdate(ActionEvent event) {
		BTreeMap<String, Student> studentMap = database.getTreeMap("student");
		
		String membershipStatus = "";
		
		Student oneStudent = studentMap.get(userKey);
		
		String currentStatus = oneStudent.getMembershipStatus();
		
		//Get user input
		String input = userInput.getText();
		
		//If user input is yes, then set membership status as "Yes"
		if (input.equals("Yes") || input.equals("yes")) {
			membershipStatus = "Yes";
			
			//Checks if input and current status is the same, if not the same, proceed to update
			if (membershipStatus.equals(currentStatus) == false) {
				oneStudent.setMembershipStatus(membershipStatus);
				
				studentDataTable.replace(userKey, oneStudent);
				database.commit();
				dialogStage.close();
			}
			else {
				errorMessage.setText("Unable to update, this person already has membership");
			}
		} 
		//If user input is no, then set membership status as "no"
		else if (input.equals("No") || input.equals("no")) {
			membershipStatus = "No";
			
			//Checks if input and current status is the same, if not the same, proceed to update
			if (membershipStatus.equals(currentStatus) == false) {
				oneStudent.setMembershipStatus(membershipStatus);
				
				studentDataTable.replace(userKey, oneStudent);
				database.commit();
				
				dialogStage.close();
			}
			else {
				errorMessage.setText("Unable to update, this person already has no membership");
			}
		} 
		else {
			errorMessage.setText("Please enter in either 'Yes' or 'No'");
		}
	}
}
