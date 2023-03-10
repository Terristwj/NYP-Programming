import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.Scanner;

public class Qn5 {
	public static void main(String[] args)
	{
		Path dPath = FileSystems.getDefault().getPath("resources", "Qn5 Text.txt");
		
		File file = new File(dPath.toUri());
		
		Scanner in=null;
		try
		{
			in=new Scanner(file);
			double total1=0, total2=0;
			while (in.hasNext())
			{
				String num = in.next();
				total1+=Double.parseDouble(num);
				String num2 = in.next();
				total2+=Double.parseDouble(num2);
			}
			System.out.println(total1);
			System.out.println(total2);
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
