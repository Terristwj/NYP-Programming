/* 	
  	Name:			Tan Wei Jun, Terris
	Admin number:	172737L
	PEM group:		BI1703
*/

import java.util.Scanner;
public class WaterConsumption 
{
	public static void main (String []args)
	{	
		double waterConsumptionInput;
		double price = 0;
		double costPerLitre;
		int properInput = 0;
		int redo = 0;
			
		do
		{
			try
			{
			do
			{
				redo = 0;
				Scanner sc = new Scanner(System.in);
				
				System.out.print("Please enter your monthly water consumption:");
				waterConsumptionInput = sc.nextDouble();
				
				if (waterConsumptionInput <= 1000 && waterConsumptionInput >= 0)
				{
					++properInput;
					costPerLitre = 0.10;
					price = waterConsumptionInput * costPerLitre;
				}
				
				else if (waterConsumptionInput <= 2000 && waterConsumptionInput > 1000)
				{
					++properInput;
					costPerLitre = 0.25;
					price = waterConsumptionInput * costPerLitre;
				}
				
				else if (waterConsumptionInput < 5000 && waterConsumptionInput > 2000)
				{
					++properInput;
					costPerLitre = 0.35;
					price = waterConsumptionInput * costPerLitre;
				}
				else if (waterConsumptionInput >= 5000)
				{
					++properInput;
					costPerLitre = 0.50;
					price = waterConsumptionInput * costPerLitre;
				}
				
				
				if (properInput == 1)
				{
					System.out.print("Monthly water consumption = " + waterConsumptionInput + " litres and amount payable = $");
					System.out.printf("%.2f", price);
				}
				else 
				{
					++redo;
					System.out.println("That was a invalid input.");
					System.out.println("Please try again.\n");
				}
			}
			while (redo == 1);
			}
			catch (Exception ex)
			{
				redo++;
				System.out.println("That was a invalid input.");
				System.out.println("Please try again.\n");
			}
		}
		while (redo == 1);
	}

}
