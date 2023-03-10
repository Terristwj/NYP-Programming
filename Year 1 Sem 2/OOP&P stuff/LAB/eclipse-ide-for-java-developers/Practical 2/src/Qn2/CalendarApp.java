package Qn2;
import java.util.GregorianCalendar;
public class CalendarApp {
	public static void main(String[] args)
	{
		GregorianCalendar cal = (GregorianCalendar) GregorianCalendar.getInstance();
	
		int date = cal.get(GregorianCalendar.DAY_OF_MONTH);
		int month = cal.get(GregorianCalendar.MONTH);
		int year = cal.get(GregorianCalendar.YEAR);
		
		System.out.println(date+"-"+month+"-"+year);
		
		GregorianCalendar birthday = new GregorianCalendar(2000, 8, 3);
		int birthDate = birthday.get(GregorianCalendar.DAY_OF_MONTH);
		int birthMonth = birthday.get(GregorianCalendar.MONTH);
		int birthYear = birthday.get(GregorianCalendar.YEAR);
		
		System.out.println("My birthday is: "+birthDate+"-"+birthMonth+"-"+birthYear);
	}
}
