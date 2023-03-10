import java.text.DecimalFormat;
import java.util.Scanner;
public class ExamResult {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		DecimalFormat fm = new DecimalFormat("0.0");
		
		int [] [] marks ={ {75, 80, 85},
						   {60, 68, 74},
						   {81, 63, 77},
						   {55, 76, 67},
						   {62, 45, 68},
						   {52, 47, 51} };
		
		String [] name = {	"Jane", "John", "Jerome", 
							"Jason", "Jessica", "Joanne"};
		
		String [] subject = { "English", "Math", "Science"};
		
		double total = 0;
		double avg;
			
		String studentName;
		int row = -1;
		int col = 0;
		int redo;
		
		for (int i=0; i<name.length; i++)
		{
			for (int x=0; x<marks[i].length; x++)
			{
				total += marks[i][x];
			}
			avg = total/marks[i].length;
			total = 0;
			System.out.println("Average marks of " + name[i] + " = " + fm.format(avg));
			
		}
		
		System.out.println("\n");
		
		for (int i=0; i<subject.length; i++)
		{
			for (int x=0; x<marks.length; x++)
			{
				total += marks[x][i];
			}
			avg = total/marks.length;
			total = 0;
			System.out.println("Average results for " + subject[i] + " = " + fm.format(avg));
		}
		
		do
		{
			redo = 0;
			try
			{
			System.out.print("\n\nEnter student name: ");
			studentName = sc.nextLine();
			
			if ( studentName.equals(name[0]) )
			{
				row = 0;
			}
			else if ( studentName.equals(name[1]) )
			{
				row = 1;
			}
			else if ( studentName.equals(name[2]) )
			{
				row = 2;
			}
			else if ( studentName.equals(name[3]) )
			{
				row = 3;
			}
			else if ( studentName.equals(name[4]) )
			{
				row = 4;
			}
			else if ( studentName.equals(name[5]) )
			{
				row = 5;
			}
			
			System.out.println("Results of " + name[row]);
			System.out.println("================");
			System.out.println("Results for English = " + marks[row][col]);
			++col;
			System.out.println("Results for English = " + marks[row][col]);
			++col;
			System.out.println("Results for English = " + marks[row][col]);
		
			}
			catch (Exception ex)
			{
				++redo;
				System.out.println("No such name.\nTry again");
			}
		}
		while (redo == 1);
	}
}
