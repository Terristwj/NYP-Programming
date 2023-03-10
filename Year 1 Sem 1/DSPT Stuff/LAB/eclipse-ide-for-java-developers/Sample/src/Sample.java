import java.util.Scanner;
public class Sample
{ 
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		char maritalStatus;
		String maritalStatusInput;
		
		int taxableIncome;
		double tax;
		int taxAmountOver;
		
		System.out.print("Please key in marital status : ");
		maritalStatusInput = sc.next();
		maritalStatus = maritalStatusInput.charAt(0);
		
		System.out.print("Please key in taxable income : $");
		taxableIncome = sc.nextInt();
		
		if ((maritalStatus == 's')||(maritalStatus == 'S'))
		{
			if ((taxableIncome <= 32000)&&(taxableIncome >= 0))
				{
					tax = taxableIncome*0.10;
					System.out.printf("Your tax is $%.2f",tax);
				}
			else if (taxableIncome >32000)
				{
					taxAmountOver = 32000;
					tax = (taxableIncome - taxAmountOver)*0.25+3200;
					System.out.printf("Your tax is $%.2f",tax);
				}
		}
		
		else if ((maritalStatus == 'm')||(maritalStatus == 'M'))
		{
			if ((taxableIncome <=64000)&&(taxableIncome >= 0))
				{
					tax = taxableIncome*0.10;
					System.out.printf("You tax is $%.2f",tax);
				}
			else if (taxableIncome > 64000)
				{
					taxAmountOver = 64000;
					tax = (taxableIncome - taxAmountOver)*0.25+6400;
					System.out.printf("Your tax is $%.2f",tax);
				}
		}
		else
			System.out.print("Invalid input.");
	}
}