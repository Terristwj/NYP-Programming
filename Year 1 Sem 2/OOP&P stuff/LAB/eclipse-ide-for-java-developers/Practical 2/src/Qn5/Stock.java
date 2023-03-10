package Qn5;

public class Stock {
	private String symbol;
	private String name;
	private double openingPrice;
	private double currentPrice;
	
	public Stock(String symbol, String name, double openingPrice, double currentPrice)
	{
		this.symbol=symbol;
		this.name=name;
		this.openingPrice=openingPrice;
		this.currentPrice=currentPrice;
	}
	
	public double calPercentchange()
	{
		double percentChange=0;
		percentChange=currentPrice/openingPrice*100-100;
		
		return percentChange;
	}
	
	public void viewPercentChange(double percentChange)
	{
		if (percentChange < 0)
		{	
			percentChange = Math.abs(percentChange);
			System.out.printf("A drop of %.3f",percentChange);
			System.out.println(" percent");
		}
		else if (percentChange > 0)
		{
			System.out.printf("A rise of %.3f",percentChange);
			System.out.println(" percent");
		}
		else 
			System.out.println("No change");
	}
}
