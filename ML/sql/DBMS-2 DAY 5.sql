-- ACID (Atomicity, Consistency, Isolation, durability)..

-- Autocommit, rollback..
create database if not exists Trans;
use trans;
create table T(
id int,
transact int);

select * from t;
truncate table t;

rollback;
start transaction;
insert into t value(1,1000),(2,2000);
commit;

##############################################################################################
-- VIEWS TOPICS..
create view v1 as
select employee_id, first_name, department_id, salary from employees where department_id = 80;
select * from v1;
desc v1;
update v1 set department_id = 100 where employee_id = 145; -- Permanently changes the data
select * from employees;
-- There are types of views Simple view, Complex view, Horizontanl view, Vertical view, Inline view, Materialized view, Grouped view...

-- NORMALIZATION TOPIC..
-- Types are, 1NF, 2NF, 3NF, 4NF..


