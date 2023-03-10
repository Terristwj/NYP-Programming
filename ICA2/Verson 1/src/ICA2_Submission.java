import java.util.Scanner;
public class ICA2_Submission {
			/*************************************************************************|
		   /	Name:			Tan Wei Jun, Terris									  |
		  /		Admin Number: 	172737L												  |
	  	 /		Course name:	IT1506 - Data Structure & Programming Techniques	  |
	  	/		Date started:	9/6/2017   -  4.53pm								  |
	   /		Date completed:	29/6/2017  -  2.21pm   							      |
	  /_______________________________________________________________________________| 
	
	
	 ________________________________________________________________________
	|					                                                     |
	|   1      The Main Program:  System to track all payment transactions   |
	| 							  and begin the ride for FunIT theme park  	 |
	|																		 |
	|																		 |
	|							  Option   1: Add players					 |
	|							  Option   2: View entire day transaction	 |
	|							  Option   3: Begin ride					 |
	|							  Option -99: Quit the program				 |
	|________________________________________________________________________|
			 																																																								**/
	public static void main (String[] args)
	{
		int inputOption;
		int option = 0;
		int numOfPlayers = 0;
		String dayTransactionCollector = "";
		String mainDayTransaction= "";
		String transactionDisplayPerRound = "";
		String noTransactionsYet = "No transactions has occurred yet.";
		int lengthOfString;
		String sample;
		int numOfTransactions = 0;
		int transactionsStartWhenNotEqual1 = 1;
		
		do
		{
			try
			{
				displayOption();
				inputOption = option(option);
			
				while (inputOption >=1 && inputOption <= 3)
				{			
					if ( inputOption == 1)
					{
						if (numOfTransactions < 1001)
						{
							if (numOfPlayers < 5)
							{
								System.out.println("\nSelecting: 1");
								System.out.println("Adding ride players.");
								if (numOfPlayers <4) 
								{
									dayTransactionCollector = addingRidePlayersInterface();
									mainDayTransaction = mainDayTransaction + dayTransactionCollector;
									transactionDisplayPerRound = mainDayTransaction;
									System.out.println("Do not re-enter option 1 when there is 5 players, until ride has begin.");
									
									lengthOfString = dayTransactionCollector.length();
									
									if ( lengthOfString == 1 ) 
									{
										//Nothing happends.    -Payment not made.
									}
									
									else
									{
										++transactionsStartWhenNotEqual1;
										++numOfPlayers;
										++numOfTransactions;																				// Payment made.  Fills in 1 or 2 players.
										lengthOfString = dayTransactionCollector.length();
										sample = dayTransactionCollector.substring(lengthOfString-1,lengthOfString);
							
										if (sample.equals("~"))
										++numOfPlayers;
									}
								}
								else if (numOfPlayers ==4)
								{
									dayTransactionCollector = addingRidePlayersInterfaceVer2();
									mainDayTransaction = mainDayTransaction + dayTransactionCollector;
									transactionDisplayPerRound = mainDayTransaction;
									System.out.println("Do not re-enter option 1 when there is 5 players, until ride has begin.");			// Payment made.	 Fills only 1 player.
									
									lengthOfString = dayTransactionCollector.length();
									
									if ( lengthOfString == 1 ) 
									{
										//Nothing happends.    -Payment not made.
									}
									
									else
									{
										++transactionsStartWhenNotEqual1;
										++numOfPlayers;
										++numOfTransactions;
									}
								}
							}
							
							else
							{
								System.out.println("\nMaximum number of players have been reached.");										// 5 Players already.   Disables option 1.
								System.out.println("Begin ride to reset number of players.");
							}
							inputOption = 0;
						}
						else 
						{
							System.out.println("\nMaximum number of transactions have been reached.");										// 1000 transactions already.	Disables option 1.
							System.out.println("Please exit the program to end the day.\n");
							inputOption = 0;
						}
					}
			
					else if (inputOption == 2)
					{
						System.out.println("\nSelecting: 2");
						System.out.println("Displaying entire day's transactions:");
						
						if (transactionsStartWhenNotEqual1 == 1)
							System.out.println( " \n" + noTransactionsYet);																	// Shows a 'no transaction' message if no players added yet.
						else
							System.out.println(mainDayTransaction);
						System.out.println("\n");
						inputOption = 0;
					}
			
					else if ( inputOption == 3)
					{
						System.out.println("\nSelecting: 3");
						System.out.println("Beginning the ride.");																			// Resets the total players per round.
						System.out.println("...");
						System.out.println("Ride has ended.");
						System.out.println(transactionDisplayPerRound);
						transactionDisplayPerRound="";
						numOfPlayers = 0;
						inputOption = 0;
					}
				}
			
			
				if (numOfPlayers > 0)
				{
					while (inputOption == -99)
					{
						System.out.println("\nCannot exit program until service is provided to paid players.\n");							// Disables option(-99) until no more players.
						inputOption = 0;
					}
				}
				else if (numOfPlayers == 0)
				{
					while (inputOption == -99)
					{
						System.out.println("\nQuitting the System.");
						System.out.println("Displaying the entire day's transaction before Quitting:");
					
						if (transactionsStartWhenNotEqual1 == 1)
							System.out.println(noTransactionsYet);
						else
							System.out.println(mainDayTransaction);
					
						System.out.println("\nSystem Shut Down...");
						inputOption++;
					}
				}
		}
		
		catch(Exception ex)
		{
			System.out.println("\nInvalid input.");
			System.out.println("Please try again.\n");
			inputOption = 0;
		}
			}
		while (inputOption == 0);
	}
	
