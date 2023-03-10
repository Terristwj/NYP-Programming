package Qn1.controller;

import Qn1.SimpleFriendViewApp;
import Qn1.model.Friend;
import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.input.MouseEvent;

public class ViewFriendController {
	@FXML
	private Label lbName;
	@FXML
	private Label lbContact;
	@FXML
	private Label lbLikes;
	
	private int counter=0;
	
	private SimpleFriendViewApp mainApp;
	
	public void showFriend(Friend f)
	{
		lbName.setText(f.getName());
		lbContact.setText(f.getContact());
		lbLikes.setText(String.valueOf(f.getLikes()));
	}

	public SimpleFriendViewApp getMainApp()
	{
		return mainApp;
	}
	
	public void setMainApp(SimpleFriendViewApp mainApp)
	{
		this.mainApp=mainApp;
	}
	

	@FXML
	public void handleNext(MouseEvent event) {
		if (counter == 0)
		{
			counter++;
			showFriend(new Friend("Ah Beng", "9484 2323", 1422));
		}
		else if (counter ==1)
		{
			counter++;
			showFriend(new Friend("Pooh Bear", "9234 5231", 99999));
		}
	}

	
	@FXML
	public void handlePrevious(MouseEvent event) {
		if (counter == 0)
		{
			
		}
		else if (counter == 1)
		{
			counter--;
			showFriend(new Friend("Steve", "9259 2525", 231));
		}
		else
		{
			counter--;
			showFriend(new Friend("Ah Beng", "9484 2323", 1422));
		}
	}

	
	@FXML
	public void handleClose(MouseEvent event) {
		Platform.exit();
	}
}
