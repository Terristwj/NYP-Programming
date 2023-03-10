package Qn1.model;

public class Friend {
	private String name;
	private String contact;
	private int likes;
	
	public Friend(String name, String contact, int likes)
	{
		this.name=name;
		this.contact=contact;
		this.likes=likes;
	}
	
	public String getName()
	{
		return name;
	}
	
	public void setName(String name)
	{
		this.name=name;
	}
	
	public String getContact()
	{
		return contact;
	}
	
	public void setContact(String contact)
	{
		this.contact=contact;
	}
	
	public int getLikes()
	{
		return likes;
	}
	
	public void setLikes(int likes)
	{
		this.likes=likes;
	}
}
