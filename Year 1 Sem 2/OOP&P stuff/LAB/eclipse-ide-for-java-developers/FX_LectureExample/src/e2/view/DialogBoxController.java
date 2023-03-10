package e2.view;

import javafx.fxml.FXML;

import javafx.scene.control.Button;

import javafx.event.ActionEvent;


import javafx.scene.text.Text;
import javafx.stage.Stage;

public class DialogBoxController {
	@FXML
	private Text txtContent;
	@FXML
	private Button okButton;
	
	private Stage dialogStage;

    public void setDialogStage(Stage dialogStage) {
        this.dialogStage = dialogStage;
    }
    
    // Event Listener on Button[#okButton].onAction
	@FXML
	public void handleOK(ActionEvent event) {
		dialogStage.close();
	}

	public void setText(String text) {
		txtContent.setText(text);
	}

	public void setButtonText(String buttonText) {
		okButton.setText(buttonText);
	}	
}
