import java.util.Scanner;
public class Qn3 {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		char letter;
		String sample;
		int redo;
		do
		{	
			do
			{
				System.out.print("Enter a letter grade: ");
				sample = sc.next();
			}
			while (sample.length()!=1);
			
			redo = 0;
			letter = sample.charAt(0);
			
			if (letter=='a'||letter=='A')
				System.out.println("The numeric value is 4.");
			else if (letter=='b'||letter=='B')
				System.out.println("The numeric value is 3.");
			else if (letter=='c'||letter=='C')
				System.out.println("The numeric value is 2.");
			else if (letter=='d'||letter=='D')
				System.out.println("The numeric value is 1.");
			else if (letter=='f'||letter=='F')
				System.out.println("The numeric value is 0.");
			else
				++redo;
		}
		while (redo==1);
	}
}
