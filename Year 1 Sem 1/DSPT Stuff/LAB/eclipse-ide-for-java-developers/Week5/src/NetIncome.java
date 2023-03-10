import java.util.Scanner;
public class NetIncome 
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		final double CPF = 0.20;
		//////////////////////////////////////////////////////////
		// YGS = Yearly Gross Salary //MGS= Monthly Gross Salary//
		//////////////////////////////////////////////////////////
		double employeeYGS, netMonthlyIncome, monthlyLoanRepay, employeeMGS;
		
		System.out.print("Key in your yearly gross salary : $");
		employeeYGS = sc.nextDouble();
		
		employeeMGS = employeeYGS/12;
		
		monthlyLoanRepay = 1500;
		netMonthlyIncome = employeeMGS-(employeeMGS*CPF)-monthlyLoanRepay;
		
		System.out.println("Your take-home pay after deducting CPF contribution and the rentail of the company housing is : $" + netMonthlyIncome);
		
		
	}
}
