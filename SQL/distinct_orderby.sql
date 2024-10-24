-- Distinct , OrderBy
USE logicfirst;

SELECT * FROM employee;

SELECT job_desc FROM employee; -- it shows all jobs
 
SELECT  DISTINCT job_desc FROM employee; -- it shows distinct jobs description , without duplicates

-- order by
-- want to job in order

SELECT * FROM employee
ORDER BY emp_name ASC; -- we can indicate ASC

SELECT * FROM employee
ORDER BY salary DESC;  -- descending order

-- wanted to order salary also same salary ascending order
SELECT * FROM employee
ORDER BY salary,emp_name;

-- we can use where

SELECT * FROM employee
WHERE job_desc="Manager"
ORDER BY salary;

-- order by job description

SELECT * FROM employee
ORDER BY job_desc;

-- custom order 

SELECT * FROM employee

ORDER BY (CASE job_desc

WHEN 'CEO' THEN 1
WHEN 'Manager' THEN 2
WHEN 'HR' THEN 3
ELSE 100 END

);











 
