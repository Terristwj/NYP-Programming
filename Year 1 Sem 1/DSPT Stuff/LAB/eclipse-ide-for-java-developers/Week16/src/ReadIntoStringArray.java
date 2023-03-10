import	java.util.ArrayList;
import java.util.Scanner;
public class ReadIntoStringArray {
	public static void main(String[] args)
	{
		ArrayList<String> arrayList = new ArrayList<String>();
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Key in 5 Stings:");
		
		arrayList.add(sc.nextLine());
		arrayList.add(sc.nextLine());
		arrayList.add(sc.nextLine());
		arrayList.add(sc.nextLine());
		arrayList.add(sc.nextLine());
	
		System.out.println(arrayList);
	}
}
