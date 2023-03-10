import java.util.Scanner;
public class Qn5 {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		int redo;
		double startBal;
		double compoundInterest;
		double expense;
		
		do
		{
			redo=0;
			System.out.print("Enter starting account balance(S$): ");
			startBal=sc.nextDouble();
			if(startBal<0)
				++redo;
		}
		while(redo==1);
		do
		{
			redo=0;
			System.out.print("Enter compound interest per month(%): ");
			compoundInterest=sc.nextDouble();
			if(compoundInterest<0)
				++redo;
		}
		while(redo==1);
		do
		{
			redo=0;
			System.out.print("Enter expense per month(S$): ");
			expense=sc.nextDouble();
			if(expense<0)
				++redo;
		}
		while(redo==1);
		int month=0;
		do
		{
			startBal += startBal/100*compoundInterest-expense;
			++month;
		}
		while(startBal>=0);
		System.out.println("The account will be completely depleted in "+month+" months.");
	}

}
