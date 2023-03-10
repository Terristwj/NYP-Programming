import java.util.Scanner;
public class Qn4 {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner (System.in);
		String textInput;
		String textOutput;
		
		System.out.println("Enter a line of text");
		textInput = sc.nextLine();
		textOutput = textInput.replace( "hate" , "love" );
		
		
		System.out.println("I have rephrased that line to : ");
		System.out.println(textOutput);
	}

}