																																																													/**
	 ________________________________________________
	|                        						 |
	|   1.1     The display:  Displays the options   |
	|________________________________________________|
																																																													 **/
	public static void displayOption() 
	{
		System.out.println("Options:");
		System.out.println("1. Add ride players");
		System.out.println("2. Display entire day's transactions");
		System.out.println("3. Begin the ride");
		System.out.print("Please key in option: ");
	}
	
																																																													/**
	 ________________________________________________________
	|														 |
	|   1.2     The display:  User inputs: 1, 2, 3 or -99.   |
	|________________________________________________________|	
																																																													 **/
	public static int option(int option)
	{
		Scanner sc = new Scanner (System.in);
		option = sc.nextInt();
		
		while ( (option <1 && option > -99) || (option < -99) || (option > 3))
		{	
			System.out.println("\nInvalid option.");
			System.out.println("Please rekey input again.\n");
			
			displayOption();
			option = sc.nextInt();	
		}
		
		return option;	
	}
	
																																																													/**
	 _______________________________________________________________________________________________________________________________
	|														                               											|
	|   2     Adding players:  The interface / The player's particulars / The total players /   									|       
	|                          The price     / The discounted price 	/ The payment   	/   									|
	| 						   The adding of transactions                                   									    |
	|						   ( The list briefly describes the process within "Adding players" accordingly step by step,       )   |      
	| 						   ( and briefly explains the functions of the list of variables listed below step by step as well. )   |	
	|																															    |
	| 						   Returns value of transactions and number of players       										    |
	|_______________________________________________________________________________________________________________________________|
																																																													 **/
	public static String addingRidePlayersInterface()
	{
		Scanner sc = new Scanner (System.in);
		
		String playerName;						int playerAge 			= 0;
		String playerAdultName = "";			int playerAdultAge		= 0;
				
		int numOfChild			= 0;			int numOfAdult 			= 0;
		int numOfChildSingle 	= 0;
		
		int numOfPlayersBelow6 	= 0;			int numOfPlayers6To12 	= 0;
		int numOfPlayers13To16 	= 0;			int numOfPlayers17To65 	= 0;
		int numOfPlayersAbove65 = 0;
		
		double priceBelow6 		= 5.00;			double price6To12		= 8.00;
		double price13To16		= 10.00;		double price17To65		= 15.00;
		double priceAbove65		= 2.00;
		
		int totalNumOfPlayers 	= 0;			double totalPrice		= 0;
		int redo = 1;																														// 'redo' is used a lot for redoing certain actions.
		
		String discountsAvailable = "";				String sumString;
		int num1 = 0;							int discount1 = 0;
		int num2 = -1;							int discount2 = 0;
		int num3 = -2;							int discount3 = 0;
		int num4 = -3;							int discount4 = 0;		
		int count = 0;
		
		double pOSBDiscountRate		  = 0.10;	double oCBCDiscountRate 	 = 0.05;
		double nYPStudentDiscountRate = 0.20;	double safraCardDiscountRate = 0.10;
		double gSTRate = 0.07;
		
		String feeDeclarationSentence;		
		
		double amountReceived;					double amountLeftToPay;
		double totalAmountReceived;				int action = 1;
		
		int twoPlayers = 0;						String addOn = "~";
		int numOfPaymentMade = 0;               String dayTransaction = "";
				
		
		do
		{
			do
			{
				do
				{
					redo = 0;
					numOfPlayersBelow6 	= 0;			numOfPlayers6To12 	= 0;
					numOfPlayers13To16 	= 0;			numOfPlayers17To65 	= 0;
					numOfPlayersAbove65 = 0;
						
					numOfChild			= 0;		    numOfAdult 			= 0;
					numOfChildSingle 	= 0;
					
						
					playerName = addingFirstPlayerName(null);
					if ( playerName.equals("-99") )
					{
						System.out.println("Returning to main menu.\n");
						dayTransaction = " ";
						return dayTransaction;
					}
					
					try
					{
						playerAge = addingFirstPlayerAge(playerAge);
					
						if (playerAge == -99)
						{
							System.out.println("Returning to main menu.\n");
							dayTransaction = " ";
							return dayTransaction;
						}
						else if (playerAge < 3 || playerAge > 80)
						{
							++redo;
							if (playerAge <= 0)
								System.out.println("Invalid age.");
							else if (playerAge < 3)
								System.out.println("Player is too young.");
							else if (playerAge > 80)								
								System.out.println("Player is too old.");
								
							System.out.println("Repeting Process...\n");
						}						
						else if (playerAge >= 3 && playerAge <=5)
						{							
							++numOfChild;
							++numOfPlayersBelow6;
								
							System.out.println("An accompanying adult is required.\n");
							do
							{
								redo = 0;
								playerAdultName = addingSecondPlayerName(null);
								if ( playerAdultName.equals("-99") )
								{
									--numOfChild;
									--numOfPlayersBelow6;
									++redo;
									playerAdultName = "";
									
									System.out.println("Returning to the start.");
									System.out.println("Repeating Process...\n");
									playerAdultAge = 0;
									continue;
								}
								
								try
								{
									playerAdultAge = addingSecondPlayerAge(playerAdultAge);
									if ( (playerAdultAge < 16 || playerAdultAge > 80) && playerAdultAge != -99)
									{
										++redo;
										++redo;
								
										if (playerAdultAge <= 0)
											System.out.println("Invalid age.");
										else if (playerAdultAge < 3)
											System.out.println("Player is too young.");
										else if (playerAdultAge < 16)
											System.out.println("Player is too young to accompany the child.");
										else if (playerAdultAge > 80)
											System.out.println("Player is too old.");
						
										System.out.println("Repeating Process of adding accompanying adult...\n");
									}
								}
								catch (Exception ex)
								{
									++redo;
									++redo;
									System.out.println("Invalid age.");
									System.out.println("Repeating Process of adding accompanying adult...\n");
								}
							}
							while (redo == 2);
									
							if (playerAdultAge == -99)
							{
								--numOfChild;
								--numOfPlayersBelow6;
								++redo;
								playerAdultName = "";
								
								System.out.println("Returning to the start.");
								System.out.println("Repeating Process...\n");
								continue;
							}
							if (playerAdultAge >= 16 && playerAdultAge <= 80)
							{
							    if (playerAdultAge == 16)
								{
									++numOfAdult;
									++numOfPlayers13To16;
								}
								else if (playerAdultAge >= 17 && playerAdultAge <= 65)
								{
									++numOfAdult;
									++numOfPlayers17To65;
								}
								else if (playerAdultAge > 65)
								{
									++numOfAdult;
									++numOfPlayersAbove65;
								}
								System.out.println("Confirming players...");
							}
						}
						else if (playerAge >=6 && playerAge <=12)
						{
							++numOfChildSingle;
							++numOfPlayers6To12;
							System.out.println("Confirming player...");
						}
						else if (playerAge >=13 && playerAge <=16)
						{
							if (playerAge < 16)
							{
								++numOfChildSingle;
							}
							else
							{
								++numOfAdult;
							}
							++numOfPlayers13To16;
							System.out.println("Confirming player...");
						}
						else if (playerAge >=17 && playerAge <=65)
						{
							++numOfAdult;
							++numOfPlayers17To65;
							System.out.println("Confirming player...");
						}
						else if (playerAge > 65)
						{
							++numOfAdult;
							++numOfPlayersAbove65;
							System.out.println("Confirming player...");
						}
					}
					catch (Exception ex)
					{
						++redo;
						System.out.println("Invalid age.");
						System.out.println("Repeating Process...\n");
					}
				}
				while (redo == 1);
							
				totalNumOfPlayers = numOfChild + numOfAdult + numOfChildSingle;
						
				System.out.println("Proceeding to the price of tickets.");																	// This section contains the discounts available and the input.
						
				totalPrice 	= (numOfPlayersBelow6*priceBelow6) + (numOfPlayers6To12*price6To12)
							+ (numOfPlayers13To16*price13To16) + (numOfPlayers17To65*price17To65)
					  		+ (numOfPlayersAbove65*priceAbove65); 
									
				do
				{
					redo = 0;
				    num1 = 0;						discount1 = 0;
					num2 = -1;						discount2 = 0;
					num3 = -2;						discount3 = 0;
					num4 = -3;						discount4 = 0;
							
					discountDisplay();
					try
					{
						discountsAvailable = discountsAvailable(null);
						count = discountsAvailable.length();																				// I made it flexible for any numbers ( 0 to 4 ) to input the options.
						
						int i = count;
						if ( discountsAvailable.equals("-99") )
						{
							++redo;
							++redo;
							playerAdultName = "";
							
							System.out.println("Canceling ticket Processing...");
							System.out.println("Returning to the Start.");
							System.out.println("Repeating Process...");
							System.out.println("\nAdding players.");
							continue;
						}
						else
						{
											
							if (i<5)
							{
								switch (i)
								{
									case 4:		sumString = discountsAvailable.substring(3,4);
												num4 = Integer.parseInt(sumString);
								
									case 3: 	sumString = discountsAvailable.substring(2,3);
												num3 = Integer.parseInt(sumString);
						
									case 2: 	sumString = discountsAvailable.substring(1,2);
												num2 = Integer.parseInt(sumString);
								
									case 1:		sumString = discountsAvailable.substring(0,1);
												num1 = Integer.parseInt(sumString);
										
									case 0:
								}
										
								if (num1 != num2 && num1 != num3 && num1 != num4 && num2 != num3 && num2 != num4 && num3 != num4)
								{	
									switch (num1)
									{
										case 0:		
										break;
												
										case 1:     ++discount1;
										break;
												
										case 2:		++discount2;
										break;
												
										case 3:		++discount3;
										break;
											
										case 4:		++discount4;
										break;
												
										default:    ++redo;
													System.out.println("Invalid Input.");
													System.out.println("Try again.");
									}
										
									if (redo == 1)
										continue;
										
									switch (num2)
									{
										case -1:		
										break;
												
										case 1:     ++discount1;
										break;
											
										case 2:		++discount2;
										break;
												
										case 3:		++discount3;
										break;
											
										case 4:		++discount4;
										break;
											
										default:    ++redo;
													System.out.println("Invalid Input.");
													System.out.println("Try again.");
									}
										
									if (redo == 1)
										continue;
										
									switch (num3)
									{
										case -2:		
										break;
												
										case 1:     ++discount1;
										break;
												
										case 2:		++discount2;
										break;
												
										case 3:		++discount3;
										break;
												
										case 4:		++discount4;
										break;
												
										default:    ++redo;
													System.out.println("Invalid Input.");
													System.out.println("Try again.");
									}
										
									if (redo == 1)
										continue;
										
									switch (num4)
									{
						
										case -3:		
										break;
												
										case 1:     ++discount1;
										break;
												
										case 2:		++discount2;
										break;
												
										case 3:		++discount3;
										break;
												
										case 4:		++discount4;
										break;
												
										default:    ++redo;
														System.out.println("Invalid Input.");
														System.out.println("Try again.");
									}
								}
								else
								{
									++redo;
									System.out.println("Invalid Input.");
									System.out.println("Try again.");
								}
							}
							else
							{
								++redo;
								System.out.println("Invalid Input.");
								System.out.println("Try again.");
							}
						}
					}
					catch (Exception ex)
					{
						++redo;
						System.out.println("Invalid Input.");
						System.out.println("Try again.");
					}
				}
				while (redo == 1);	
			}
			while (redo == 2);
			if (discount1 == 1 && discount2 == 1)
				--discount2;
						
			totalPrice = totalPrice-(discount1*totalPrice*pOSBDiscountRate);
			totalPrice = totalPrice-(discount2*totalPrice*oCBCDiscountRate);
			totalPrice = totalPrice-(discount3*totalPrice*nYPStudentDiscountRate);
			totalPrice = totalPrice-(discount4*totalPrice*safraCardDiscountRate);
						
			totalPrice = totalPrice+(totalPrice*gSTRate);
					
			if (playerAdultName.length() > 0)																								// Detects if there is 1 or 2 players and continues correspondingly.
			{	
				totalPrice = Math.round(totalPrice*100.0)/100.0;
				feeDeclarationSentence = "\n" + playerName + "'s and " + playerAdultName + "'s fee for tickets are $" + totalPrice;
				System.out.printf(feeDeclarationSentence);
				System.out.println(".\n");	
			}
			else
			{
				totalPrice = Math.round(totalPrice*100.0)/100.0;
				feeDeclarationSentence = "\n" + playerName + "'s fee for a ticket is $" + totalPrice; 
				System.out.printf(feeDeclarationSentence);
				System.out.println(".\n");
			}
						
			System.out.println("Proceeding to payment...");
				
			amountReceived = 0;
			totalAmountReceived = amountReceived;
			amountLeftToPay = totalPrice - amountReceived;
			
			do
			{
				redo = 0;
				try
				{
					Scanner sc2 = new Scanner(System.in);
					System.out.print("Please key in amount received: $");
					amountReceived = sc2.nextDouble();
				}
				catch (Exception ex)
				{
					++redo;
					System.out.println("Invalid input.");
					System.out.println("Please try again.\n");
				}
			}
			while (redo == 1);
					
					if (amountReceived >= 0)
						amountLeftToPay = totalPrice - amountReceived;
					
					do
					{
						redo = 0;
						if (amountReceived == -99)
						{
							++redo;
							++redo;
				
							playerAdultName = "";
									
							numOfChild			= 0;			numOfAdult 			= 0;
							numOfChildSingle 	= 0;
							
							numOfPlayersBelow6 	= 0;			numOfPlayers6To12 	= 0;
							numOfPlayers13To16 	= 0;			numOfPlayers17To65 	= 0;
							numOfPlayersAbove65 = 0;
										
							totalNumOfPlayers 	= 0;			totalPrice		= 0;					
									
							
							System.out.println("Cancelling the payment of tickets.");														// I added a feature to pay back the money if the player changers his/her mind.
							System.out.println("Processing...");
							System.out.printf("Returning $%.2f", totalAmountReceived);
							System.out.println(" to player.");
							System.out.println("Returning to adding of first player.\n");
							continue;
						}
						else if (amountReceived < 0)
						{
							++redo;
							System.out.println("Invalid number.");
							System.out.println("Please try again.\n");
							System.out.printf("Amount left to pay: $%.2f", amountLeftToPay);
							
							try
							{
								Scanner sc2 = new Scanner(System.in);
								System.out.print("\nPlease key in amount received: $");
								amountReceived = sc2.nextDouble();
								
								if (amountReceived > 0 && action == 1)
								{
									amountLeftToPay = totalPrice - amountReceived;
									++action;
								}
								else if (amountReceived > 0)
								{
									amountLeftToPay = amountLeftToPay - amountReceived;
								}
								else;
							}
							catch (Exception ex)
							{
								System.out.println("Invalid input.");
								System.out.println("Try again.\n");
								amountReceived = 0;
							}
						}
						else if (amountReceived >= 0)
						{				
							if (amountLeftToPay > 0)
							{
								++action;
								++redo;
								totalAmountReceived += amountReceived;
								System.out.printf("Amount left to pay: $%.2f", amountLeftToPay);
										
								try
								{
									Scanner sc2 = new Scanner (System.in);
									System.out.print("\nPlease key in amount received: $");
									amountReceived = sc2.nextDouble();
										
									if (amountReceived >= 0)
										amountLeftToPay = amountLeftToPay - amountReceived;	
								}
								catch (Exception ex)
								{
									System.out.println("Invalid input.");
									System.out.println("Try again.\n");
								}
								
							}
									
							else if (amountLeftToPay <0)																					// I added a feature to show the change if there is any.
							{
								amountLeftToPay = 0 - amountLeftToPay;
								System.out.printf("Over-paid the fee by: $%.2f", amountLeftToPay);
								System.out.printf("\nReturning $%.2f", amountLeftToPay);
								amountLeftToPay = 0.00;
							}	
						}
					}
					while (redo == 1);
		}
		while (redo == 2);
				
			
		numOfPaymentMade = totalNumOfPlayers;
		if (numOfPaymentMade == 1)
			System.out.println("\nPayment has been made.");
		if (numOfPaymentMade > 1)
		{
			System.out.println("\n" + numOfPaymentMade + " payments have been made.");
			++twoPlayers;
		}
				
		if (twoPlayers == 1)
		{
			dayTransaction = dayTransaction + feeDeclarationSentence                     
			               + "\n" + "Number of players was " + totalNumOfPlayers + "." 
	                       + " \n"+ addOn;
		}
		else
		{
			dayTransaction = dayTransaction + feeDeclarationSentence                   
			               + "\n" + "Number of players was " + totalNumOfPlayers + "." 
	                       + " \n-";
		}
		System.out.println("Returning to main menu\n");
		
		return dayTransaction;
	}
	
