
public class Friend {
	private String name;
	private String contact;
	private int likes;
	
	public Friend (String name, String contact, int likes)
	{
		this.name=name;
		this.contact=contact;
		this.likes=likes;
	}
	
	public String getName()
	{
		return name;
	}
	
	public String getContact()
	{
		return contact;
	}
	
	public int getLikes()
	{
		return likes;
	}
}
