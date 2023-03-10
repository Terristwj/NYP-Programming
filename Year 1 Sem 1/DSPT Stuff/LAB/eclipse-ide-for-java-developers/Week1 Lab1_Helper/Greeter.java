/* Greeter1.java is a simple first Java program that displays
   a greeting to a user.
   Output: A greeting that includes the current date and time.
*/

import java.util.*;                 //Data class

public class Greeter
{
   public static void main(String [] args)
   {
     Date currentDate = new Date();
     String today = currentDate.toString();
     System.out.println("Welcome! Today, " + today + ", you begin your study of Java!");
   }
}