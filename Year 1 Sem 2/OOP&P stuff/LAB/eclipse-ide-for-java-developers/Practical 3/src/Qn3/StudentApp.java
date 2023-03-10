package Qn3;
import java.util.Scanner;
public class StudentApp {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("Please enter your name: ");
		String name = sc.nextLine();
	
		int redo;
		Student s = new Student(name);
		
		do
		{
			System.out.println("\nWould you like to: ");
			System.out.println("1) Add quiz");
			System.out.println("2) Get total score ");
			System.out.println("3) Get average score");
			System.out.println("4) Quit\n");
			
			do
			{
				System.out.print("I would like to: ");
				int choice=sc.nextInt();
				redo=0;
				if (choice==1)
				{
					++redo;
					++redo;
					System.out.print("What is your score?");
					int score=sc.nextInt();
					s.addQuiz(score);
				}
				else if (choice==2)
				{
					++redo;
					++redo;
					s.getTotalScore();
				}
				else if(choice==3)
				{
					++redo;
					++redo;
					s.getAverageScore();
				}
				else if(choice==4)
				{
					System.out.println("Quitting...");
				}
				else
				{
					++redo;
					System.out.println("Please key in again.\n");
				}
			}while(redo==1);
		}while (redo==2);
		sc.close();
	}
}
