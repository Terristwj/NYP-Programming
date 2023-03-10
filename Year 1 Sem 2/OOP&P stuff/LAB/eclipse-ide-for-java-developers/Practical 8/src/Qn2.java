import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.Scanner;

public class Qn2 {
	public static void main(String[] args)
	{
		Path dPath = FileSystems.getDefault().getPath("resources", "Qn2 Text.txt");

		File file = new File(dPath.toUri());
		
		Scanner in=null;
		try
		{
			in=new Scanner(file);
			int counter=1;
			while (in.hasNext())
			{
				System.out.println("/* "+counter+" */ "+in.nextLine());
				counter++;
			}
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(in != null)
			{
				in.close();
			}
		}
	}
}
