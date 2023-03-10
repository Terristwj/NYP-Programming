package Qn3;

public class Message {
	private String recipient;
	private String sender;
	private String msgTxt="";
	
	public Message()
	{}
	
	public Message(String sender, String recipient)
	{
		this.sender = sender;
		this.recipient = recipient;
	}
	
	public void append(String msgTxt)
	{
		this.msgTxt+=msgTxt;
	}
	
	public String toString()
	{
		return "\nFrom: "+sender+"\nTo: "+recipient+"\nMessage: "+msgTxt;
	}
}
