package Qn2;

public class Stock {
	private String symbol;
	private String name;
	private double openingPrice;
	private double currentPrice;
	
	public Stock(String symbol, String name, double openingPrice, double currentPrice) {
		super();
		this.symbol = symbol;
		this.name = name;
		this.openingPrice = openingPrice;
		this.currentPrice = currentPrice;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getOpeningPrice() {
		return openingPrice;
	}

	public void setOpeningPrice(double openingPrice) {
		this.openingPrice = openingPrice;
	}

	public double getCurrentPrice() {
		return currentPrice;
	}

	public void setCurrentPrice(double currentPrice) {
		this.currentPrice = currentPrice;
	}
	public double calPercentChange(){
		double change = (currentPrice - openingPrice);
		return change/openingPrice * 100;
	}
	
	 @Override
	  public String toString() 
	 { 
		if (calPercentChange()<0)
			 System.out.printf(symbol+","+name+"\nA drop of %.3f percent",Math.abs(calPercentChange()));
		else if (calPercentChange()>0)
			System.out.printf(symbol+","+name+"\nAn increase of %.3f percent",calPercentChange());
		else
			System.out.printf(symbol+","+name+"\nNo change in percent");
		return "";
	 }
	
}