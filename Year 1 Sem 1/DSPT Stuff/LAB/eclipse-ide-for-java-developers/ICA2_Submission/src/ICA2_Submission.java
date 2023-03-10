import java.util.Scanner;
public class ICA2_Submission {
			  /***************************************************************************************|
		     /	Name:							Tan Wei Jun, Terris									  |
		    /	Admin Number: 					172737L												  |
	  	   /	Course name:					IT1506 - Data Structure & Programming Techniques	  |
	  	  /		Date started:					9/6/2017   -  4.53pm								  |
	     /		Date completed:					29/6/2017  -  2.21pm   								  |	      
	    /																							  |
	   / 		Date since last modification:	28/7/2017  -  10.22am								  |
	  /_______________________________________________________________________________________________|
	
	
	 _______________________________________________________________________________________________________________________________________________________
	|					                                                     |													   				            |
	|   1      The Main Program:  System to track all payment transactions   |        Calleees: (1.1) 	displayOption()							            |
	| 							  and begin the ride for FunIT theme park  	 |					(1.2) 	getOption()								            |
	|																		 |					(2)		addingRidePlayersInterface(int numOfPlayers)        |
	|																		 |______________________________________________________________________________|
	|							  Option   1: Add players					 |
	|							  Option   2: View entire day transaction	 |
	|							  Option   3: Begin ride					 |
	|							  Option -99: Quit the program				 |
	|________________________________________________________________________|
			 																																																								**/
	public static void main (String[] args)
	{
		int inputOption;
		int numOfPlayers = 0;
		
		
		
		String [] dayTransactions = new String [1000];											
		for (int y = 0; y<dayTransactions.length; y++)																					// Sets all array values of dayTrasactions to literally nothing.
		{
			dayTransactions[y] = "";												// "null" will affect my display of dayTransactions[] .
		}
		
		
		String [] transactionDisplayPerRound = new String [5];
		int personalCounterForTransactionDisplayPerRound = 0;																	
		
		
		String dayTransactionCollector = "";
		String noTransactionsYet = "No transactions has occurred yet.\nOr service not yet provided.";
		String singleOrDoublePlayers;															
		
		
		
		int lengthOfString;
		int numOfTransactions = 0;													// One Transaction is all payment for one round.   Also used for dayTransactions[].
		int transactionsStartWhenNotEqual1 = 1;
		
		
		
		
		do
		{
			try
			{
				displayOption();
				inputOption = getOption();
			
				while (inputOption >=1 && inputOption <= 3)
				{			
/*Option: 1*/		if ( inputOption == 1)
					{
						if (numOfTransactions < 1000)
						{
							if (numOfPlayers < 5)								
							{
								System.out.println("\nSelecting: 1");
								System.out.println("Adding ride players.");
								if (numOfPlayers <4) 
								{
									dayTransactionCollector = addingRidePlayersInterface(numOfPlayers);
									dayTransactions[numOfTransactions] += dayTransactionCollector + "\n";
									transactionDisplayPerRound[personalCounterForTransactionDisplayPerRound] = dayTransactionCollector;
									
									System.out.println("Do not re-enter option 1 when there is 5 players, until ride has begin.");
									
									lengthOfString = dayTransactionCollector.length();
									
									if ( lengthOfString == 1 ) 
									{
																// Nothing happends.    -Payment not made.
									}
									
									else						// Payment made.  Fills in 1 or 2 players.
									{
										++numOfPlayers;																			
										++personalCounterForTransactionDisplayPerRound;
										lengthOfString = dayTransactionCollector.length();
										singleOrDoublePlayers = dayTransactionCollector.substring(lengthOfString-1,lengthOfString);    // 1 player is added.
							
										if (singleOrDoublePlayers.equals("~"))														   // Another 1 player is added.
										++numOfPlayers;			
									}
								}
								
								
								
								else if (numOfPlayers == 4)		// Payment made.	 Fills only 1 player.
								{
									dayTransactionCollector = addingRidePlayersInterface(numOfPlayers);
									dayTransactions[numOfTransactions] += dayTransactionCollector + "\n";
									transactionDisplayPerRound[personalCounterForTransactionDisplayPerRound] = dayTransactionCollector;
									
									System.out.println("Do not re-enter option 1 when there is 5 players, until ride has begin.");			
									
									lengthOfString = dayTransactionCollector.length();
									
									if ( lengthOfString == 1 ) 
									{
																//Nothing happends.    -Payment not made.
									}
									
									else						// Payment made.  Fills in only 1 player.
									{
										++numOfPlayers;
										++personalCounterForTransactionDisplayPerRound;
									}
								}
							}
							
							else
							{
								System.out.println("\nMaximum number of players have been reached.");										// 5 Players already.   Disables option 1.
								System.out.println("Begin ride to reset number of players.");
							}
						}
						else 
						{
							System.out.println("\nMaximum number of transactions have been reached.");										// 1000 transactions already.	Disables option 1.
							System.out.println("Unable to play option 1.");
							System.out.println("Please exit the program to end the day.\n");
						}
						
						inputOption = 0;
					}
			
/*Option: 2*/		else if (inputOption == 2)
					{
						System.out.println("\nSelecting: 2");
						System.out.println("Displaying entire day's transactions:\n");
						
						if (transactionsStartWhenNotEqual1 == 1)									// Shows a 'no transaction' message if no players added yet.
							System.out.println(noTransactionsYet);																	
						else																		// Displays all transactions.
						{																			// Each transaction contains:  Name of players
							for (int y = 0; y<numOfTransactions; y++)								//							   Final cost of players
							{																		//							   Number of players for each ride
								System.out.println(dayTransactions[y]);
							}
						}
						
						System.out.println("\n");
						
						inputOption = 0;
					}
			
/*Option: 3*/		else if ( inputOption == 3)
					{
						if (numOfTransactions < 1000)
						{
							System.out.println("\nSelecting: 3");
							System.out.println("Beginning the ride.");																			// Resets the total players per round after ride begins.
							System.out.println("...");
							System.out.println("Ride has ended.");
							System.out.println("Displaying players' transactions:\n");
							
							if (numOfPlayers == 0)																								// No players but it is still a transaction as "Number of players for each ride"
							{																													// must be displayed and the ride has begun.
								System.out.println("No players this round.");
								dayTransactions[numOfTransactions] = "No players that round.\n";
							}
							
							for (int y = 0; y<personalCounterForTransactionDisplayPerRound; y++)												// Displays the transactions for the round.
								System.out.println(transactionDisplayPerRound[y]);																// I could empty this array after being used but the program will be less efficient
																																				// and there is no difference as I am using personalCounterForTransactionDisplayPerRound to count.
							
							dayTransactions[numOfTransactions] += "Total number of players that round is " + numOfPlayers +".\n";
							++transactionsStartWhenNotEqual1;
							++numOfTransactions;
							System.out.println("\n");
							numOfPlayers = 0;
							personalCounterForTransactionDisplayPerRound = 0;																	// Resets player tracker in each transaction.
						}
						else 
						{
							System.out.println("\nMaximum number of transactions have been reached.");											// 1000 transactions already.	Disables option 3.
							System.out.println("Unable to play option 3.");
							System.out.println("Please exit the program to end the day.\n");
						}
						
						inputOption = 0;
					}
				}
			
/*Option: -99*/				
				if (numOfPlayers > 0)																											// Disables option(-99) until all services is provided.
				{
					while (inputOption == -99)
					{
						System.out.println("\nCannot exit program until service is provided to paid players.\n");							
						inputOption = 0;
					}
				}
				else if (numOfPlayers == 0)															// Option(-99) is enabled.
				{
					while (inputOption == -99)
					{
						System.out.println("\nQuitting the System.");
						System.out.println("Displaying the entire day's transaction before Quitting:\n");
					
						if (transactionsStartWhenNotEqual1 == 1)
							System.out.println(noTransactionsYet);
						else
							for (int y = 0; y<numOfTransactions; y++)				
								System.out.println(dayTransactions[y]);
						
						System.out.println("\n");
						System.out.println("Total transactions total was: "+numOfTransactions);
						System.out.println("\nSystem Shut Down...");
						inputOption++;
					}
				}
		}
		
		catch(Exception ex)																			// For if user keys in alphabets or symbols.
		{
			System.out.println("\nInvalid input.");
			System.out.println("Please try again.\n");
			inputOption = 0;
		}
			}
		while (inputOption == 0);
	}
	
