import java.util.Scanner;
public class PrimeNumber {
	public static void main(String[] args){
		int input;
		boolean primeNumberIdentifier;
		
		input = getInput();
		
		primeNumberIdentifier = isPrime(input);
		
		System.out.println("\nThe number you typed is a " + primeNumberIdentifier + " prime number.");
	}
	
	public static boolean isPrime (int n){
		System.out.println("\nPrime numbers from 1 to 50: ");
		System.out.println("2 3 5 7 11 13 17 19 23 29 31 37 41 43 47");
		for(int i=2; i<n; i++) {
	        if( n%i == 0 )
	            return false;
	    }
	    return true;
	}
	
	public static int getInput(){
		Scanner sc = new Scanner (System.in);
		int input;
		int redo;
		
		do
		{
			redo = 0;
			System.out.print("Please key in a number from 1 to 50 : ");
			input = sc.nextInt();
			if (input < 1 || input > 50)
			{
				System.out.println("Please key in a valid input.\n");
				++redo;
			}
		}
		while (redo == 1);
		
		
		return input;
	}
}
