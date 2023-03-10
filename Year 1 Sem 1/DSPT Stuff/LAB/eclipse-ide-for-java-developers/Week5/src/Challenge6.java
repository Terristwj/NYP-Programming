import java.util.Scanner;
public class Challenge6 
{
	public static void main (String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		double totalPriceOfItem;
		int numOfItems;
		
		System.out.print("Please key in total price of items  : $");
		totalPriceOfItem = sc.nextDouble();
		
		System.out.print("Please key in total number of items : "
				+ "");
		numOfItems = sc.nextInt();
		
		double tax, deliveryCharge, totalCharge;
		
		tax = totalPriceOfItem/100*7;
		deliveryCharge = numOfItems*50/100;
		totalCharge = totalPriceOfItem+tax+deliveryCharge;
		
		System.out.print("This is the total price including tax and delivery charge : $" + totalCharge);
		
		
	}

}
