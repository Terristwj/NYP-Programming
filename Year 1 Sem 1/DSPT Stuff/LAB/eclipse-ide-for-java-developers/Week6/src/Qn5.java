import java.util.Scanner;
public class Qn5 {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		     /////////////////////////////////////////////////////////
		    //												       //
		   //	Declare a variable "input" for scanner, to        //
		  //	later let variable "selection" copy its' value	 //
		 //												   		//
		/////////////////////////////////////////////////////////
		String selectionInput;
		char selection;
		
		System.out.println("a)Change password");
		System.out.println("b)Log off");
		System.out.println("c)Update email");
		System.out.println("d)Unregister");
		System.out.println("e)Update date of birth");
		
		System.out.println("Enter your selection");
		    ////////////////////////////////////////////////////
		   //												 //
		  //	"selection" copying direct value of "input"	//
		 //												   //
		////////////////////////////////////////////////////
		selectionInput = sc.next();
		selection = selectionInput.charAt(0);
		
		if ((selection == 'a')||(selection=='A'))
		{
			System.out.println("You selected a ");
			System.out.println("Change password");
		}

		else if ((selection == 'b' )||(selection == 'B'))
		{
			System.out.println("You selected b ");
			System.out.println("Log off");
		}
		
		else if ((selection == 'c' )||(selection == 'C'))
		{
			System.out.println("You selected c ");
			System.out.println("Update email");
		}

		else if ((selection == 'd' )||(selection == 'D'))
		{
			System.out.println("You selected d ");
			System.out.println("Unregister");
		}
		
		else if ((selection == 'e' )||(selection == 'E'))
		{
			System.out.println("You selected e ");
			System.out.println("Update date of birth");
		}
		
		else if (!((selection == 'a')||(selection=='A')||(selection == 'b' )||(selection == 'B')||(selection == 'c' )||(selection == 'C')||(selection == 'd' )||(selection == 'D')||(selection == 'e' )||(selection == 'E')))
				System.out.println("Your selection was none of the above.");
		
	}
}
