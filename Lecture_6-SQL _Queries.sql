/*
Subquery:---
	A subquery or inner query or Nested Query is a query within the another 
	SQL query and embedded within the clauses  and most commonly where clause.

	Rules:--
	1) Subqueries must be enclosed within parenthesis
	2) A Subquery can have  only one Column in the SELECT Clause 
	3) An ORDER BY Command cannot be used in Subquery, although main query ORDER BY  , GROUP BY
	4) Subqueries that return more than one row can only be used with mutiple values operators  such as IN Operator
	5) Subquery Cannot be immediately enclosed in set function
	6) The BETWEEN Operator  cannot be used with Subquery. then within query it is posssible.

*/

Use Hitesh
SELECT * FROM Customers$

/*
Subquery with SELECT Statement:
Synatx:-
SELECT Column_name_s 
FROM table1  , table2
WHERE column_name OPERATOR
(SELECT Column_name FROM table1, table2 WHERE )


*/
-- TOP N

SELECT TOP 100 *  FROM 
	Customers$
		WHERE CustomerKey IN 
		   (SELECT CustomerKey FROM Customers$ 
		    WHERE AnnualIncome > 150000);





/*

Subquery with INSERT STATEMENT:--

INSERT INTO table_name 
SELECT * FROM Table_name 
WHERE ID IN (SELECT Column_name From Table_name)


*/
CREATE TABLE Customers_BAKP( CustomerKeys int);

INSERT INTO Customers_BAKP
SELECT CustomerKey FROM Customers$
WHERE CustomerKey IN 
( SELECT CustomerKey FROM Customers$)



SELECT * FROM Customers_BAKP



/*
SUBQUERY with UPDATE Statement



*/
SELECT * FROM Customers$


UPDATE Customers$
	SET AnnualIncome  = AnnualIncome* 0.25
		WHERE TotalChildren IN 
			(SELECT TotalChildren FROM Customers$ 
			WHERE TotalChildren = 4 )



SELECT FirstName , LastName , AnnualIncome
FROM Customers$
WHERE TotalChildren = 4



/*
Subquery with DELETE STATEMENT:-

DELETE FROM table_name 
WHERE Column_name IN (SELECT Column_name FROM Table_name where column_name Condition)

*/

SELECT * FROM Customers$

DELETE FROM Customers$
	WHERE EducationLevel IN 
	  (SELECT EducationLevel FROM Customers$ 
	   WHERE EducationLevel = 'Partial College')











/*
SQL Stored Procedures:--

It is a group of Precompiled SQL Statements that can  be used  to run again and again 

They can be used to Perform  wide range of Database Operations Such as Insertion , Deletion , Updation , ALTER
generating reports  , perform the complex Operations


Stored Procedures are very useful because they allow you to encapsulate a set of SQL statements in  a single unit and execute them repeatedly
with different parameters making it easy to manage and reuse the code or query.



Synatx of Stored Procedures:-

CREATE PROCEDURE procedure_name
	@parameter1 datatype 
	@parameter2 datatype
	.
	.
	.@parameter_n datatype

AS 
BEGIN 
		---- SQL statement to be excuted

END


To run the procedure:--
EXEC procedure_name
EXEC procedure_name  @parameter = Value_of that_Parameter

int a = 10
 a= 10 # int
 @a int
*/


SELECT * FROM Customers$


CREATE PROCEDURE GetCustomerInformation
      @custkey  INT
AS 
BEGIN 
	SELECT * FROM Customers$
	WHERE CustomerKey = @custkey
END


EXEC GetCustomerInformation @custkey = 11000

/*
Types of Parameters:
INPUT Parameters :-
OUTPUT Parameters:-
INPUT/OUTPUT Parameters:-
Table_values Parameters:-
Default Parameters:-
Cursor Parameters:--
Output XML Paramters :--


XML Parameters :--
<xml version = 1.0 encoding = UTF-8 ?>
<students>
<stduent id = 12>
	<stdname> Hitesh </stdname>
	<stdage> 21 </stdage>
<student>
</ students>


*/

SELECT * FROM Customers$

CREATE PROCEDURE GetCustomerAnnualIncomes
	@ID INT
AS
BEGIN
	SELECT AnnualIncome 
	FROM Customers$ 
	WHERE CustomerKey = @ID
END


EXEC GetCustomerAnnualIncomes @ID = 11000


--Syntax of Renaming  tables as well as Stored Procedure Name also  :
--EXEC SP_RENAME 'OLD_TABLE_NAME' , 'NEW_TABLE_NAME';
-- EXEC SP_RENAME  'Old_Procedure_Name' , 'NEW_Procedure_Name';
EXEC sp_rename 'Customers_BAKP' , 'Customers_BACKUP_TABLE';

SELECT * FROM [dbo].[Customers_BACKUP_TABLE]



ALTER PROCEDURE GetCustomerAnnualIncomes
		@CustID INT
		--@CustName VARCHAR(MAX)

AS 
BEGIN
		SELECT * FROM Customers$ 
		WHERE CustomerKey = @CustID 

END


EXEC GetCustomerAnnualIncomes @CustID = 11000



DROP PROCEDURE  GetCustomerAnnualIncomes;


/*
Advantages of Stored Procedures:--
1) Improved Performance
2) Query Reuse
3) Reduced the traffic Network
4) Better Security
5) Simplified  Maintenance:--

*/

SELECT @@SERVERNAME


/*
Triggers :--

It is a Stored Program . If any particular event occurs this query executed automatically 



Syntax of Triggers:--

CREATE [OR REPLACE] TRIGGER trigger_name
{BEFORE | AFTER | INSTEAD OF}
{INSERT [OR] | UPDATE [OR] | DELETE }
[OF Column_name]
ON Table_name
[REFRENCING OLD AS NEW TABLE_NAME AS n]
FOR EACH ROW
WHEN CONDITION
DECLARE 
	Declare Statements
BEGIN
	Execution-Statements
EXCEPTION

	Exception_handling-Statements
END;

*/

SELECT * FROM Customers$

CREATE TRIGGER display_Annual_Incom_Changes
BEFORE DELETE ON 
Customers$
FOR EACH ROW
WHEN (NEW.CustomerKey > 11000)
DECLARE 
	SALARY_Difference 
BEGIN 
	SALARY_Difference := : NEW.AnnualIncome - :OLD.AnnualIncome;
	dbms_output.put_line('Old Salary:' || : OLD.AnnualIncome);
	dbms_output.put_line('New Salary:' || : NEW.AnnualIncome);
	dbms_output.put_line('Salry_Difference:' || : SALARY_Difference);

END;

SELECT * FROM  Customers$
CREATE TRIGGER T_Annual ON Customers$ 
INSTEAD OF INSERT 
AS BEGIN
	DECLARE @FirstNames VARCHAR(128);
	DECLARE @CustomerKEYS INT;
	SELECT @FirstNames = FirstName , @CustomerKEYS = CustomerKey FROM inserted
END;

INSERT INTO Customers$(FirstName ,CustomerKey)
VALUES('Hitesh' , 100000);



SELECT FirstName  , CustomerKey
FROM Customers$
WHERE FirstName = 'Hitesh'