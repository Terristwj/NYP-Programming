When trying to run this project on another computer, there will be problems.
Most of these problems is because of usins a temporary Local Hosted SQL Database.

1. Download the project zip file
2. Delete the bin and obj folders inside
3. Open the project in Visual Studio
4. Delete the database folder and its contents
5. Create a new database using SQL Server Object Explorer
	- At the top left, click on "View" > "SQL Server Object Explorer"
		- This will be used to host local databases
		- Any normally created databases will be seen inside "Server Explorer"
	- In the "SQL Server Object Explorer, open "SQL Server"
		- Then, ideally, open "(localdb)MSSQLLocalDB"
		- Then right click "Databases" folder and "Add new database"
	- Give you database a name and find an ideal location to save it
		- Then create the database
6. Use this .xlsx file to copy/paste all the database table and data
7. Configure the new database into the project SQLConnectionStr
8. Open Spotfire and configure a connection to "Microsoft SQL Server" with the server name
	- The server name is usually "(localdb)MSSQLLocalDB"
        - Save the Windows Authentication username and password somewhere
		- Currently, I do not know where to find your password
	- Select the tables to make a connection to
		- You can unselect columns
	- Create the data source connection to "Microsoft SQL Server"
9. Finish. You can now use the entire App, both SpotfireDemo and Spotfire


(Better Spotfire) Alternate STEP 8:
When performing STEP 8, you cannot select "New data when possible" for the data source...
1. Create a connection to any random .xls file
2. Go into the data canvas
3. Then replace the data source
4. Repeat the original STEP 8 to replace the data source, just before the "Select tables"
5. There are options to select multiple tables, ONLY SELECT ONE
6. Finish. Now connected to a hosted database AND can use previously stored data if cannot load


(Existing STEP 5) Alternate STEP 5:
If you have done the original procudures on the same computer before AND have created a database...
1. Congfigure the new database into the project SQLConnectionStr
2. Check the SpotfireDemo and Spotfire can run properly