-- subqueries

USE logicfirst;


SELECT * FROM employee;
SELECT * FROM branch;

-- Displays employee list in Chennai Branch
SELECT * FROM employee
WHERE branch_id = (SELECT branch_id
FROM branch
WHERE br_name="Chennai");

-- Displays the employees with min salary
SELECT * FROM employee
WHERE salary = (SELECT MIN(salary)
FROM employee);

-- displays the branches containing atleast one admin
SELECT branch_id,br_name
FROM branch
WHERE EXISTS 
( SELECT * FROM employee
WHERE job_desc="ADMIN" AND branch.branch_id = employee.branch_id);

-- displays the branch info in which any employee gets more than 25L
SELECT branch_id,br_name
FROM branch
WHERE branch_id = ANY
(SELECT branch_id FROM employee
WHERE salary>2500000);

-- displays employees not working in chennai or coimbatore

SELECT * FROM employee 
WHERE branch_id <> ALL ( SELECT branch_id FROM branch
WHERE br_name IN ("Chennai","Coimbatore"));




