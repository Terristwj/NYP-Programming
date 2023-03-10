import java.util.Scanner;

public class OnlineOrder {
	// define constants
	static final double HAMBURGER = 1.5;
	static final double CHEESE_BURGER = 2.50;
	static final double FRENCH_FRIES = 2.0;
	static final double DRINK = 1.95;
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int choice, redo;
		double total = 0, totalStore = 0;
		// variables to format messages on console
		String output = "You have ordered ";
		char isStudent, toCont;
		
		do {
			redo = 1;
			System.out.println("Item\t\t\tPrice");
			System.out.println("====\t\t\t=====");
			System.out.printf("1. Hamburger\t\t%.2f\n", HAMBURGER);
			System.out.printf("2. Cheeseburger\t\t%.2f\n", CHEESE_BURGER);
			System.out.printf("3. French Fries\t\t%.2f\n", FRENCH_FRIES);
			System.out.printf("4. Soft drinks\t\t%.2f\n", DRINK);
			System.out.print("Enter your choice (1,2,3 or 4): ");

			total = readChoice();
			totalStore += total;

			System.out.print("\nDo you want to continue (yes/no)? ");
			toCont = readYesNo();
			
			if (toCont != 'n' || toCont != 'N')
			{
				if (toCont == 'y' || toCont == 'Y')
					--redo;
				else
					totalStore = 0;
			}
			
		} while (redo == 1);

		System.out.print("Are you a student (yes/no) ");
		isStudent = readYesNo();

		if (isStudent == 'y' || isStudent == 'Y')
			totalStore = totalStore * 0.9;

		System.out.println(output);
		System.out.printf("You have to pay total of $%.2f", totalStore);
		sc.close();
	}
	
	
	
	public static double readChoice(){
		Scanner sc = new Scanner(System.in);
		
		int quantity, choice;
		String msg="";
		double price = 0, total = 0;
		String qty_prompt = "Enter the quantity of ";
		boolean firstTime = true;
		String output = "You have ordered ";
		
		choice = sc.nextInt();
		sc.nextLine();
		
		switch (choice) {
		case 1:
			msg = "hamburgers";
			price = HAMBURGER;
			break;
		case 2:
			msg = "cheeseburgers";
			price = CHEESE_BURGER;
			break;
		case 3:
			msg = "French fries";
			price = FRENCH_FRIES;
			break;
		case 4:
			msg = "soft drinks";
			price = DRINK;
			break;
		default:
			msg = "Invalid Choice!";
		}
		
		if (msg.equalsIgnoreCase("Invalid Choice!"))
			System.out.println(msg);
		else {
			qty_prompt = qty_prompt + msg + ":";
			System.out.print(qty_prompt);
			quantity = sc.nextInt();
			sc.nextLine();

			total += price * quantity;

			if (firstTime) {
				output = output + " " + quantity + " " + msg;
				firstTime = false;
			} else
				output = output + ", " + quantity + " " + msg;
		}
		
		return total;
	}
	
	public static char readYesNo(){
		Scanner sc = new Scanner(System.in);
		
		String yesNo;
		char sample;
		
		yesNo = sc.nextLine();
		sample = yesNo.charAt(0);
		
		if ( sample == 'y' || sample == 'Y' || sample =='n' ||sample =='N' ){
		}
		else{
			System.out.println("Error.\nPlease key in a proper answer.");
			System.out.println("Repeating process.\n");
		}
		
		
		return sample;
	}
}