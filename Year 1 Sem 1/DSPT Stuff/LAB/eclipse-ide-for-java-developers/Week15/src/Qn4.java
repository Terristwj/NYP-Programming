import java.util.Scanner;
import java.text.DecimalFormat;
public class Qn4 {
	public static void main(String[] args){
		Scanner sc = new Scanner(System.in);
		DecimalFormat fm = new DecimalFormat("0000");
		
		int [] PSIReadings = new int [24];
		int nextSet = 0;
		
		int [] hours = new int [24];
		int theHour = 0;
		for (int x=0; x<hours.length; x++)
		{
			hours[x]=theHour;
			theHour+=100;
		}
		int i = 0;		//next set for hours
		
		int redo = 0;
		double avg;
		
		double [] highPSIArr = new double [10];
		double avePSI;
		int n = 0;
		int daysPassed = 0;
		double max = 0;
		
		do
		{
			System.out.print("Enter PSI for "+fm.format(hours[i])+" hour -> ");
			PSIReadings[nextSet] = sc.nextInt();
			nextSet +=1;
			++redo;
			++i;
		}
		while( redo!=24);
		
		avg = findAverage(PSIReadings);
		System.out.println("The average PSI reading is: "+avg);
		
		do
		{
			avePSI = avg;
			if(n == highPSIArr.length)
			{
				for (int x = 0; x<highPSIArr.length; x++)
				{
					max = avePSI;
					if(highPSIArr[x]<max)
						highPSIArr[x] = max;
				}
			}
			else
			{
				highPSIArr[n] = avePSI;
				n++;
			}
			daysPassed++;
		}
		while( daysPassed<364);
		
	}
	
	
	
	public static double findAverage(int[] PSIReadings)
	{
		int total=0;
		double Avg;
		
		for (int i = 0; i<PSIReadings.length; i++)
		{
			total += PSIReadings[i];
		}
		Avg = total/PSIReadings.length;
		return Avg;
	}
}
