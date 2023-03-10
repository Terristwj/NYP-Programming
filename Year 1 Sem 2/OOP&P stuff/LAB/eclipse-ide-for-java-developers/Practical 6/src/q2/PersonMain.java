package q2;

import java.util.ArrayList;
/**
 * Sample codes to demonstrate that methods can be quite similar
 * but situations or input data are different.
 */
public class PersonMain {
	/**
	 * A static method to take in an ArrayList of students and
	 * search for the student with the highest final marks.
	 * 
	 * @param name
	 *            ArrayList of Student
	 * @param salary
	 *            Student object
	 */
	public static Student getTopStudent(ArrayList<Student> pList){
		Student top = pList.get(0);
		for (Student s : pList){
			if (s.computeFinalMark() > top.computeFinalMark())
				top = s;
		}
		return top;
	}
	
	public static Lecturer getHighestLecturer(ArrayList<Lecturer> pList){
		Lecturer highest = pList.get(0);
		for (Lecturer l : pList){
			if (l.computeSalary() > highest.computeSalary())
				highest = l;
		}
		return highest;
	}
	
	public static void main(String[] args) {
		ArrayList<Student> sList = new ArrayList<Student>();
		
		Student stud1 = new Student("1231234A", "Tan Mei Mei", "120101A");
		stud1.setTestMark(30);
		stud1.setExamMark(100);
		sList.add(stud1);
		
		Student stud2 = new Student("4455667B", "Joel Tan", "121234B");
		stud2.setTestMark(50);
		stud2.setExamMark(72);
		sList.add(stud2);
		
		Student stud3 = new Student("9412345C", "Ang Sin Chin", "120003C");
		stud3.setTestMark(50);
		stud3.setExamMark(100);
		sList.add(stud3);
		
		Student top = getTopStudent(sList);
		System.out.print("Top student is " + top.getName());
		System.out.println(" with " + top.computeFinalMark() + " marks.");
		
		// Using the same approach, add another static method to 
		// search for the lecturer who earns the highest salary.
		System.out.println();
		
		ArrayList<Lecturer> lList = new ArrayList<Lecturer>();
		
		Lecturer lect1 = new Lecturer("1234567A", "Phoon Lee Kien", "1234A");
		lect1.setTotalTeachingHr(30); 
		lList.add(lect1);
		
		Lecturer lect2 = new Lecturer("7654321B", "Andrea Tan", "5678B");
		lect2.setTotalTeachingHr(40); 
		lList.add(lect2);
		
		Lecturer lect3 = new Lecturer("1122334C", "Aloysius Thong", "1212C");
		lect3.setTotalTeachingHr(20); 
		lList.add(lect3);
		
		Lecturer lect4 = new Lecturer("7897890D", "Lim Soo Khim", "8899D");
		lect4.setTotalTeachingHr(15); 
		lList.add(lect4);
		
		Lecturer highest = getHighestLecturer(lList);
		System.out.print("Highest lecturer is " + highest.getName());
		System.out.println(" with $" + highest.computeSalary() + ".");
	}

}
