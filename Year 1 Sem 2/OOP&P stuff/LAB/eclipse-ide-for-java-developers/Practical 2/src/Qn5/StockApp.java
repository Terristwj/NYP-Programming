package Qn5;

public class StockApp {
	public static void main(String[]args)
	{
		Stock s = new Stock("ORCL","ORACLE CORPORATION", 34.50, 34.35);
		double percentChange = s.calPercentchange();;
		s.viewPercentChange(percentChange);
	}
}
