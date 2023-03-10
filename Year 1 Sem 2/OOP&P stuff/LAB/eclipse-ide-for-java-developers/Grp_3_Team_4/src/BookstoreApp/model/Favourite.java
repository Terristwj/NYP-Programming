package BookstoreApp.model;

import java.io.Serializable;

public class Favourite implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3395561081294607013L;
	
	String studentID;
	
	String itemName1;
	
	String itemName2;
	
	String itemName3;
	
	String itemName4;
	
	String itemName5;
	
	String itemName6;
	
	String itemName7;
	
	String itemName8;
	
	String itemName9;
	
	public Favourite(String studentID, String itemName1, String itemName2, String itemName3, String itemName4, String itemName5, String itemName6, String itemName7, String itemName8, String itemName9) {
		this.studentID = studentID;
		this.itemName1 = itemName1;
		this.itemName2 = itemName2;
		this.itemName3 = itemName3;
		this.itemName4 = itemName4;
		this.itemName5 = itemName5;
		this.itemName6 = itemName6;
		this.itemName7 = itemName7;
		this.itemName8 = itemName8;
		this.itemName9 = itemName9;
	}
	
	public String getStudentID() 
	{
		return studentID;
	}
	
	public String getItemName1() 
	{
		return itemName1;
	}
	
	public void setItemName1(String itemName) 
	{
		this.itemName1 = itemName;
	}
	
	public String getItemName2() 
	{
		return itemName2;
	}
	
	public void setItemName2(String itemName) 
	{
		this.itemName2 = itemName;
	}
	
	public String getItemName3() 
	{
		return itemName3;
	}
	
	public void setItemName3(String itemName) 
	{
		this.itemName3 = itemName;
	}
	
	public String getItemName4() 
	{
		return itemName4;
	}
	
	public void setItemName4(String itemName) 
	{
		this.itemName4 = itemName;
	}
	
	public String getItemName5() 
	{
		return itemName5;
	}
	
	public void setItemName5(String itemName) 
	{
		this.itemName5 = itemName;
	}
	
	public String getItemName6() 
	{
		return itemName6;
	}
	
	public void setItemName6(String itemName) 
	{
		this.itemName6 = itemName;
	}
	
	public String getItemName7() 
	{
		return itemName7;
	}
	
	public void setItemName7(String itemName) 
	{
		this.itemName7 = itemName;
	}
	
	public String getItemName8() 
	{
		return itemName8;
	}
	
	public void setItemName8(String itemName) 
	{
		this.itemName8 = itemName;
	}
	
	public String getItemName9() 
	{
		return itemName9;
	}
	
	public void setItemName9(String itemName) 
	{
		this.itemName9 = itemName;
	}
}
