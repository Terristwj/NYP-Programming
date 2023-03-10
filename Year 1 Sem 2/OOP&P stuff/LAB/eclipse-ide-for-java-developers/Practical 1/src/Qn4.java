import java.util.Scanner;
public class Qn4 {

	/*
		read value
		store value as highest temperature
		set highest month to 1
		for current month from 2 to 12
			read value
			if value is higher than the highest temperature
				set the highest temperature to the value
				set the highest month to current month
		display the highest month
	*/
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		double highNum;
		double num;
		int month=1;
		String output;
		
		System.out.println("Please key 12 temperature values in degrees Celsius (one for each month and in order by month).");
		highNum = sc.nextDouble();
		for (int i = 2; i<13; i++)
		{
			num = sc.nextInt();
			if(num>highNum)
			{
				highNum = num;
				month=i;
			}
		}
		if (month == 1)
			output="January was the warmest month this year!";
		else if (month == 1)
			output="February was the warmest month this year!";
		else if (month == 1)
			output="March was the warmest month this year!";
		else if (month == 1)
			output="April was the warmest month this year!";
		else if (month == 1)
			output="May was the warmest month this year!";
		else if (month == 1)
			output="June was the warmest month this year!";
		else if (month == 1)
			output="July was the warmest month this year!";
		else if (month == 1)
			output="August was the warmest month this year!";
		else if (month == 1)
			output="September was the warmest month this year!";
		else if (month == 1)
			output="October was the warmest month this year!";
		else if (month == 1)
			output="November was the warmest month this year!";
		else
			output="December was the warmest month this year!";
		System.out.println(output);
	}
}
