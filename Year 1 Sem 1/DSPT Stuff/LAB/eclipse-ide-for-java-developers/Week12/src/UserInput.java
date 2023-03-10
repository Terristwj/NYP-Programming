import java.util.Scanner;
public class UserInput {
	public static void main(String[] args){
		int userInput;
		
		userInput = readOddNum();
		System.out.println("The odd interger is " + userInput);
	}
	public static int readOddNum(){
		Scanner sc = new Scanner (System.in);
		int numInput;
		int redo;
			
		do
		{
			redo = 0;
			System.out.print("Enter an odd number : ");
			numInput = sc.nextInt();
			
			if ( (numInput%2) == 0 || numInput < 0)
			{
				++redo;
				System.out.println("Wrong input!\n");
			}
		}
		while (redo == 1);
		return numInput;
	}

}
