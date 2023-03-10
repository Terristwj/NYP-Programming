package BookstoreApp;

/*
	 _______________________________________________________________
	|																|
	|	ITP182 Group 3 	Team 4    									|
	|																|
	|	Title:		NYP Popular										|
	|																|
	|	Members:	Chua Yi Run Stace	(173122Y)	(Leader)		|
	|				Lee Bohui			(174566W)					|
	|				Ng Shi Xuan			(170592Y)					|
	|				Soh Bing Cheng		(173508W)					|
	|				Tan Wei Jun, Terris	(172737L)					|
	|_______________________________________________________________|
*/

import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.text.ParseException;
import javafx.util.Duration;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.concurrent.ConcurrentNavigableMap;
import org.mapdb.DB;
import org.mapdb.DBMaker;
import BookstoreApp.controller.LoginController;
import BookstoreApp.model.Favourite;
import BookstoreApp.model.FeedbackForm;
import BookstoreApp.model.Item;
import BookstoreApp.model.Order;
import BookstoreApp.model.Staff;
import BookstoreApp.model.Student;
import BookstoreApp.model.Voucher;
import javafx.animation.Animation;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.beans.property.BooleanProperty;
import javafx.beans.property.SimpleBooleanProperty;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

public class BookstoreViewApp extends Application {
	
	public static DB database;
	
	public static ConcurrentNavigableMap<String, Student> studentDataTable;
	
	public static ConcurrentNavigableMap<String, Staff> staffDataTable;
	
	public static ConcurrentNavigableMap<String, Item> itemDataTable;
	
	public static ConcurrentNavigableMap<String, Favourite> favouriteDataTable;
	
	public static ConcurrentNavigableMap<String, Item> hotItemDataTable;
	
	public static ConcurrentNavigableMap<String, Voucher> voucherDataTable;
	
	public static boolean checkPageLogin;
	
	public static AnchorPane rootPane;
	
	public static Stage stage = new Stage();
	
