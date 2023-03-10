package q3;
import java.util.ArrayList;

public class InterfaceDemo {
	public static void main(String[] args)
	{
		ArrayList<Measurable> pList = new ArrayList<Measurable>();
		
		Student stud1 = new Student("1231234A", "Tan Mei Mei", "120101A");
		stud1.setTestMark(30);
		stud1.setExamMark(100);
		pList.add(stud1);
		
		Student stud2 = new Student("4455667B", "Joel Tan", "121234B");
		stud2.setTestMark(50);
		stud2.setExamMark(72);
		pList.add(stud2);
		
		Student stud3 = new Student("9412345C", "Ang Sin Chin", "120003C");
		stud3.setTestMark(50);
		stud3.setExamMark(100);
		pList.add(stud3);
		
		Measurable top = getTop(pList);
		System.out.print("Top student is " + ((Student)top).getName());
		System.out.println(" with " + ((Student)top).computeFinalMark() + " marks.");
		
		// Using the same approach, add another static method to 
		// search for the lecturer who earns the highest salary.
		System.out.println();
		
		Lecturer lect1 = new Lecturer("1234567A", "Phoon Lee Kien", "1234A");
		lect1.setTotalTeachingHr(30); 
		pList.add(lect1);
		
		Lecturer lect2 = new Lecturer("7654321B", "Andrea Tan", "5678B");
		lect2.setTotalTeachingHr(40); 
		pList.add(lect2);
		
		Lecturer lect3 = new Lecturer("1122334C", "Aloysius Thong", "1212C");
		lect3.setTotalTeachingHr(20); 
		pList.add(lect3);
		
		Lecturer lect4 = new Lecturer("7897890D", "Lim Soo Khim", "8899D");
		lect4.setTotalTeachingHr(15); 
		pList.add(lect4);
		
		Measurable highest = getTop(pList);
		System.out.print("Highest lecturer is " + ((Lecturer)highest).getName());
		System.out.println(" with $" + ((Lecturer)highest).computeSalary() + ".");
	
		System.out.println("\nHere is a list of people:");
		for (int i = 0; i<pList.size(); i++)
			if (pList.get(i) instanceof Student)
				((Student)pList.get(i)).view();
			else if (pList.get(i) instanceof Lecturer)
				((Lecturer)pList.get(i)).view();
	}
	
	public static Measurable getTop(ArrayList<Measurable> pList)
	{
		Measurable top = pList.get(0);
		for (Measurable s : pList)
		{
			if(s.getMeasure() > top.getMeasure())
				top = s;
		}
		return top;
	}
	
}
