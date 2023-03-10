import java.util.Scanner;
public class Qn5Ver2 {
	public static void main (String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		String selectionInput;
		char selection;
		
		System.out.println("a)Change password");
		System.out.println("b)Log off");
		System.out.println("c)Update email");
		System.out.println("d)Unregister");
		System.out.println("e)Update date of birth");
		
		System.out.println("\nEnter your selection");
		selectionInput = sc.next();
		selection = selectionInput.charAt(0);
	
		switch (selection)
		{
			case 'a' :
			case 'A' :
				System.out.println("You selected a");
				System.out.println("Change password");
				break;
			case 'b' :
			case 'B' :
				System.out.println("You selected b");
				System.out.println("Log off");
				break;
			case 'c' :
			case 'C' :
				System.out.println("You selected c");
				System.out.println("Update email");
				break;
			case 'd' :
			case 'D' :
				System.out.println("You selected d");
				System.out.println("Unregister");
				break;
			case 'e' :
			case 'E' :
				System.out.println("You selected e");
				System.out.println("Update date of birth");
				break;
			default :
				System.out.println("Error.\nTry again.");
			
		}
	}

}
