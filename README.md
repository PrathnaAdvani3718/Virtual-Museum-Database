# Virtual-Museum-Database
The database for the Virtual Museum Project stores information about museum artifacts, including their descriptions, categories, and associated metadata. The database tracks user interactions within the virtual environment, such as artifact views and user preferences, to enhance the user experience and provide personalized recommendations.
1. *Open MySQL Workbench:*
   - Launch MySQL Workbench on your computer.

2. *Connect to MySQL Server:*
   - In MySQL Workbench, click on the "+" icon next to "MySQL Connections" to create a new connection if one doesn't exist.
   - Enter the connection details such as connection name, hostname (usually "localhost" if running locally), port (default is 3306), username, and password.
   - Click "Test Connection" to ensure the connection is successful, then click "OK" to save the connection.

3. *Create a New Schema:*
   - In MySQL Workbench, go to the "Navigator" pane on the left side.
   - Right-click on "schemas" and choose "Create Schema...".
   - Enter a name for the schema, e.g., "virtual_museum", and set the default collation if needed. Click "Apply" and then "Apply" again to create the schema.

4. *Open SQL Editor:*
   - In the "Navigator" pane, click on the schema you just created (e.g., "virtual_museum").
   - In the main window, click on the "SQL" tab to open the SQL Editor.
     5. *Copy and Paste SQL Script:*
   - Copy the entire SQL script that defines your database schema (the CREATE TABLE statements and other schema-related commands).

6. *Run SQL Script:*
   - Paste the SQL script into the SQL Editor in MySQL Workbench.
   - Click on the lightning bolt icon or use the shortcut (Ctrl + Enter) to execute the script.

7. *Verify Execution:*
   - After executing the script, check the "Output" tab in MySQL Workbench for any messages or errors. Make sure there are no errors during script execution.
   - You can also refresh the schema in the "Navigator" pane to see the newly created tables and relationships.

8. *Explore and Manage Database:*
   - Once the script is successfully executed, you can explore the database schema in MySQL Workbench.
   - Use the "Navigator" pane to view tables, relationships, and other schema elements.
   - You can also perform data manipulation (insert, update, delete) and query the database using SQL queries in the SQL Editor.

9. *Optional: Populate Tables with Data:*
   - If you have sample data to populate the tables, you can use INSERT statements in the SQL Editor to add data to the tables after creating the schema.
   - Make sure to follow proper data insertion practices and maintain data integrity.

10. *Save Changes:*
    - After running the schema and any data insertion scripts, save your changes in MySQL Workbench to persist the schema and data.

