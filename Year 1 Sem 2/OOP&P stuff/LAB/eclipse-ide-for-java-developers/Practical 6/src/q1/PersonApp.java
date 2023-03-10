package q1;
import java.util.ArrayList;
import java.util.Random;
public class PersonApp {

	public static void main(String[] args) 
	{
		Random ran = new Random();
		
		Student stud1 = new Student("T0054154S", "Ab Cde", "426314U");
		stud1.setTestMark(ran.nextInt(100));
		stud1.setExamMark(ran.nextInt(100));
		
		Student stud2 = new Student("T0036254P", "Fg Hij", "742464G");
		stud2.setTestMark(ran.nextInt(100));
		stud2.setExamMark(ran.nextInt(100));
		
		Student stud3 = new Student("T0125242W", "Kl Mno", "098556J");
		stud3.setTestMark(ran.nextInt(100));
		stud3.setExamMark(ran.nextInt(100));
		
		Lecturer lect1 = new Lecturer("S0051263L", "Ally", "4567A");
		lect1.setTotalTeachingHr(ran.nextInt(40));  
		
		Lecturer lect2 = new Lecturer("S0231326T", "Corner", "8910B");
		lect2.setTotalTeachingHr(ran.nextInt(40));  
		
		ArrayList<Person> people = new ArrayList<Person>();
		people.add(stud1);
		people.add(stud2);
		people.add(stud3);
		people.add(lect1);
		people.add(lect2);

		for (int i=0; i<people.size();i++)
		{
			people.get(i).view();
		}
		
		double avgMark = calAvgMark(people);
		System.out.printf("The average final mark of students is %.2f",avgMark);
	}
	
	public static double calAvgMark(ArrayList<Person> people)
	{
		double totalMark=0;
		double avgMark;
		int numStudents=0;
		
		for (int i=0; i<people.size(); i++)
		{
			//Determine wheather the person is a student.
			if (people.get(i) instanceof Student)
			{
				totalMark += ((Student)people.get(i)).computeFinalMark();
				numStudents++;
			}
		}
		
		avgMark = totalMark/numStudents;
		
		return avgMark;
	}
}
