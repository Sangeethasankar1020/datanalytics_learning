-- Foreign Key 
USE logicfirst;

-- DROP TABLE employee;
-- creating branch table first
 
CREATE TABLE branch (
branch_id INT PRIMARY KEY AUTO_INCREMENT,
br_name VARCHAR(30) NOT NULL,
addr VARCHAR(200) );

-- drop branch 
-- DROP TABLE branch;


 -- creating employee table

CREATE TABLE employee (
emp_id INT PRIMARY KEY,
ename VARCHAR(30),
job_desc VARCHAR(20),
salary INT,
branch_id INT,
CONSTRAINT FK_branchId FOREIGN KEY(branch_id) REFERENCES branch(branch_id));


-- drop fk 
ALTER TABLE employee
DROP FOREIGN KEY FK_branchId;

