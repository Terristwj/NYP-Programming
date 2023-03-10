package Qn2;
import java.util.Scanner;
import java.util.ArrayList;
public class StockApp {
	public static void main(String[] args)
	{
		String symbol;
		String name;
		double openingPrice;
		double currentPrice;
		Scanner sc = new Scanner(System.in);
		ArrayList<Stock> stocks = new ArrayList<Stock>();
		
		int redo=0;
		do
		{
			System.out.print("Enter symbol: ");
			symbol=sc.nextLine();
			if(!symbol.equalsIgnoreCase("QUIT"))
				++redo;
			else
			{
				System.out.print("Enter name: ");
				name=sc.nextLine();
				System.out.print("Enter opening price (S$): ");
				openingPrice=sc.nextDouble();
				System.out.print("Enter market price (S$): ");
				currentPrice=sc.nextDouble();
				sc.nextLine();
				System.out.println("");
				
				stocks.add(new Stock(symbol, name, openingPrice, currentPrice));
			}
			
		}while(redo==0);
		
		System.out.println("");
		for(int i=0; i<stocks.size(); i++)
		{
			System.out.println(stocks.get(i));
		}
		System.out.println("Good Bye!");
		sc.close();
	}
}