																																																													/**
	 _____________________________________________________________
	|                                                             |
	|   2.1     Adding players:  Adding the first player's name   |
	|_____________________________________________________________|																										
																										 																																			**/
	public static String addingFirstPlayerName(String playerName)
	{
		Scanner sc = new Scanner (System.in);
		String replaceForUpperCase;	
		
		System.out.print("Please key in name: ");
		playerName = sc.nextLine();							
		replaceForUpperCase = playerName.substring(0,1);
		replaceForUpperCase = replaceForUpperCase.toUpperCase();
		playerName = playerName.substring(1);
		playerName = playerName.toLowerCase();
		playerName = playerName.replace(" ", "_");
		playerName = replaceForUpperCase + playerName;
		
		return playerName;
		
	}
	
																																																													/**
	 ____________________________________________________________
	|  															 |
	|   2.2     Adding players:  Adding the first player's age   |
	|____________________________________________________________|
	 																																																												**/
	public static int addingFirstPlayerAge(int playerAge)
	{
		Scanner sc = new Scanner (System.in);
		
		System.out.print("Please key in age: ");
		playerAge = sc.nextInt();
		
		return playerAge;		
	}
	
																																																													/**
	 _______________________________________________________________________
	|														           	    |
	|   2.3     Adding players(Optional):  Adding the adult player's name   |															 
	|_______________________________________________________________________|
	 																																																												**/
	public static String addingSecondPlayerName(String playerAdultName)
	{
		Scanner sc = new Scanner (System.in);
		String replaceForUpperCase;	
		
		System.out.print("Please key in name of adult: ");
		playerAdultName = sc.nextLine();	
		replaceForUpperCase = playerAdultName.substring(0,1);
		replaceForUpperCase = replaceForUpperCase.toUpperCase();
		playerAdultName = playerAdultName.substring(1);
		playerAdultName = playerAdultName.toLowerCase();
		playerAdultName = playerAdultName.replace(" ", "_");
		playerAdultName = replaceForUpperCase + playerAdultName;
		
		return playerAdultName;	
	}
	
