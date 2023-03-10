package BookstoreApp.model;

import java.io.Serializable;

public abstract class Person implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3953668209272951044L;
	String fullName;
	String password;
	
	public Person() {
		
	}
	
	public Person(String name) {
		this.fullName = name;
	}
	
	public Person(String name, String password) {
		this.fullName = name;
		this.password = password;
	}
	
	public String getfullName() {
		return this.fullName;
	}
	
	protected void setfullName(String name) {
		this.fullName = name;
	}
	
	public abstract String getPassword();
	
	public abstract void setPassword(String password);
}