																																																													/**
	 ___________________________________________________________________________________________________
	|                        						 |											  	    |
	|   1.1     The display:  Displays the options   |        Callers: (1)	main (String[] args)        |
	|________________________________________________|__________________________________________________|
																																																													 **/
	public static void displayOption() 																// Question does not say to display option:-99.
	{
		System.out.println("Options:");
		System.out.println("1. Add ride players");
		System.out.println("2. Display entire day's transactions");
		System.out.println("3. Begin the ride");
		System.out.print("Please key in option: ");
		return;
	}
	
																																																													/**
	 ___________________________________________________________________________________________________________
	|														 |											        |
	|   1.2     The display:  User inputs: 1, 2, 3 or -99.   |        Callers: (1)	main (String[] args)        |
	|________________________________________________________|__________________________________________________|
																																																													 **/
	public static int getOption()
	{
		Scanner sc = new Scanner (System.in);
		int option;
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
	 __________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
	|														                               											|											        |													   |
	|   2     Adding players:  The interface / The player's particulars / The total players /   									|        Callers: (1)	main (String[] args)        |        Callees: (2.1)	getFirstPlayerName()           |
	|                          The price     / The discounted price 	/ The payment   	/   									|___________________________________________________|				  (2.2)	getFirstPlayerAge()            |
	| 						   The adding of transactions                                   									    |												    |				  (2.3) getSecondPlayerName()          |
	|						   ( The list briefly describes the process within "Adding players" accordingly step by step,       )   |      											    |				  (2.4) getSecondPlayerAge()           |
	| 						   ( and briefly explains the functions of the list of variables listed below step by step as well. )   |												    |				  (2.5) discountDisplay()              | 
	|																															    |												    |				  (2.6) getDiscountsAvailable()        |
	| 						   Returns value of a part of transaction, and "number of players" indirectly.       				    |												    |______________________________________________________|
	|_______________________________________________________________________________________________________________________________|
																																																													 **/
	public static String addingRidePlayersInterface(int numOfPlayers)
	{
		
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
		
		String discountsAvailable = "";			String sumString;
		int num1 = 0;							int discount1 = 0;										// "num1 to num4" are for "discount1 to discount4" later on.
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
					
						
/*Player Name*/		playerName = getFirstPlayerName();
					if ( playerName.equals("-99") )																							// Input(-99). Returns to main menu.
					{
						System.out.println("Returning to main menu.\n");
						dayTransaction = " ";
						return dayTransaction;
					}
					
					try
					{
/*Player Age*/			playerAge = getFirstPlayerAge();
					
						if (playerAge == -99)																								// Input(-99). Returns to main menu.
						{
							System.out.println("Returning to main menu.\n");
							dayTransaction = " ";
							return dayTransaction;
						}
						else if (playerAge < 3 || playerAge > 80)									// Invalid Inputs.
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
						else if (playerAge >= 3 && playerAge <=5)									// Valid Inputs and prompts an adult.
						{
							if (numOfPlayers != 4)
							{
								++numOfChild;
								++numOfPlayersBelow6;
									
								System.out.println("An accompanying adult is required.\n");
								do
								{
	/*Optional*/					redo = 0;
	/*Adult Name*/					playerAdultName = getSecondPlayerName();																	// Input(-99). Cancel adding of child(First player).
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
		/*Optional*/					playerAdultAge = getSecondPlayerAge();																
		/*Adult Age*/					if ( (playerAdultAge < 16 || playerAdultAge > 80) && playerAdultAge != -99)								// The "Adult" is too young or old to join.
										{																										// Prompts another adult to join.
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
									catch (Exception ex)												// Invalid input of letters and alphabets.
									{
										++redo;
										++redo;
										System.out.println("Invalid age.");
										System.out.println("Repeating Process of adding accompanying adult...\n");
									}
								}
								while (redo == 2);
											
								if (playerAdultAge == -99)																						// Input(-99). Returns to adding of first player.
								{																												// If the child changes his/her mind.
									--numOfChild;
									--numOfPlayersBelow6;
									++redo;
									playerAdultName = "";
										
									System.out.println("Returning to the start.");
									System.out.println("Repeating Process...\n");
									continue;
								}
								if (playerAdultAge >= 16 && playerAdultAge <= 80)						// Valid inputs.
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
									System.out.println("Confirming players...");						// Skip to line 516.
								}
							}
							else																											// Number of players is already 4.
							{																												// Allows only 1 Child or 1 Adult.
								System.out.println("An accompanying adult is required.");													// Redo if a child + adult wants to join.
								System.out.println("However, only 1 more player is allowed into the ride.");
								System.out.println("Processing Data...");
								System.out.println("\nPlease ask the child to come back again later with an adult.");
								System.out.println("Cancelling the adding of a young child...");
								System.out.println("Returning to adding of player...\n");
									
								++redo;
							}
						}
						else if (playerAge >=6 && playerAge <=12)																			// Valid inputs for first player.
						{
							++numOfChildSingle;
							++numOfPlayers6To12;
							System.out.println("Confirming player...");																		// Skip to line 516.
						}
						else if (playerAge >=13 && playerAge <=16)									// Valid inputs for first player.
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
							System.out.println("Confirming player...");								// Skip to line 516.
						}
						else if (playerAge >=17 && playerAge <=65)																			// Valid inputs for first player.
						{
							++numOfAdult;
							++numOfPlayers17To65;
							System.out.println("Confirming player...");																		// Skip to line 516.
						}
						else if (playerAge > 65)													// Valid inputs for until age 80 for first player.
						{
							++numOfAdult;
							++numOfPlayersAbove65;
							System.out.println("Confirming player...");								// Skip to line 516.
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
							
				totalNumOfPlayers = numOfChild + numOfAdult + numOfChildSingle;						// This is line 516.
						
/*Discounts*/	System.out.println("Proceeding to the price of tickets.");																	// This section contains the discounts available and the input.
																																			// I made it flexible for any numbers ( from 0 to 4 ) to input the options.
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
						discountsAvailable = getDiscountsAvailable();								
						count = discountsAvailable.length();										// a) Gets length of string.									
						
						int i = count;																// b) Passes it to i.		
						if ( discountsAvailable.equals("-99") )																				// Input(-99). If player changes his/her mind.
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
											
							if (i<5)																// c) Uses i to check for the available discount.
							{																		// Added flexibility of inputs.
								switch (i)																									// Passing values to the num1 to num4 variables initialized earlier on.						
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
										
								if (num1 != num2 && num1 != num3 && num1 != num4 && num2 != num3 && num2 != num4 && num3 != num4)			// Checking each num1 to num4 carefully for the available discounts.
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
												
										default:    ++redo;											// Skip to line 695 if ended at default.
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
													System.out.println("Invalid Input.");			// Skip to line 695 if ended at default.
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
													System.out.println("Invalid Input.");			// Skip to line 695 if ended at default.
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
													System.out.println("Invalid Input.");			// Skip to line 695 if ended at default.
													System.out.println("Try again.");
									}
								}
								else
								{
									++redo;															// Error in input.
									System.out.println("Invalid Input.");							// Skip to line 695.
									System.out.println("Try again.");
								}
							}																		// Error in input.
							else
							{
								++redo;
								System.out.println("Invalid Input.");
								System.out.println("Try again.");
							}
						}
					}
					catch (Exception ex)															// For if input containing alphabets or symbols.
					{
						++redo;
						System.out.println("Invalid Input.");
						System.out.println("Try again.");
					}
				}
				while (redo == 1);																	// This is line 695.
			}
			while (redo == 2);
			if (discount1 == 1 && discount2 == 1)
				--discount2;
						
			totalPrice = totalPrice-(discount1*totalPrice*pOSBDiscountRate);
			totalPrice = totalPrice-(discount2*totalPrice*oCBCDiscountRate);
			totalPrice = totalPrice-(discount3*totalPrice*nYPStudentDiscountRate);
			totalPrice = totalPrice-(discount4*totalPrice*safraCardDiscountRate);
						