																																																													/**
	 ______________________________________________________________________
	|																	   |
	|   2.4     Adding players(Optional):  Adding the adult player's age   |
	|______________________________________________________________________|
																										 																																			**/
	public static int addingSecondPlayerAge(int playerAdultAge)
	{
		Scanner sc = new Scanner (System.in);
		
		System.out.print("Please key in age of adult: ");
		playerAdultAge = sc.nextInt();
		
		return playerAdultAge;
	}
	
																																																													/**
	 ________________________________________________
	|                                                |
	|   2.5     Adding players:  Displays discounts  |
	|________________________________________________|
	 																																																												**/
	public static void discountDisplay()
	{
		System.out.println("\nPlease check for the following applicable discounts.");
		System.out.println("All applicable discounts will be stacked compoundedly.");
		System.out.println("Key in only \"0\" or press enter if there is no applicable discounts.");
		System.out.println("If both a POSB and OCBC card is applicable, only POSB will be considered.");
		System.out.println("1. POSB Card 		 10% discount");
		System.out.println("2. OCBC Card 		 5%  discount");
		System.out.println("3. NYP Student 		 20% discount");
		System.out.println("4. Safra Card   	 10% discount");
		System.out.println("(E.g: 1 2 4 , 4 3 , 3 1 , 0)");
		System.out.println("Do not repeat numbers.");
		
		return;
	}
	
	
																																																													/**
	 ________________________________________________________
	|  														 |
	|   2.6     Adding players: Discounts applicable input   |
	|________________________________________________________|																	
																										 																																			**/
	public static String discountsAvailable(String discountsAvailable)
	{
		Scanner sc = new Scanner (System.in);
		
		System.out.print("Please key in options applicable: ");
		discountsAvailable = sc.nextLine();
		
		discountsAvailable = discountsAvailable.replace(" ","");
		
		return discountsAvailable;
		
	}


		

	

