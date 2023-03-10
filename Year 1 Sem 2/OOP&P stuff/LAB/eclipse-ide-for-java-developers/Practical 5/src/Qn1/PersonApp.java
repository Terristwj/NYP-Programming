package Qn1;
import java.util.Scanner;
public class PersonApp {
	public static void main(String[] args)
	{
		String name;
		String nric;
		Scanner sc = new Scanner(System.in);
		
		System.out.print("Key in student name: ");
		name=sc.nextLine();
		System.out.print("Key in student NRIC: ");
		nric=sc.nextLine();
		
		Student student = new Student(name, nric);
		
		String adminNo;
		double testMark;
		double examMark;
		
		System.out.print("Key in admin number: ");
		adminNo=sc.nextLine();
		student.setAdminNo(adminNo);
		System.out.print("Key in test mark: ");
		testMark=sc.nextDouble();
		student.setTestMark(testMark);
		System.out.print("Key in exam mark: ");
		examMark=sc.nextDouble();
		student.setExamMark(examMark);
		
		System.out.println();
		student.view();
		
		System.out.println();
		System.out.print("Key in lecturer name: ");
		sc.nextLine();
		name=sc.nextLine();
		System.out.print("Key in lecturer NRIC: ");
		nric=sc.nextLine();
		
		Lecturer lecturer = new Lecturer(name, nric);
		
		String staffId;
		Double totalTeachingHour;
		
		System.out.print("Key in staff ID: ");
		staffId=sc.nextLine();
		lecturer.setstaffId(staffId);
		System.out.print("Key in total teaching hours: ");
		totalTeachingHour=sc.nextDouble();
		lecturer.setTotalTeachingHour(totalTeachingHour);
		
		System.out.println();
		lecturer.view();
		
		sc.close();
	}
}
