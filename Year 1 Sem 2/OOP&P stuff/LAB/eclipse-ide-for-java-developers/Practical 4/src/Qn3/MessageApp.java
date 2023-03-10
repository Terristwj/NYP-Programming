package Qn3;
import java.util.Scanner;
public class MessageApp {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		String sender;
		String recipient;
		String msgTxt;
		
		System.out.print("Key in name: ");
		sender=sc.nextLine();
		System.out.print("Key in recipient's name: ");
		recipient=sc.nextLine();
		
		Message message = new Message(sender, recipient);
		
		System.out.print("Key in message: ");
		msgTxt=sc.nextLine();
		message.append(msgTxt);
		
		System.out.println(message.toString());
		sc.close();
	}
}
