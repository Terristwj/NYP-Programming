/* 	
  	Name:			Tan Wei Jun, Terris
	Admin number:	172737L
	PEM group:		BI1703
*/

import java.util.Scanner;
public class WaterConsumptionProcessor 
{
	public static void main(String [] args)
	{
		double waterConsumptionInput;
		int redo = 0;
		double price = 0;
		double pricePerLitre;
		
		do
		{
			try
			{
			do
			{
				redo = 0;
				Scanner sc = new Scanner(System.in);
				
				System.out.print("Please enter your moonthly water consumption: ");
				waterConsumptionInput = sc.nextDouble();
				
				if (waterConsumptionInput >= 0 && waterConsumptionInput <= 1000)
				{
					redo++;
					pricePerLitre = 0.10;
					price = pricePerLitre * waterConsumptionInput;
				}
				else if (waterConsumptionInput > 1000 && waterConsumptionInput <= 2000)
				{
					redo++;
					pricePerLitre = 0.25;
					price = pricePerLitre * waterConsumptionInput;
				}
				else if (waterConsumptionInput > 2000 && waterConsumptionInput < 5000)
				{
					redo++;
					pricePerLitre = 0.35;
					price = pricePerLitre * waterConsumptionInput;
				}
				else if (waterConsumptionInput >= 5000)
				{
					redo++;
					pricePerLitre = 0.50;
					price = pricePerLitre * waterConsumptionInput;
				}
				else
				{
					redo++;
					redo++;
				}
					
				if (redo == 1)
				{
					System.out.print("Monthly water consumption = " + waterConsumptionInput + " litres and amount payable = $");
					System.out.printf("%.2f", price);
					System.out.println("");
				}
				else if (redo == 2)
					System.out.println("Invalid input. Monthly water consumption must be >=0");
			}
			while (redo == 1);
			}
			catch (Exception ex)
			{
				++redo;
				System.out.println("Invalid input.");
				System.out.println("Please try again.\n");
			}
		}
		while (redo == 1);
	}

}
