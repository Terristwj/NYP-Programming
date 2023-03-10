package Qn1;
import java.util.ArrayList;
import java.util.Random;
public class Qn1 {
	public static void main(String[] args)
	{
		ArrayList<Integer> num = new ArrayList<Integer>();
		System.out.println("Adding 10 random intergers...");
		System.out.println("These are the random numbers generated that are even:");
		Random rand = new Random();
		for (int i=0; i<10; i++)
		{
			int randomInt = rand.nextInt(100);
			num.add(randomInt);
			int x = (int)num.get(i);
			
			if((x%2)==0)
				System.out.print(num.get(i)+"  ");
		}
		
		
		ArrayList<Integer> num2 = new ArrayList<Integer>();
		System.out.println("\n\nAdding a new set of 10 random intergers...");		
		System.out.println("These are the 10 random even numbers generated:");
		for (int i=0; i<10; i++)
		{
			int randomInt = rand.nextInt(100);
			num2.add(randomInt);
			int x = (int)num2.get(i);
			do
			{
				num2.remove(i);
				num2.add((int)(Math.random()*100));
				x = (int)num2.get(i);
			}while((x%2)==0);
			System.out.print(num2.get(i)+"  ");
		}
		
		
		ArrayList<Integer> num3 = new ArrayList<Integer>();
		System.out.println("\n\nAdding a new set of 10 random intergers...");		
		System.out.println("These are the 10 random numbers generated in reverse order:");
		for (int i=0; i<10; i++)
		{
			int randomInt = rand.nextInt(100);
			num3.add(randomInt);
		}
		for (int i=(num3.size()-1); i>=0; i--)
			System.out.print(num3.get(i)+"  ");
		
		
		ArrayList<Integer> num4 = new ArrayList<Integer>();
		System.out.println("\n\nAdding a new set of 10 random intergers...");		
		System.out.println("These are the first and last element:");
		for (int i=0; i<10; i++)
		{
			int randomInt = rand.nextInt(100);
			num4.add(randomInt);
		}
		System.out.print(num4.get(0)+"  "+num4.get(num4.size()-1));
	}

}