	@Override
	public void start(Stage primaryStage) {
		//Set up window and other background functions and start application
		try {
			FXMLLoader loader = new FXMLLoader();
			loader.setLocation(getClass().getResource("/BookstoreApp/view/1 - Login.fxml"));
			AnchorPane root = loader.load();
			LoginController loginCtrl = loader.getController();
			loginCtrl.setMainApp(this);
			Scene scene = new Scene(root,1300,850);
			primaryStage.setScene(scene);
			primaryStage.setTitle("Popular Bookstore App");
			primaryStage.show();
			stage = primaryStage;
			
			//Create a boolean property for computer mouse to track its movement.
			BooleanProperty mouseMoving = new SimpleBooleanProperty();
			//This mouse event listener is for taking action if mouse is idling/inactive.
			//This listener keeps track of when the mouse was moving and if it is currently moving.
	        mouseMoving.addListener((obs, wasMoving, isNowMoving) -> {
	        	//If mouse is in idle/inactive, logout user and reset mouseMovement to true.
	        	if ( (!isNowMoving) && checkPageLogin == false) {
					try {
						handleLogout();
						mouseMoving.set(true);
					} catch (IOException e) {}
	            }
	        });
			//Create a countdown timer and set amount of time in seconds for user to be counted as inactive.
	        //Once countdown ends, user is counted as ianctive by setting mouseMoving as false.
	        //The countdown lasts for 300 seconds which is 5 minutes.
	        Timeline inactiveLogout = new Timeline(
        		new KeyFrame(
        			Duration.seconds(300.0), event -> {
        				mouseMoving.set(false);
        			}
        		)
	        );
	        //Countdown timer runs again after it ends, this continues forever
	        inactiveLogout.setCycleCount(Animation.INDEFINITE);
	        
	        //Keeps track of any mouse event, on application window, such as clicking, click and drag, mouse hover and etc.
	        stage.addEventHandler(MouseEvent.ANY, e -> {
	        	//If any mouse event occurs, set mouseMoving to true and restart countdown back to set amount of time.
	        	mouseMoving.set(true);
	        	inactiveLogout.playFromStart();
	        });
	       
	        
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws ParseException {

		Path dpath = FileSystems.getDefault().getPath("Database.db");
	
		File file = new File(dpath.toUri());

		//If database file is not created, program will begin creating database
		if(!file.exists()) {
			//This code below will create the database file if it does not exist.
			//If the database file exists, it will read from the database file.
			database = DBMaker.newFileDB(new File("Database.db")).closeOnJvmShutdown().make();
			
			// Create a map in the db for persisting respective data
			// Create separate map for each type of data I want to store.
			// For example, I created a map in the database so I can store my student objects in it.
			studentDataTable = database.createTreeMap("student").makeOrGet();
			staffDataTable = database.createTreeMap("staff").makeOrGet();
			itemDataTable = database.createTreeMap("item").makeOrGet();
			favouriteDataTable = database.createTreeMap("favourite").makeOrGet();
			hotItemDataTable = database.createTreeMap("hot items").makeOrGet();
			voucherDataTable = database.createTreeMap("voucher").makeOrGet();
			
			//Store arraylist objects into database treemap
			storeData();
		} else {
			//If database is linked to software, read from database to retrieve information
			database = DBMaker.newFileDB(new File("Database.db")).closeOnJvmShutdown().make();
			
			studentDataTable = database.createTreeMap("student").makeOrGet();
			staffDataTable = database.createTreeMap("staff").makeOrGet();
			itemDataTable = database.createTreeMap("item").makeOrGet();
			favouriteDataTable = database.createTreeMap("favourite").makeOrGet();
			hotItemDataTable = database.createTreeMap("hot items").makeOrGet();
			voucherDataTable = database.createTreeMap("voucher").makeOrGet();
		}
		
		launch(args);
	}
	
	public void close() {
		database.close(); //close the database when program ends
		Platform.exit();
	}
	
    public void handleLogout() throws IOException {
		Parent viewLogoutAlert = FXMLLoader.load(getClass().getResource("/BookstoreApp/view/15 - Logout Alert.fxml"));
		Scene viewLogoutAlertScene = new Scene(viewLogoutAlert,1300,850);
		Stage window = stage;
		window.setScene(viewLogoutAlertScene);
		window.setTitle("Logout Alert");
		window.show();
	}
	
	private static void storeData() throws ParseException {
		//Obtain and store data into arraylist
		ArrayList<Student> studentData = readFromStudentList();
		ArrayList<Staff> staffData = readFromStaffList();
		ArrayList<Item> itemData = readFromItemList();
		ArrayList<Favourite> favouriteData = readFromFavouriteList();	
		ArrayList<Voucher> voucherData = readFromVoucherList();
		
		//Take arraylist data and store them into their respective treemaps in database
		//Loop through arraylist and add each student object to the database treemap
		for (Student oneStudent : studentData) {
			String studentAdminNo = oneStudent.getadminNo();
			
			studentDataTable.put(studentAdminNo, oneStudent);
		}
		
		for (Staff oneStaff : staffData) {
			String staffID = oneStaff.getstaffID();
			
			staffDataTable.put(staffID, oneStaff);
		}
		
		for (Item oneItem : itemData) {
			String name = oneItem.getName();
			
			itemDataTable.put(name, oneItem);
		}
		
		for (int i = 0; i <= 7; i++) {
			Item oneItem = itemData.get(i);
			
			int position = i + 1;
			
			String num = String.valueOf((position));
			
			hotItemDataTable.put(num, oneItem);
		}
		
		for (Favourite oneFavourite : favouriteData) {	// Store each student's favourites into database
			String favouriteName = oneFavourite.getStudentID();
			
			favouriteDataTable.put(favouriteName, oneFavourite);
		}
		
		for (Voucher oneVoucher : voucherData) {
			String voucherCode = oneVoucher.getCode();
				
			voucherDataTable.put(voucherCode, oneVoucher);
		}
		
		//Permanently store created treemaps tables into database
		database.commit();
	}
	
	//This method reads from text file and creates and stores desired objects into arraylist
	private static ArrayList<Student> readFromStudentList() {
		Path dpath = FileSystems.getDefault().getPath("Resources", "studentList.txt");
		
		File file = new File(dpath.toUri());
		
		ArrayList<Student> studentList = new ArrayList<Student>();
		
		Scanner in = null;
		
		try {
			in = new Scanner(file);
			
			while(in.hasNextLine()) {
				//read file and store to arraylist
				String line = in.nextLine();
				
				String userID, userPass, name, membershipStatus, email= "";
				ArrayList<Order> purchaseHistory = new ArrayList<Order>();
				ArrayList<FeedbackForm> forms = new ArrayList<FeedbackForm>();
				
				String[] oneStudentData = line.split(";");
				
				userID = oneStudentData[0];
				userPass = oneStudentData[1];
				name = oneStudentData[2];
				membershipStatus = oneStudentData[3];
				email = oneStudentData[4];
				
				Student oneStudent = new Student(userID, userPass, name, membershipStatus, email, purchaseHistory, forms);
				studentList.add(oneStudent);
			}
		} catch (IOException | ArrayIndexOutOfBoundsException e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				in.close();
			}
		}
		
		return studentList;
	}
	//This method reads from text file and creates and stores desired objects into arraylist
	private static ArrayList<Staff> readFromStaffList() {
		Path dpath = FileSystems.getDefault().getPath("Resources", "staffList.txt");
		
		File file = new File(dpath.toUri());
		
		ArrayList<Staff> staffList = new ArrayList<Staff>();
		
		Scanner in = null;
		
		try {
			in = new Scanner(file);
			
			while(in.hasNextLine()) {
				//read file and store to arraylist
				String line = in.nextLine();
				
				String userID, userPass = "";
				
				String[] oneStaffData = line.split(";");
				
				userID = oneStaffData[0];
				userPass = oneStaffData[1];
				
				Staff oneStaff = new Staff(userID,userPass);
				staffList.add(oneStaff);
			}
		} catch (IOException | ArrayIndexOutOfBoundsException e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				in.close();
			}
		}
		
		return staffList;
	}
	
