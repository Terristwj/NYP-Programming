import java.util.Scanner;
public class Qn1 {
	public static void main (String[] args)
	{
		Scanner sc = new Scanner (System.in);
		
		String input;
		String inputLower;
		
		System.out.println("Enter a word to convert:");
		input = sc.nextLine();
		inputLower = input.toLowerCase();
		
		System.out.print(input + " in lower case: " + inputLower);
	}

}
