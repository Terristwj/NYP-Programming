import java.util.Scanner;
public class Qn6 {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		     /////////////////////////////////////////////////////////////
		    //												           //
		   //	Declare a variable String "input" for scanner, to     //
		  //	later let variable char "selection" copy its' value	 //
		 //												   		    //
		/////////////////////////////////////////////////////////////
		String selectionInput;
		char selection;
		
		System.out.println("a)Change password");
		System.out.println("b)Log off");
		System.out.println("c)Update email");
		System.out.println("d)Unregister");
		System.out.println("e)Update date of birth");
		
		System.out.println("Enter your selection");
		    ////////////////////////////////////////////////////////////////
		   //												             //
		  //	char "selection" copying direct value of String "input"	//
		 //												               //
		////////////////////////////////////////////////////////////////
		selectionInput = sc.next();
		selection = selectionInput.charAt(0);
		
		System.out.println("You selected " + selection);
		
		if ((selection == 'a')||(selection=='A'))
		{
			System.out.println("Change password");
		}

		else 
			System.out.print("");
		
		if ((selection == 'b' )||(selection == 'B'))
		{
			System.out.println("Log off");
		}
		
		else
			System.out.print("");
		
		if ((selection == 'c' )||(selection == 'C'))
		{
			System.out.println("Update email");
		}

		else
			System.out.print("");
		
		if ((selection == 'd' )||(selection == 'D'))
		{
			System.out.println("Unregister");
		}
		
		else
			System.out.print("");
			
		if ((selection == 'e' )||(selection == 'E'))
		{
			System.out.println("Update date of birth");
		}
		
		else
			System.out.print("");
			
		if (!((selection == 'a')||(selection=='A')||(selection == 'b' )||(selection == 'B')||(selection == 'c' )||(selection == 'C')||(selection == 'd' )||(selection == 'D')||(selection == 'e' )||(selection == 'E')))
				System.out.println("Your selection was none of the above.");
		
		else
			System.out.print("");
	}
}
