import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Scanner;

public class Qn6 {
	public static void main(String[] args)
	{
		Path dPath = FileSystems.getDefault().getPath("resources", "Qn6 Text.txt");
		File file = new File(dPath.toUri());
		
		Scanner sc = new Scanner(System.in);
		int response=0;
		String yesNo=null;
		String saveLine="";
		do
		{
			System.out.println("Do you want to \n(1)Add Friend \n(2)Display Friend List");
			System.out.print("Your answer: ");
			response = sc.nextInt();
			sc.nextLine();
			
			if (response ==1)
			{	
				do
				{
					System.out.println();
					System.out.print("Please key in name: ");
					String name = sc.nextLine();
					System.out.print("Please key in contact: ");
					String contact = sc.nextLine();
					while (contact.length()!=8)
					{
						System.out.println("Key in a proper contact.\n");
						System.out.print("Please key in name: ");
						name = sc.nextLine();
						System.out.print("Please key in contact: ");
						contact = sc.nextLine();
					}
					System.out.print("Please key in likes: ");
					int likes = sc.nextInt();
					
					Friend f = new Friend(name, contact, likes);
					
					ArrayList<Friend> fList = new ArrayList<Friend>();
					fList.add(f);
					do
					{
						sc.nextLine();
						System.out.println("Would you like to ad1d another friend? (Yes/No)");
						yesNo=sc.nextLine();
						
						for (int i =0; i<fList.size(); i++)
						{
							Friend sample = fList.get(i);
							saveLine += "Name: "+sample.getName();
							saveLine += "\nContact: "+ sample.getContact();
							saveLine += "\nLikes: " +sample.getLikes();
							saveLine +="\n\n";
						}
						
						if (yesNo.equalsIgnoreCase("no"))
						{
							try (PrintWriter writer=new PrintWriter(file))
							{
								for (int i =0; i<fList.size(); i++)
								{	
									writer.println(saveLine);
									writer.close();
								}
							}
							catch (FileNotFoundException e)
							{
								e.printStackTrace();
							}
						}
						else if (!yesNo.equalsIgnoreCase("No")&&!yesNo.equalsIgnoreCase("yes"))
							System.out.println("Please key in proper answer");
					}
					while(!yesNo.equalsIgnoreCase("no")&&!yesNo.equalsIgnoreCase("yes"));
				}while (yesNo.equalsIgnoreCase("yes"));
			}
			
			else if (response==2)
			{
				Scanner in=null;
				try
				{
					System.out.println();
					in=new Scanner(file);
					while (in.hasNext())
					{
						System.out.println(in.nextLine()+" ");
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
				System.out.println();
			}
			else
			{
				System.out.println("Key in proper answer.\n");
			}
		}while (response != 1 || response !=2);
	}
}
