public class Myself {
	public static void main(String[] args)
	{	
		final double KG_TO_POUND = 2.2;
		
		String name = "Phoon Lee Kien";
		
		String adminNo;
		int age;
		char gender;
		double weight, height, bmi;
		
		adminNo = "151234A";
		age = 17;
		gender = 'F';
		weight = 52.5 ;
		height = 1.7 ;
		
		bmi = weight / (height * height);
		
		double weightPound = KG_TO_POUND * weight;
		
		System.out.println("Name     : " + name);
		System.out.println("Admin No : " + adminNo);
		System.out.println("Age      : " + age);
		System.out.println("Gender   : " + gender);
		System.out.println("Weight   : " + weight + "kg (" + weightPound + " pounds)");
		System.out.println("Height   : " + height);
		System.out.println("BMI      : " + bmi);
	}
}
