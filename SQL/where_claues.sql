-- creating new table
/* USE logicfirst;

CREATE TABLE employee(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(30),
job_desc VARCHAR(20),
salary INT
);



INSERT INTO employee VALUES(1,"Sangeetha","Developer",1000000),
(2,"raje","app developer",2372837),
(3,"Mahema","Web Developer",500001),
(4,"vidhya","Content Creator",0935084340),
(5,"admin","Administation",21376),
(6,"ijass","TL",52461752);

SELECT * FROM employee
WHERE emp_name="ijass";


-- select particular  column also
-- where conditions more are like filter 
SELECT emp_id,emp_name FROM employee
WHERE emp_id>3;

--  filter two condition also

SELECT * FROM employee
WHERE salary >2321 AND job_desc="Developer";


SELECT * FROM employee
WHERE salary >2321 OR job_desc="Developer";


SELECT * FROM employee
WHERE job_desc="TL" OR job_desc="Developer";  -- better

-- above two job desc so we can give more appropriate

SELECT * FROM employee
WHERE job_desc IN ("TL","Admin");

SELECT * FROM employee
WHERE job_desc NOT IN ("TL","Admin");

SELECT * FROM employee
WHERE salary BETWEEN 20000 AND 10000000
LIMIT 5; -- we can limit 

SELECT * FROM employee
LIMIT 2;

-- LIKE 
--  WILDCARDS % - Zero or More Characters
-- "_" - Exactly  One Character 

SELECT * FROM employee
WHERE emp_name LIKE 'm%';

SELECT * FROM employee
WHERE emp_name NOT  LIKE 'm%';

SELECT * FROM employee
WHERE emp_name LIKE 'm%a';

SELECT * FROM employee
WHERE emp_name LIKE '%i%';

SELECT * FROM employee
WHERE emp_name LIKE '__n%';

-- we really wanted to search % , give escape characters - \


*/

-- UPDATE AND DELETE
-- USE logicfirst-- 

UPDATE employee
SET job_desc="Analyst";
-- without using where class it affects all rows 

UPDATE employee
 SET job_desc="web developer"
 WHERE  job_desc="Analyst";
 
 -- to view all data
 SELECT * FROM employee;

--  delete

DELETE FROM employee
WHERE emp_id=6;