	private static ArrayList<Item> readFromItemList() {
		Path dpath = FileSystems.getDefault().getPath("Resources", "ItemList.txt");
		
		File file = new File(dpath.toUri());
		
		ArrayList<Item> itemList = new ArrayList<Item>();
		
		Scanner in = null;
		
		try {
			in = new Scanner(file);
			
			while(in.hasNextLine()) {
				//read file and store to arraylist
				String line = in.nextLine();
				
				String category, name, description, readPrice, readQuantity, searchAndFavouriteImageLink, hotImageLink, itemPageLink1, itemPageLink2, itemPageLink3, itemPageLink4 = "";
				
				String[] oneItemData = line.split(";");
				
				category = oneItemData[0];
				name = oneItemData[1];
				description = oneItemData[2];
				readPrice = oneItemData[3];
				readQuantity = oneItemData[4];
				searchAndFavouriteImageLink = oneItemData[5];
				hotImageLink = oneItemData[6];
				itemPageLink1 = oneItemData[7];
				itemPageLink2 = oneItemData[8];
				itemPageLink3 = oneItemData[9];
				itemPageLink4 = oneItemData[10];
						
				double price = Double.parseDouble(readPrice);
				int quantity = Integer.parseInt(readQuantity);
				
				Item oneItem = new Item(category, name, description, price, quantity, searchAndFavouriteImageLink, hotImageLink, itemPageLink1, itemPageLink2, itemPageLink3, itemPageLink4);
				itemList.add(oneItem);
			}
		} catch (IOException | ArrayIndexOutOfBoundsException e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				in.close();
			}
		}
		
		return itemList;
	}
	
	private static ArrayList<Favourite> readFromFavouriteList() {
		Path dpath = FileSystems.getDefault().getPath("Resources", "FavouriteList.txt");											// Takes text file from \Grp_3_Team_4\Resources
		
		File file = new File(dpath.toUri());
		
		ArrayList<Favourite> favouriteList = new ArrayList<Favourite>();
		
		Scanner in = null;
		try {
			in = new Scanner(file);
			
			while(in.hasNextLine()) {
				//read file and store to arraylist
				String line = in.nextLine();
				
				String studentID, itemName1, itemName2, itemName3, itemName4, itemName5, itemName6, itemName7, itemName8, itemName9;
				
				String[] oneFavouriteData = line.split(";");
				
				studentID = oneFavouriteData[0];
				itemName1 = oneFavouriteData[1];
				itemName2 = oneFavouriteData[2];
				itemName3 = oneFavouriteData[3];
				itemName4 = oneFavouriteData[4];
				itemName5 = oneFavouriteData[5];
				itemName6 = oneFavouriteData[6];
				itemName7 = oneFavouriteData[7];
				itemName8 = oneFavouriteData[8];
				itemName9 = oneFavouriteData[9];
				
				Favourite oneFavourite = new Favourite(studentID, itemName1, itemName2, itemName3, itemName4, itemName5, itemName6, itemName7, itemName8, itemName9);
				
				favouriteList.add(oneFavourite);																					// Puts favourite items into an array
			}
		} catch (IOException | ArrayIndexOutOfBoundsException e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				in.close();
			}
		}
			
		return favouriteList;																										// Returns to Line 107
	}
	
	private static ArrayList<Voucher> readFromVoucherList() {
		
		Path dpath = FileSystems.getDefault().getPath("Resources", "voucherList.txt");
		
		File file = new File(dpath.toUri());
		
		ArrayList<Voucher> voucherList = new ArrayList<Voucher>();
		
		Scanner in = null;
		
		try {
			in = new Scanner(file);
			
			while(in.hasNextLine()) {
				//read file and store to arraylist
				String line = in.nextLine();
				
				String voucherCode, readUsed, readDiscount = "";
				
				String[] oneVoucherData = line.split(";");
				
				voucherCode = oneVoucherData[0];
				readUsed = oneVoucherData[1];
				readDiscount = oneVoucherData[2];
				
				int used = Integer.parseInt(readUsed);
				double discountValue = Double.parseDouble(readDiscount);
				
				Voucher oneVoucher = new Voucher(voucherCode, used, discountValue);
				voucherList.add(oneVoucher);
			}
		} catch (IOException | ArrayIndexOutOfBoundsException e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				in.close();
			}
		}
		
		return voucherList;
	}
}