																																																													/**
     ____________________________________________________________________________________________
	|														                               	 	 |
	|   2-2     Adding players: (For when the current players added is already 4 players    	 |
	| 							 and a child + accompanying adult is not allowed)           	 |
	| 							  																 |
	| 							The interface / The player's particulars / The total players /   |       
	|                           The price     / The discounted price 	 / The payment   	 /   |
	| 			  			    The adding of transactions                                  	 |
	|																							 |
	| 						    Returns value of transactions and number of players         	 |
	|____________________________________________________________________________________________|
																																										 																			**/
	public static String addingRidePlayersInterfaceVer2()
	{
		Scanner sc = new Scanner (System.in);

		String playerName;						int playerAge 			= 0;			

		int numOfAdult 			= 0;     		int numOfChildSingle 	= 0;

		int numOfPlayers6To12 	= 0;    		int numOfPlayers13To16 	= 0;	
		int numOfPlayers17To65 	= 0;    		int numOfPlayersAbove65 = 0;

		double price6To12		= 8.00;			double price13To16		= 10.00;	
		double price17To65		= 15.00;		double priceAbove65		= 2.00;

		int totalNumOfPlayers 	= 0;			double totalPrice		= 0;	
		int redo 				= 1;						

		
		String discountsAvailable;				String sumString;
		int num1 = 0;							int discount1 = 0;
		int num2 = -1;							int discount2 = 0;
		int num3 = -2;							int discount3 = 0;
		int num4 = -3;							int discount4 = 0;
		int count = 0;

		double pOSBDiscountRate		  = 0.10;	double oCBCDiscountRate 	 = 0.05;
		double nYPStudentDiscountRate = 0.20;	double safraCardDiscountRate = 0.10;
		double gSTRate = 0.07;
	
		String feeDeclarationSentence;		
	
		double amountReceived;					double amountLeftToPay;
		double totalAmountReceived;				int action = 1;
	
		String dayTransaction = "";
	
		do
		{
			do
			{
				do
				{
					redo = 0;
						
					numOfPlayers6To12 	= 0;
					numOfPlayers13To16 	= 0;			numOfPlayers17To65 	= 0;
					numOfPlayersAbove65 = 0;
		
				    numOfAdult 			= 0;			numOfChildSingle 	= 0;
		
		
					playerName = addingFirstPlayerName(null);
					if ( playerName.equals("-99") )
					{
						System.out.println("Returning to main menu.\n");
						dayTransaction = " ";
						return dayTransaction;
					}
		
					try
					{
						playerAge = addingFirstPlayerAge(playerAge);
						if (playerAge == -99)
						{
							System.out.println("Returning to main menu.\n");
							return dayTransaction;
						}
						else if (playerAge < 3 || playerAge > 80)
						{
							++redo;
							if (playerAge <= 0)
								System.out.println("Invalid age.");
							else if (playerAge < 3)
								System.out.println("Player is too young.");
							else if (playerAge > 80)								
								System.out.println("Player is too old.");
			
							System.out.println("Repeating Process...\n");
						}						
						else if (playerAge >= 3 && playerAge <=5)																			// Completely ignore child + adult since only can add 1 more player.
						{							
							System.out.println("An accompanying adult is required.");
							System.out.println("However, only 1 more player is allowed into the ride.");
							System.out.println("Processing Data...");
							System.out.println("\nPlease ask the child to come back again later with an adult.");
							System.out.println("Cancelling the adding of a young child...");
							System.out.println("Returning to adding of player...\n");
								
							++redo;
						}
						else if (playerAge >=6 && playerAge <=12)
						{
							++numOfChildSingle;
							++numOfPlayers6To12;
							System.out.println("Confirming player...");
						}
						else if (playerAge >=13 && playerAge <=16)
						{
							if (playerAge < 16)
							{
								++numOfChildSingle;
							}
							else
							{
								++numOfAdult;
							}
							++numOfPlayers13To16;
							System.out.println("Confirming player...");
						}
						else if (playerAge >=17 && playerAge <=65)
						{
							++numOfAdult;
							++numOfPlayers17To65;
							System.out.println("Confirming player...");
						}
						else if (playerAge > 65)
						{
							++numOfAdult;
							++numOfPlayersAbove65;
							System.out.println("Confirming player...");
						}
					}
					catch (Exception ex)
					{
						++redo;
						System.out.println("Invalid age.");
						System.out.println("Repeting Process...\n");
					}
				}
				while (redo == 1);
	
				totalNumOfPlayers = numOfAdult + numOfChildSingle;
		
				System.out.println("Proceeding to the price of tickets.");																	// This section contains the discounts available and the input.
		
				totalPrice 	= (numOfPlayers6To12*price6To12) + (numOfPlayers13To16*price13To16) 
						    + (numOfPlayers17To65*price17To65)
						    + (numOfPlayersAbove65*priceAbove65); 
	
				do
				{
					redo = 0;
					num1 = 0;						discount1 = 0;
					num2 = -1;						discount2 = 0;
					num3 = -2;						discount3 = 0;
					num4 = -3;						discount4 = 0;
		
					discountDisplay();
					try
					{
						discountsAvailable = discountsAvailable(null);
						count = discountsAvailable.length();
			
						int i = count;
						if ( discountsAvailable.equals("-99") )
						{
							++redo;
							++redo;
							System.out.println("Canceling ticket Processing...");
							System.out.println("Returning to the Start.");
							System.out.println("Repeating Process...");
							System.out.println("\nAdding players.");
							continue;
						}
						else
						{
			
							if (i<5)
							{
								switch (i)
								{
									case 4:		sumString = discountsAvailable.substring(3,4);
												num4 = Integer.parseInt(sumString);
			
									case 3: 	sumString = discountsAvailable.substring(2,3);
												num3 = Integer.parseInt(sumString);
			
									case 2: 	sumString = discountsAvailable.substring(1,2);
												num2 = Integer.parseInt(sumString);
			
									case 1:		sumString = discountsAvailable.substring(0,1);
												num1 = Integer.parseInt(sumString);
			
									case 0:
								}
			
								if (num1 != num2 && num1 != num3 && num1 != num4 && num2 != num3 && num2 != num4 && num3 != num4)
								{	
									switch (num1)
									{
										case 0:		
										break;
			
										case 1:     ++discount1;
										break;
			
										case 2:		++discount2;
										break;
			
										case 3:		++discount3;
										break;
			
										case 4:		++discount4;
										break;
			
										default:    ++redo;
										System.out.println("Invalid Input.");
										System.out.println("Try again.");
									}
			
									if (redo == 1)
										continue;
			
									switch (num2)
									{
										case -1:		
										break;
			
										case 1:     ++discount1;
										break;
			
										case 2:		++discount2;
										break;
			
										case 3:		++discount3;
										break;
			
										case 4:		++discount4;
										break;
			
										default:    ++redo;
													System.out.println("Invalid Input.");
													System.out.println("Try again.");
									}
			
									if (redo == 1)
										continue;
		
									switch (num3)
									{
										case -2:		
										break;
			
										case 1:     ++discount1;
										break;
			
										case 2:		++discount2;
										break;
			
										case 3:		++discount3;
										break;
		
										case 4:		++discount4;
										break;
			
										default:    ++redo;
										System.out.println("Invalid Input.");
										System.out.println("Try again.");
									}
			
									if (redo == 1)
										continue;
			
									switch (num4)
									{
			
										case -3:		
										break;
			
										case 1:     ++discount1;
										break;
			
										case 2:		++discount2;
										break;
			
										case 3:		++discount3;
										break;
			
										case 4:		++discount4;
										break;
			
										default:    ++redo;
										System.out.println("Invalid Input.");
										System.out.println("Try again.");
									}
								}
								else
								{
									++redo;
									System.out.println("Invalid Input.");
									System.out.println("Try again.");
								}
							}
							else
							{
								++redo;
								System.out.println("Invalid Input.");
								System.out.println("Try again.");
							}
						}
					}
					catch (Exception ex)
					{
						++redo;
						System.out.println("Invalid Input.");
						System.out.println("Try again.");
					}
				}
				while (redo == 1);	
			}
			while (redo == 2);
			if (discount1 == 1 && discount2 == 1)
				--discount2;
		
			totalPrice = totalPrice-(discount1*totalPrice*pOSBDiscountRate);
			totalPrice = totalPrice-(discount2*totalPrice*oCBCDiscountRate);
			totalPrice = totalPrice-(discount3*totalPrice*nYPStudentDiscountRate);
			totalPrice = totalPrice-(discount4*totalPrice*safraCardDiscountRate);
		
			totalPrice = totalPrice+(totalPrice*gSTRate);
		
				
			totalPrice = Math.round(totalPrice*100.0)/100.0;
			feeDeclarationSentence = "\n" + playerName + "'s fee for a ticket is $" + totalPrice; 
			System.out.printf(feeDeclarationSentence);
			System.out.println(".\n");
				
		
			System.out.println("Proceeding to payment...");
		
			amountReceived = 0;
			totalAmountReceived = amountReceived;
			amountLeftToPay = totalPrice - amountReceived;
			
			do
			{
				redo = 0;
				try
				{
					Scanner sc2 = new Scanner(System.in);
					System.out.print("Please key in amount received: $");
					amountReceived = sc2.nextDouble();
				}
				catch (Exception ex)
				{
					++redo;
					System.out.println("Invalid input.");
					System.out.println("Please try again.\n");
				}
			}
			while ( redo == 1 );
			
			if (amountReceived >= 0)
				amountLeftToPay = totalPrice - amountReceived;
			
			do
			{
				redo = 0;
				if (amountReceived == -99)
				{
					++redo;
					++redo;
		
					numOfChildSingle 	= 0;			numOfAdult 			= 0;
					
					numOfPlayers6To12 	= 0;			numOfPlayers13To16 	= 0;	
					numOfPlayers17To65 	= 0;			numOfPlayersAbove65 = 0;
								
					totalNumOfPlayers 	= 0;			totalPrice		= 0;					
							
					
					System.out.println("Cancelling the payment of tickets.");																// I added a feature to pay back the player if he/she changes her mind.
					System.out.println("Processing...");
					System.out.printf("Returning $%.2f", totalAmountReceived);
					System.out.println(" to player.");
					System.out.println("Returning to adding of first player.\n");
					continue;
				}
				else if (amountReceived < 0)
				{
					++redo;
					System.out.println("Invalid number.");
					System.out.println("Please try again.\n");
					System.out.printf("Amount left to pay: $%.2f", amountLeftToPay);
					
					try
					{
						Scanner sc2 = new Scanner (System.in);
						System.out.print("\nPlease key in amount received: $");
						amountReceived = sc2.nextDouble();
						
						if (amountReceived > 0 && action == 1)
						{
							amountLeftToPay = totalPrice - amountReceived;
							++action;
						}
						else if (amountReceived > 0)
						{
							amountLeftToPay = amountLeftToPay - amountReceived;
						}
						else;
					}
					catch (Exception ex)
					{
						System.out.println("Invalid input.");
						System.out.println("Try again.\n");
						amountReceived = 0;
					}
				}
				else if (amountReceived >= 0)
				{				
					if (amountLeftToPay > 0)
					{
						++action;
						++redo;
						totalAmountReceived += amountReceived;
						System.out.printf("Amount left to pay: $%.2f", amountLeftToPay);
								
						try
						{
							Scanner sc2 = new Scanner (System.in);
							System.out.print("\nPlease key in amount received: $");
							amountReceived = sc2.nextDouble();
								
							if (amountReceived >= 0)
								amountLeftToPay = amountLeftToPay - amountReceived;	
						}
						catch (Exception ex)
						{
							System.out.println("Invalid input.");
							System.out.println("Try again.\n");
						}
					}
							
					else if (amountLeftToPay <0)
					{
						amountLeftToPay = 0 - amountLeftToPay;
						System.out.printf("Over-paid the fee by: $%.2f", amountLeftToPay);													// I added a feature to show the change if there is any.
						System.out.printf("\nReturning $%.2f", amountLeftToPay);
						amountLeftToPay = 0.00;
					}	
				}
			}
			while (redo == 1);
		}
		while (redo == 2);
	

		System.out.println("\nPayment has been made.");
		dayTransaction = dayTransaction + feeDeclarationSentence                   
					   + "\n" + "Number of players was " + (totalNumOfPlayers) + "." 
					   + " \n-";
			
		System.out.println("Returning to main menu\n");
			
		return dayTransaction;
	}
	
	
}
	
