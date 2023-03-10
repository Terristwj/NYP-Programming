/**************************************************************
Program name: Rectangle.java
Description	: To calculate the area and perimeter of a rectangle
Author		: Tan Wei Jun Terris
Mentor Grp	: BI1703
Admin No	: 172737L
Created		: 21/6/2017
**************************************************************/
public class Rectangle {
	public static void main (String [] args) {
		int x = 3;
		int y = 4;
		int area;
		int perimeter;
		
		area = x*y;
		perimeter = (2*x) + (2*y);
		
		area = 100;
		perimeter = 200;
		
		System.out.println("Area of rectangle = " + area );
		System.out.println("Perimeter of rectangle = " + perimeter );
	}
}
