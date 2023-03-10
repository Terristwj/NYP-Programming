
public class Qn7 {
	public static void main(String[] args)
	{
		int squareHeight=4;
		int squareArea=squareHeight*squareHeight;
		
		float circle1Radius=3.5f;
		double circle1Area=(Math.PI+circle1Radius)*(Math.PI+circle1Radius);
		
		float circle2Radius=7.2f;
		double circle2Circumference=2*Math.PI*circle2Radius;
		
		System.out.println("a) ((3x7)÷3)->remainder-4-6= "+(3*7%3-4-6));
		System.out.println("b) Area of square with height 4cm= "+squareArea+"cm²");
		System.out.println("c) Area of circle of radius 3.5cm= "+circle1Area+"cm²");
		System.out.println("d) Circumference of circle of radius 7.2cm= "+circle2Circumference+"cm");
	}
}
