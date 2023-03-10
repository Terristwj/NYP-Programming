
public class CoinMachine {
	public static void main(String[] args)
	{
		int centsReceived=1222;
		int dollars=centsReceived/100;
		int cents=centsReceived%100;
		
		System.out.println("Total amount of cents: "+centsReceived
				+"\nNumber of dollars: "+dollars+" dollars"
						+ "\nNumber of cents: "+cents+" cents");
	}
}
