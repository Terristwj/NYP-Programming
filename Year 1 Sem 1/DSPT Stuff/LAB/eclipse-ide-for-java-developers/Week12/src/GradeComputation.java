/**************************************************************
Program name: GradeComputation
Description : To compute the grade based on the marks
Author : <enter your name>
Mentor Grp : <enter your mentor group number>
Admin No : <enter your admin number>
Created : <enter today's date>
**************************************************************/
import java.util.Scanner;
public class GradeComputation {
	public static void main (String args[]) {

		double mark;
		char grade;
		mark = readMark();
		grade = computeGrade(mark);
		System.out.println("Your mark is " + mark);
		System.out.println("Your grade is " + grade);
	}
	public static double readMark () {
		double mark;
		Scanner sc = new Scanner(System.in);
		System.out.print("\nEnter mark : ");
		mark = sc.nextDouble();
		return mark ;
	}
	public static char computeGrade (double mark) {
		char grade = ' ';
		if (mark >= 80)
			grade = 'A';
		else if (mark >=70)
			grade = 'B';
		else if (mark >=60)
			grade = 'C';
		else if (mark >=50)
			grade = 'D';
		else if (mark < 50)
			grade = 'F';
		return grade;
	} 
}