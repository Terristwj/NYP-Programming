package Qn1;

import Qn1.controller.ViewFriendController;
import Qn1.model.Friend;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

public class SimpleFriendViewApp extends Application {

	@Override
	public void start(Stage primaryStage) 
	{
		try
		{
			FXMLLoader loader = new FXMLLoader();
			loader.setLocation(getClass().getResource("/Qn1/view/viewFriend.fxml"));
			GridPane root = loader.load();
			ViewFriendController control = loader.getController();
			control.setMainApp(this);
			Scene scene = new Scene (root);
			primaryStage.setScene(scene);
			primaryStage.setTitle("Friends Viewer");
			primaryStage.show();
			
			control.showFriend(new Friend("Steve", "9259 2525", 231));
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}

	public static void main(String[] args) {
		launch(args);
	}
}
