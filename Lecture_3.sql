CREATE DATABASE COACHX

USE COACHX
CREATE TABLE Customer(

	Cust_Id INT , 
	Fisrt_Name VARCHAR(30) , 
	Last_Name VARCHAR(50) , 
	AreaCode INT , 
	Addresss VARCHAR(100) , 
	Phone VARCHAR(13)


);

SELECT * FROM Customer

USE Jitendra
SELECT * FROM Students





CREATE DATABASE Hitesh
USE Hitesh


SELECT * FROM Customer



CREATE TABLE School(

	School_Id INT IDENTITY(1,1) PRIMARY KEY  , 
	SchoolName VARCHAR(50)  NOT NULL  UNIQUE , 
	Descriptions VARCHAR(MAX) NULL , 
	Addresss VARCHAR(50)  NULL  , 
	Phone VARCHAR(15) NOT NULL  , 
	PostAddress VARCHAR(50)  NULL 



);
CREATE TABLE CLASS(

	ClassId INT  PRIMARY KEY , 
	School_Id  INT NOT NULL FOREIGN KEY  REFERENCES  School(School_Id) , 
	ClassName VARCHAR(50)  NOT NULL UNIQUE   , 
	Descriptions VARCHAR(MAX)  NULL ,
	ClassCode INT 


);

SELECT * FROM School




CREATE TABLE  Customer(

	Cust_Id INT  PRIMARY KEY  ,
	Cust_Nos INT NOT NULL UNIQUE , 
	LastName VARCHAR(30) NOT NULL , 
	FirstName VARCHAR(40) NOT NULL ,
	AreaCode INT NOT  NULL , 
	Addresss VARCHAR(100) NOT  NULL , 
	Phone VARCHAR(30) NOT NULL

);


INSERT INTO Customer(Cust_Id  , Cust_Nos , LastName , FirstName , AreaCode , Addresss , Phone)
VALUES
(1 , 10, 'Sharma' ,'Rohit' , 411031 , 'Mumbai' , '8684569845'), 
(2 , 20, 'Jha' ,'Hitesh' , 411032 , 'Pune' ,  '8446049402'), 
(3 , 30, 'Pawar' ,'Jitendra' , 411033 , 'Mumbai' , '8684569848'), 
(4 ,40, 'Sukale' ,'Nikhil' , 411034 , 'Nagpur' , '8684564845'), 
(5 , 50, 'Patil' ,'Snehal' , 411031 , 'Pune' , '8687569845'); 



INSERT INTO Customer
VALUES
(6 , 60 , 'Patil' , 'Nikhil' , 411025 , 'Deccan' , '8687569848');




INSERT INTO Customer(Cust_Id  , Cust_Nos , FirstName   , Phone)
VALUES
(7 ,70 , 'Jeetika' , '8446049402')

USE Hitesh
CREATE TABLE Class(

	ClassId INT  PRIMARY KEY , 
	ClassName VARCHAR(50)  NOT NULL UNIQUE   , 
	Descriptions VARCHAR(MAX)  NULL ,
	ClassCode INT  NULL


);


INSERT INTO Class( ClassId , ClassName )
VALUES
(101 , 'BCD')


SELECT * FROM Class

SELECT * FROM Customer


-- This i scalled Single Line COmment 


/* This is 
Called Multi
line 
Comment */



/* Check Constraints and Default :*/

CREATE TABLE  CustomerTable1(

	Cust_Id INT  PRIMARY KEY  ,
	Cust_Nos INT NOT NULL UNIQUE CHECK( Cust_Nos > 10),  
	FirstName VARCHAR(40) NOT NULL  ,
	Addresss VARCHAR(100) NOT  NULL Default 'Mumbai' , 
	Phone VARCHAR(30) NOT NULL

);



SELECT * FROM CustomerTable1



INSERT INTO CustomerTable1
VALUES
(1 , 50,'Shreya' , 'Pune' , '8446049402')



INSERT INTO CustomerTable1
VALUES
(2 , 60,'Shreya'   , 'Mumbai' , '8446049402')



/*

Small Assignments :-
1. Design a Database of ur choice in which it should contain 10 Tables (5 Tables Manually and 5 Tables with Query) 
2. In each table you should have different atleast one Constraints
3. Insert atleast 10 Records in each table with diffrent syntaxes of insert statements and you can allow the null Values
4. Apply 5 Foreign Keys in this 10 Tables and PK keys 
5. Apply Different Condition of Check Constraints.


*/

