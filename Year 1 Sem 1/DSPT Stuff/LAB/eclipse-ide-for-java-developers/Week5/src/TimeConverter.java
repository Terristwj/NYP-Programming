import java.util.Scanner;
public class TimeConverter 
{
	public static void main (String[] args)
	{
		Scanner sc = new Scanner (System.in);
		
		int numOfSec;
		
		System.out.print("Enter total duration in seconds: ");
		numOfSec = sc.nextInt();
		
		//////////////////////////////////////
		//numOfSec is the input of seconds  //
		//numOfSec2 is the output of seconds  //
		//////////////////////////////////////
		int numOfHr, numOfMin, numOfSec2;
		
		numOfSec2 = numOfSec%60;
		numOfMin = numOfSec/60;
		numOfHr = numOfMin/60;
		numOfMin = numOfMin%60;
		
		System.out.println(numOfSec + " seconds is " + numOfHr + " hours, " + numOfMin + " minutes and " + numOfSec2 + " seconds.");
				
	}

}
