/*SHOW DATABASES;

CREATE DATABASE logicfirst;

DROP DATABASE logicfirst;

DROP SCHEMA logicfirst;

DROP SCHEMA if exists logicfirst;

*/

/*USE logicfirst;
SHOW TABLES; */

/*USE sys;
SHOW TABLES;*/

-- create table in database
USE logicfirst;

CREATE TABLE student(
     id INT PRIMARY KEY,
     name VARCHAR(30),
     gpa DECIMAL(3,2)
);

/*-- view table
DESCRIBE student;

-- delete table

DROP TABLE student;
 
 -- additional  adding columns
 
 ALTER TABLE student ADD department VARCHAR(10);
 
 
 DESCRIBE student;
 
 -- delete columns
 
 ALTER TABLE student DROP department;
 
 DESCRIBE student;
 
 -- adding data insert
 
 INSERT INTO student VALUES(1,"Sangeetha",8.0);
 INSERT INTO student VALUES(2,"Maheswaran",9.0);
 INSERT INTO student VALUES(3,"Vidhya",7.9);
 INSERT INTO student VALUES(4,"Rajeshwari",7.0);
 
 -- we can insert all multiple data by comma
 
 INSERT INTO student VALUES(5,"Logeshwari",9.3),
 (6,"Jayanthi",9.8);
 
 -- ** means all columns and all rows
 
 SELECT * FROM student;
 
 -- inserting specific data ,some were unknown
 
 INSERT INTO student(id,name) VALUES(8,"Praveen");
 
 SELECT * FROM student;
 
 -- select specfic collumns to display
 
 SELECT id,name FROM student;
 
 
 */
 
 
 
 
 