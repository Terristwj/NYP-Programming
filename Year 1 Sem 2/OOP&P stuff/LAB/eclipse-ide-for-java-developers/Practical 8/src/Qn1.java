import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.Scanner;

public class Qn1 {
	public static void main(String[] args)
	{
		// Get file location/path
		Path dPath = FileSystems.getDefault().getPath("resources", "Hello.txt");
		
		// Create file object
		File file = new File(dPath.toUri());
		
		// Create print writer object that edits file
		try (PrintWriter writer=new PrintWriter(file))
		{
			writer.println("Hello, World!");
			writer.close();
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		
		// Create Scanner to display text from file into eclipse
		Scanner in=null;
		try
		{
			in=new Scanner(file);
			while (in.hasNext())
			{
				System.out.print(in.next()+" ");
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