/*Price*/	totalPrice = totalPrice+(totalPrice*gSTRate);											// Price
					
			if (playerAdultName.length() > 0)																								// If there is 2 players.
			{	
				totalPrice = Math.round(totalPrice*100.0)/100.0;
				feeDeclarationSentence = playerName + "'s and " + playerAdultName + "'s fee for tickets are $" + totalPrice;
				System.out.print("\n" + playerName + "'s and " + playerAdultName + "'s fee for tickets are $");
				System.out.printf("%.2f", totalPrice);
				System.out.println(".");	
			}
			else																															// Else if there is only 1 player.
			{
				totalPrice = Math.round(totalPrice*100.0)/100.0;
				feeDeclarationSentence = playerName + "'s fee for a ticket is $" + totalPrice; 
				System.out.print("\n" + playerName + "'s fee for a ticket is $");
				System.out.printf("%.2f", totalPrice);
				System.out.println(".");
			}
						
/*Money*/	System.out.println("Proceeding to payment...\n");
				
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
				catch (Exception ex)																// For if input containing alphabets or symbols.
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
				if (amountReceived == -99)															// Input(-99). If player changes his/her mind.
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
									
							
					System.out.println("Cancelling the payment of tickets.");																// I added a feature to pay back the money if the player changers his/her mind.
					System.out.println("Processing...");
					System.out.printf("Returning $%.2f", totalAmountReceived);
					System.out.println(" to player.");
					System.out.println("Returning to adding of first player.\n");					// Skip to line 847.
					continue;
				}
				else if (amountReceived < 0)														// Invalid input.
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
				else if (amountReceived >= 0)														// Valid inputs.
				{				
					if (amountLeftToPay > 0)														// Pay more.
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
									
					else if (amountLeftToPay <0)													// Over-paid
					{
						amountLeftToPay = 0 - amountLeftToPay;
						System.out.printf("Over-paid the fee by: $%.2f", amountLeftToPay);
						System.out.printf("\nReturning $%.2f", amountLeftToPay);
						amountLeftToPay = 0.00;
					}																				// Says nothing if paid at precise amount.
				}
			}
			while (redo == 1);
		}
		while (redo == 2);																			// This is line 847.
				
			
