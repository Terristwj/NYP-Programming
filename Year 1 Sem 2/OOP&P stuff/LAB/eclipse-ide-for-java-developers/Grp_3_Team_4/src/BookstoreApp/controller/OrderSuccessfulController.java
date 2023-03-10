package BookstoreApp.controller;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import java.io.IOException;
import BookstoreApp.BookstoreViewApp;
import javafx.event.ActionEvent;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import javafx.scene.image.ImageView;

public class OrderSuccessfulController {
	@FXML
	private AnchorPane AnchorPane;
	
	@FXML
	private Label queueNum;
	
	private String orderNum = OrderController.queueNum;
	
	@FXML
	private Button btnOk;
	
	@FXML
	private ImageView popularImage;
	
	private BookstoreViewApp mainapp;
	
	public BookstoreViewApp getMainApp() {
		return mainapp;
	}
	
	public void setMainApp(BookstoreViewApp mainapp) {
		this.mainapp = mainapp;
	}
	
	public void initialize () {
		queueNum.setText(orderNum);
		BookstoreViewApp.checkPageLogin = false;
	}
	
	@FXML
	public void handleOk(ActionEvent event) throws IOException {
		Parent viewBack = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/2 - Home.fxml"));
		Scene viewBackScene = new Scene(viewBack,1300,850);
		Stage window = (Stage) ( (Node)event.getSource() ).getScene().getWindow();
		window.setScene(viewBackScene);
		window.setTitle("Home");
		window.show();
	}
}