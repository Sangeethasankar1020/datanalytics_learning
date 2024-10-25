-- Constraints - is like a rule
USE logicfirst;

-- DROP TABLE employee;

-- creating employee table using constraints
-- usually when we create a data without enetering its automatically enters null to avoid this 

-- NOT NULL,DEFAULT,UNIQUE,CHECK 
-- for auto increment - we can give staring value also
-- AUTO_INCREMENT = 210921 


CREATE TABLE employee(
emp_id INT PRIMARY KEY AUTO_INCREMENT,
emp_name VARCHAR(30) NOT NULL,
job_desc VARCHAR(20) DEFAULT 'unassigned',
salary INT,
pan VARCHAR(10) UNIQUE,
CHECK (salary>10000)
); 


INSERT INTO employee(emp_name,salary) VALUES ("Sangeetha",100000000);

SELECT *FROM employee;
-- DROP TABLE employee;
-- we created a tablw without constrains 

CREATE TABLE employee(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(30),
job_desc VARCHAR(20),
salary INT
);

-- add not null constrains
ALTER TABLE employee
MODIFY emp_name  VARCHAR(30) NOT NULL;

-- drop not null constrains
ALTER TABLE employee
MODIFY emp_name  VARCHAR(30);

-- add fefault constrains
ALTER TABLE employee
ALTER job_desc SET DEFAULT "unassigned";

-- drop default constrains
ALTER TABLE employee
ALTER job_desc DROP DEFAULT;

-- add check constrains

ALTER TABLE employee
ADD  CONSTRAINT  chk_salary CHECK  (salary>10000) ;

-- we can drop also 
ALTER TABLE employee
DROP CHECK chk_salary;






























 

