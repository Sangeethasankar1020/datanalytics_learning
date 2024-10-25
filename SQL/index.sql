-- Index
USE logicfirst;

SHOW INDEX FROM employee;
-- its showing foreign
DROP TABLE employee;

CREATE TABLE employee(
emp_id INT PRIMARY KEY AUTO_INCREMENT,
emp_name VARCHAR(30) NOT NULL,
job_desc VARCHAR(20) DEFAULT 'unassigned',
salary INT,
pan VARCHAR(10) UNIQUE,
CHECK (salary>10000)
); 

SHOW INDEX FROM employee;
-- its showing pan also its unique so its in index

-- query - its fast our works
-- index - its maintain separte table using btree behind the scene 

CREATE INDEX name_index ON employee(emp_name);
SHOW INDEX FROM employee;

-- delete index also by using alter

ALTER TABLE employee
DROP INDEX name_index;

-- we can add also
ALTER TABLE employee
ADD INDEX(emp_name);




 


 
