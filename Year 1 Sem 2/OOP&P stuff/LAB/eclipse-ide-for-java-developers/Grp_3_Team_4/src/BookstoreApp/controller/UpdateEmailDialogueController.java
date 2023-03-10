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

public class UpdateEmailDialogueController {
	
	@FXML
	private TextField newEmail;
	
	@FXML
	private TextField confirmEmail;

	@FXML
	private Button btnUpdate;
	
	@FXML
	private Label errorMessage;

	public static ConcurrentNavigableMap<String, Student> studentDataTable = BookstoreViewApp.studentDataTable;
	
	private static String userKey = UserProfilesController.userKey;
	
	private static DB database = BookstoreViewApp.database;
	
	private static final String check1 = "@mail.com";
	
	private static final String check2 = "@gmail.com";
	
	private Stage dialogStage;
	
	public void setDialogStage(Stage dialogStage) {
		this.dialogStage = dialogStage;
	}
	
	//Replace old object in treemap in database with a new object
	@FXML
	private void handleUpdate(ActionEvent event) {
	
		BTreeMap<String, Student> studentMap = database.getTreeMap("student");
		
		boolean validEmail = false;
		
		String newEmailAddress = newEmail.getText();
		
		String confirmEmailAddress = confirmEmail.getText();
		
		//If both given email addresses are the same then begin validating email addresses
		if (newEmailAddress.equals(confirmEmailAddress)) {
		
			//Gets a substring obtained from newEmailAddress textfield and sheck if it equals to the string value "@mail.com"
			//Substring is updated through the use of the for loop
			for (int i = newEmailAddress.length(); i > 0; i --) {
				//Substring is from the i value to the last string value position
				if ( check1.equals(newEmailAddress.substring(i, (newEmailAddress.length()))) ) {
					validEmail = true;
					
					Student onestudent = studentMap.get(userKey);
					
					onestudent.setEmail(newEmailAddress);
					//Replace existing student object with newly updated student object in database
					studentDataTable.replace(userKey, onestudent);
					database.commit();
					//Close dialog window
					dialogStage.close();
				} else if ( check2.equals(newEmailAddress.substring(i, (newEmailAddress.length()))) ) {
					validEmail = true;
					
					//print code is for testing
					//System.out.println("Address is valid.");
					
					Student onestudent = studentMap.get(userKey);
					
					onestudent.setEmail(newEmailAddress);
					
					studentDataTable.replace(userKey, onestudent);
					database.commit();
					
					dialogStage.close();
				}
			}
			
			if (validEmail == false) {
				errorMessage.setText("Invalid email address");
			}
		}
		//Display error if both given email addresses are not the same
		else {
			errorMessage.setText("Email addresses are not similar");
		}
	}
}
