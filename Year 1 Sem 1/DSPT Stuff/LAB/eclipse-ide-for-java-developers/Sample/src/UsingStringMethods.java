
public class UsingStringMethods 
{
	public static void main(String[] args) 
	{
		//Please consult the below documentation on other Strings method 
		//	https://docs.oracle.com/javase/8/docs/api/java/lang/String.html
		
		/*
		 	public char charAt(int index)

			Returns the char value at the specified index. 
			An index ranges from 0 to length() - 1. 
			The first char value of the sequence is at index 0, the next at index 1, and so on, as for array indexing. 
		 */
		String str1 = "My Java Test String";
		System.out.println("The string is " + str1);
		
		//Get the 4th character for this string. 
		//	1st character is at index = 0, 4th character will be at index = 3
		char fourthChar = str1.charAt(3);
		System.out.println("Using charAt(), \tThe 4th character is of this string is "+fourthChar);
		
		/*
			public String substring(int beginIndex, int endIndex)

			Returns a string that is a substring of this string. 
			The substring begins at the specified beginIndex and extends to the character at index endIndex - 1. 
			Thus the length of the substring is endIndex-beginIndex. 
			
			Examples: 

				"hamburger".substring(4, 8) returns "urge"
				"smiles".substring(1, 5) returns "mile"
		*/

		String fourthCharString = str1.substring(3,4);
		System.out.println("Using substring(), \tThe 4th character is of this string is "+fourthCharString);

	}

}