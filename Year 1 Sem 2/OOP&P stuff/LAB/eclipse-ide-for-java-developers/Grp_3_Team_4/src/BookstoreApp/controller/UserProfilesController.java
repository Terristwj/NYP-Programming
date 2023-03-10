package BookstoreApp.controller;

import BookstoreApp.controller.UpdateEmailDialogueController;
import BookstoreApp.controller.UpdateMembershipDialogueController;
import java.io.IOException;
import org.mapdb.BTreeMap;
import org.mapdb.DB;
import BookstoreApp.BookstoreViewApp;
import BookstoreApp.model.Student;
import javafx.animation.PauseTransition;
import javafx.beans.property.BooleanProperty;
import javafx.beans.property.SimpleBooleanProperty;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import javafx.util.Duration;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Modality;

public class UserProfilesController {
	
	@FXML
	private Button btnLogout;
	
	@FXML
	private Button btnBackMenu;
	
	@FXML
	private Button btnUpdateEmail;
	
	@FXML
	private Button btnUpdateMembership;
	
	@FXML
	private Button btnGetProfile;
	
	@FXML
	private Label userName;
	
	@FXML
	private Label adminNo;
	
	@FXML
	private Label userEmail;
	
	@FXML
	private Label userMembershipStatus;
	
	@FXML
	private TextField searchText;
	
	@FXML
	private Label errorMessage;
	
	public static String userKey;
	
	private static DB database = BookstoreViewApp.database;
	
	private BookstoreViewApp mainapp;
	
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
		
	}
	
	//This method is to update a students email
	@FXML
	private void handleUpdateEmail(ActionEvent event) throws IOException {
		BTreeMap<String, Student> studentMap = database.getTreeMap("student");
		
		//Get user input
		String input = searchText.getText();
		
		if ( (userKey != null)) {
			Student  oneStudent = studentMap.get(userKey);
			
			String adminNum = oneStudent.getadminNo();
			
			if (adminNum.equals(input)) {
				//Create a dialogue window and display
				try {
					FXMLLoader loader=new FXMLLoader(); // to load view
					loader.setLocation(getClass().getResource("/BookstoreApp/view/18 - UpdateEmailDialogue.fxml"));
					AnchorPane root = loader.load();
					UpdateEmailDialogueController dialogCtrl=loader.getController();
					Scene scene = new Scene(root,700,300);
					Stage dialogStage = new Stage();
					dialogStage.setTitle("Update Email");
					dialogStage.setScene(scene);
					dialogStage.initModality(Modality.WINDOW_MODAL);
					dialogStage.initOwner(primaryStage);
					dialogCtrl.setDialogStage(dialogStage);
					
					//This mouse event listener is for taking action if mouse is idling/inactive
			        BooleanProperty mouseMoving = new SimpleBooleanProperty();
			        mouseMoving.addListener((obs, wasMoving, isNowMoving) -> {
			        	//If mouse is in idle/inactive,
				        if (! isNowMoving) {
				        	dialogStage.close();
				        }
			        });
			        
			        //Set amount of time in minutes before user is counted as inactive
			        PauseTransition pause = new PauseTransition(Duration.minutes(2.5));
			        pause.setOnFinished(e -> mouseMoving.set(false));
			        
			        //Set as mouse moving first
			        root.addEventHandler(MouseEvent.ANY, e -> {
			            mouseMoving.set(true);
			            pause.playFromStart();
			        });
			        
					dialogStage.showAndWait();
				} catch(Exception e) {
					e.printStackTrace();
				} finally {
					Student newStudent = studentMap.get(userKey);
					
					refreshPage(newStudent);
				}
				
			}
			else {
				errorMessage.setText("Please enter your admin number");
			}
		}
		else {
			errorMessage.setText("Please enter your admin number");
		}
	}
	
	//This method is to update a students membership status
	@FXML
	private void handleUpdateMembership(ActionEvent event) throws IOException {
		BTreeMap<String, Student> studentMap = database.getTreeMap("student");

		String input = searchText.getText();
		
		if (userKey != null) {
			Student oneStudent = studentMap.get(userKey);
			
			String adminNum = oneStudent.getadminNo();
			
			if (adminNum.equals(input)) {
				//Create a dialogue window and display
				try {
					FXMLLoader loader=new FXMLLoader(); // to load view
					loader.setLocation(getClass().getResource("/BookstoreApp/view/19 - UpdateMembershipDialogue.fxml"));
					AnchorPane root = loader.load();
					UpdateMembershipDialogueController dialogCtrl=loader.getController();
					Scene scene = new Scene(root,700,300);
					Stage dialogStage = new Stage();
					dialogStage.setTitle("Update membership status");			
					dialogStage.setScene(scene);
					dialogStage.initModality(Modality.WINDOW_MODAL);
					dialogStage.initOwner(primaryStage);
					dialogCtrl.setDialogStage(dialogStage);

					//This mouse event listener is for taking action if mouse is idling/inactive
			        BooleanProperty mouseMoving = new SimpleBooleanProperty();
			        mouseMoving.addListener((obs, wasMoving, isNowMoving) -> {
			        	//If mouse is in idle/inactive,
				        if (! isNowMoving) {
				        	dialogStage.close();
				        }
			        });
			        
			        //Set amount of time in minutes before user is counted as inactive
			        PauseTransition pause = new PauseTransition(Duration.minutes(2.5));
			        pause.setOnFinished(e -> mouseMoving.set(false));
			        
			        //Set as mouse moving first
			        root.addEventHandler(MouseEvent.ANY, e -> {
			            mouseMoving.set(true);
			            pause.playFromStart();
			        });
					
					dialogStage.showAndWait();
				} catch(Exception e) {
					e.printStackTrace();
				} finally {
					Student newStudent = studentMap.get(userKey);
					
					refreshPage(newStudent);
				}
			} else {
				errorMessage.setText("Please enter your admin number");
			}
		}
		else {
			errorMessage.setText("Please enter your admin number");
		}
	}
	//This method is to get a students information and display it
	@FXML
	protected void handleGetProfile(ActionEvent event) throws IOException {
		
		BTreeMap<String, Student> studentMap = database.getTreeMap("student");
		
		String ID;
		
		String input;
		
		boolean checkValid = false;
		
		input = searchText.getText();
		
		for(String key1 : studentMap.keySet()) {
			Student oneStudent = studentMap.get(key1);
			
			ID = oneStudent.getadminNo();
			
			if (input.equalsIgnoreCase(ID)) {
				checkValid = true;
	
				userKey = ID;
				//Display student information by reusing refreshPage method
				refreshPage(oneStudent);
			}
		}
		if (checkValid == false) {
			errorMessage.setText("Please enter your admin number");
		} else {
			errorMessage.setText("");
		}
	}
	
	public void refreshPage(Student oneStudent) {
		String name = oneStudent.getfullName();
		String ID = oneStudent.getadminNo();
		String email = oneStudent.getEmail();
		String membershipStatus = oneStudent.getMembershipStatus();
		
		userName.setText(name.toString());
		adminNo.setText(ID.toString());
		userEmail.setText(email.toString());
		userMembershipStatus.setText(membershipStatus.toString());
	}

	@FXML
	private void handleBackMenu(ActionEvent event) throws IOException {
		Parent viewStaffMenu = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/16 - Staff Menu.fxml"));
		Scene viewStaffMenuScene = new Scene(viewStaffMenu,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewStaffMenuScene);
		window.setTitle("Staff Menu");
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
}