/*End*/	numOfPaymentMade = totalNumOfPlayers;
		if (numOfPaymentMade == 1)																	// 1 player.
			System.out.println("\n\nPayment has been made.");							
		if (numOfPaymentMade > 1)																	// 2 players.
		{
			System.out.println("\n" + numOfPaymentMade + " payments have been made.");				
			++twoPlayers;
		}
				
		if (twoPlayers == 1)
		{
			dayTransaction = feeDeclarationSentence                     
			               + "\n" + "Number of players was " + totalNumOfPlayers + "." 
	                       + " \n"+ addOn;															// "String addOn" will be used at the main method to detect 2 players later on.
		}
		else
		{
			dayTransaction = feeDeclarationSentence                   
			               + "\n" + "Number of players was " + totalNumOfPlayers + "." 
	                       + " \n-";
		}
		System.out.println("Returning to main menu\n");
		
		return dayTransaction;																		// Return to main.
	}
	
																																																													/**
	 _______________________________________________________________________________________________________________________
	|                                                             |														    |
	|   2.1     Adding players:  Adding the first player's name   |        Callers: (2)	addingRidePlayersInterface()        |
	|_____________________________________________________________|_________________________________________________________|
																																																													 **/
	public static String getFirstPlayerName()
	{
		Scanner sc = new Scanner (System.in);
		String playerName;
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
	 _______________________________________________________________________________________________________________________
	|  															 |														  	|
	|   2.2     Adding players:  Adding the first player's age   |        Callers: (2)	addingRidePlayersInterface()        |
	|____________________________________________________________|__________________________________________________________|	
	 																																																												 **/
	public static int getFirstPlayerAge()
	{
		Scanner sc = new Scanner (System.in);
		int playerAge;
		
		System.out.print("Please key in age: ");
		playerAge = sc.nextInt();
		
		return playerAge;		
	}
	
																																																													/**
	 ___________________________________________________________________________________________________________________________________
	|														           	    |														    |
	|   2.3     Adding players(Optional):  Adding the adult player's name   |        Callers: (2)	addingRidePlayersInterface()        |															 
	|_______________________________________________________________________|___________________________________________________________|
																																																													  **/
	public static String getSecondPlayerName()
	{
		Scanner sc = new Scanner (System.in);
		String replaceForUpperCase;	
		String playerAdultName;
		
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
	 ___________________________________________________________________________________________________________________________________
	|																	   |														    |
	|   2.4     Adding players(Optional):  Adding the adult player's age   |        Callers: (2)	addingRidePlayersInterface()        |	
	|______________________________________________________________________|____________________________________________________________|
																										 																																			 **/
	public static int getSecondPlayerAge()
	{
		Scanner sc = new Scanner (System.in);
		
		int playerAdultAge;
		System.out.print("Please key in age of adult: ");
		playerAdultAge = sc.nextInt();
		
		return playerAdultAge;
	}
	
																																																													/**
	 ___________________________________________________________________________________________________________
	|                                                |											  	 		    |
	|   2.5     Adding players:  Displays discounts  |        Callers: (2)	addingRidePlayersInterface()        |	
	|________________________________________________|__________________________________________________________|
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
		System.out.println("(E.g: 124   , 43  , 31  , 0)");
		System.out.println("Do not repeat numbers.");
		
		return;
	}
	
	
																																																													/**
	 ___________________________________________________________________________________________________________________
	|  														 |														    |
	|   2.6     Adding players: Discounts applicable input   |        Callers: (2)	addingRidePlayersInterface()        |
	|________________________________________________________|__________________________________________________________|		
																										 																																			 **/
	public static String getDiscountsAvailable()
	{
		Scanner sc = new Scanner (System.in);
		String discountsAvailable;
		
		System.out.print("Please key in options applicable: ");
		discountsAvailable = sc.nextLine();
		
		discountsAvailable = discountsAvailable.replace(" ","");
		
		return discountsAvailable;
		
	}

	
}


	
																																																													/**
					 _______________________________
					|							    |
					|           Thank you   	    |
					|       For marking this.       |
					|_______________________________|
																																																													 **/
