create database employ;
use employ;
show tables;

-- DDL COMMENTS (Structure level work)
create table emp
(empid int,empname varchar(20),age tinyint,dept varchar(20));
desc emp;
alter table emp add column salary float; 
alter table emp add column id int first;
alter table emp add column desig varchar(20) after age;
alter table emp drop column desig;
alter table emp modify column empid varchar(5);
alter table emp rename column id to emp_id ;
alter table emp change column name emp_name varchar(20);
alter table emp drop column emp_id;

-- DML COMMENTS (Data level work)
insert into emp values(100,"kishore",20,"BA",70000);
insert into emp values(101,"sai",21,"DA",50000);
set sql_safe_updates = 0;
delete from emp where emp_id = 101;
update emp set empname = 'Narayanan' where emp_id = 100;
insert into emp values(101,'sai',22,'analyst',560000);
update emp set dept = null where emp_id = 101;
select*from emp;
