-- function - performs a specific task 
-- math functions
-- Aggrgrate functions 

/*SELECT * FROM employee;
-- count 

SELECT COUNT(*)total FROM employee;

-- specific count

SELECT COUNT(*) No_of_developer FROM employee
WHERE job_desc="web developer";
 
 -- specific average
 
 SELECT AVG(salary) FROM employee
 WHERE job_desc="Manager";
 
 -- sum of salary
 SELECT SUM(salary) FROM employee
 WHERE job_desc="web developer";
 
 -- max salary
 SELECT MAX(salary) FROM employee;
 
 -- min salary
 SELECT MIN(salary) FROM employee;
 */
 
 -- string
 -- upper case
 SELECT UCASE(emp_name)name,salary FROM employee;
 
 --  we can get custom column
 
 SELECT emp_name,CHAR_LENGTH(emp_name) FROM employee;
 
 -- join - concat
 
 SELECT emp_name,CONCAT('RS.',salary) FROM employee;
 
 -- format 
 SELECT emp_name,CONCAT('Rs.',FORMAT(salary,0)) salary FROM employee;
 
 -- left
 SELECT emp_name,LEFT(job_desc,3)
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 