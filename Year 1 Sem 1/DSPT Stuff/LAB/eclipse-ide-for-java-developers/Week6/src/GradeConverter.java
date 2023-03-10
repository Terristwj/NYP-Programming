import java.util.Scanner;
public class GradeConverter {
	public static void main (String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		double gPA;
		
		System.out.print("Please key in your GPA : ");
		gPA = sc.nextDouble();
		
		if ((gPA<1)||(gPA>4.0))
			System.out.print("Error");
		
		else if ((gPA<2.0)&&(gPA>=1.0))
				System.out.print("Your grade is D");
		
		else if ((gPA<3.0)&&(gPA>=2.0))
				System.out.print("Your grade is C");
		
		else if ((gPA<4.0)&&(gPA>=3.0))
				System.out.print("Your grade is B");
		
		else if (gPA==4.0)
				System.out.print("Your grade is A");
		
	}
}
