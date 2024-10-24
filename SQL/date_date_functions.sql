-- Date

ALTER TABLE employee ADD COLUMN hire_date DATE;

SELECT * FROM employee;

-- we have to specify 

UPDATE employee 
SET hire_date="2024-02-19"; 

SELECT * FROM employee;

UPDATE employee 
SET hire_date="2024-04-11"
WHERE job_desc="web developer";

SELECT * FROM employee;


-- current time

SELECT NOW();

SELECT DATE(NOW()); -- or

SELECT CURDATE();

-- change format ,Y - 2 digit
SELECT DATE_FORMAT(CURDATE(),"%d/%m/%y") AS Date;


-- date differnce 
SELECT DATEDIFF(CURDATE(),"2000/02/19") AS Days;

-- date add , deadline,validity
 --  we can give day, week 
 
SELECT DATE_ADD(CURDATE(),INTERVAL 1 WEEK ) AS 'After One Day';






