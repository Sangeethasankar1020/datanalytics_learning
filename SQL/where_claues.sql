-- creating new table
USE logicfirst;

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

SELECT * FROM employee;