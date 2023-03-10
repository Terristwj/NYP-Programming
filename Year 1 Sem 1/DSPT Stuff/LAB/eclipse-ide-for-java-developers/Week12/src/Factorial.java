import java.util.Scanner;
public class Factorial {
	public static void main(String[] args){
		Scanner sc = new Scanner (System.in);
		int input;
		int factorialValue;
		
		System.out.print("Please key in a number : ");
		input = sc.nextInt();
		
		factorialValue = factorial(input);
		
		System.out.println("The factorial value of " + input + "! =  "+ factorialValue );
		
	}
	
	public static int factorial (int num){
		int sampleNum = 1;
		for( int i=1; i<=num ; ++i){
			sampleNum = sampleNum*i;
		}
		num = sampleNum;
		return num;
	}

}
