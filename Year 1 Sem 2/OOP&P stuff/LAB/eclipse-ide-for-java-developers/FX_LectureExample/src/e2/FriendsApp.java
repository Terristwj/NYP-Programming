package e2;




import e2.model.User;
import e2.view.LoginScreenController;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;

import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

public class FriendsApp extends Application {
	
	private Stage primaryStage;
	
	public Stage getPrimaryStage() {
		return primaryStage;
	}

	
	@Override
	public void start(Stage primaryStage) {
		
		this.primaryStage=primaryStage; // primary stage of the application
		
		try {
			FXMLLoader loader=new FXMLLoader(); // to load view
			loader.setLocation(getClass().getResource("/e2/view/LoginScreen.fxml"));
			GridPane root = loader.load();
			LoginScreenController loginCtrl=loader.getController();
			loginCtrl.setMainApp(this);
			Scene scene = new Scene(root,400,200);
			scene.getStylesheets().add("/e2/view/LoginScreen.css");
			primaryStage.setScene(scene);
			primaryStage.show();
		} catch(Exception e) {
			e.printStackTrace();
		}
		 
	}
	
	public boolean validateLogin(User user) {
		if (user.getUserName().equalsIgnoreCase("itp192") && user.getPassword().equals("abc123")) {
			return true;
		}			
		else
			return false;
	}
	/*
	public void validateLogin(User user) {
	 
		 
		if (user.getUserName().equalsIgnoreCase("itp192") && user.getPassword().equals("abc123")) {
		   
	    	System.out.println("Login successfully!");
		}			
		else {
			try {
				FXMLLoader loader=new FXMLLoader(); // to load view
				loader.setLocation(getClass().getResource("/e2/view/DialogBox.fxml"));
				AnchorPane root = loader.load();
				DialogBoxController dialogCtrl=loader.getController();			
				Scene scene = new Scene(root,280,100);
				Stage dialogStage=new Stage();
				dialogStage.setTitle("Invalid Login!");			
				dialogStage.setScene(scene);
				dialogStage.initModality(Modality.WINDOW_MODAL);
				dialogStage.initOwner(primaryStage);				
				dialogCtrl.setDialogStage(dialogStage);
				dialogCtrl.setText("Invalid username or password!!");
				dialogStage.showAndWait();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	*/	

	public static void main(String[] args) {
		launch(args);
	}
}
