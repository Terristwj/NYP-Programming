package Qn3;
import java.util.GregorianCalendar;
public class StudentApp {

	public static void main(String[] args) {
		GregorianCalendar cal = (GregorianCalendar) GregorianCalendar.getInstance();
		int date = cal.get(GregorianCalendar.DAY_OF_MONTH);
		int month = cal.get(GregorianCalendar.MONTH);
		int year = cal.get(GregorianCalendar.YEAR);
		String enrolmentDate = date+"-"+month+"-"+year;
		
		Student s = new Student ("Ms Phoon", 'F', enrolmentDate);
		System.out.println("=== First view ===");
		s.view();
		s.setMark(100);
		System.out.println("=== Second view ===");
		s.view();
		
	}

}
