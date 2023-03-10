package BookstoreApp.controller;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.stage.Stage;

public class FavouriteFullDialogueController {
	
	@FXML
	private Button btnConfirm;
	
	private Stage dialogStage;
	
	public void setDialogStage(Stage dialogStage) {
		this.dialogStage = dialogStage;
	}
	
	@FXML
	private void handleConfirm() {
		dialogStage.close();
	}
}
