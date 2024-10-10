-- Adddate(), Subdate() used to add or sub dates
select first_name, hire_date, adddate(hire_date,interval 3 month) as prob_date from employees;
select first_name,hire_date,subdate(hire_date,interval 1 year) as sub_date from employees;
select date_format(hire_date,'%D-%M-%Y') from employees; -- case sensitive for D.M.Y
select str_to_date('12-02-2003','%d-%m-%Y');
select str_to_date('30 08 2023','%d %m %Y'); -- insert same format for str to date
-- CONDITIONAL (OR) CONTROL STATEMENT
select if(mod(10,2)=0, 'True', 'False');     -- IF()
select first_name, salary, if(salary>10000,'Good pay','Ok pay') as salary_tag from employees;
select first_name, ifnull(commission_pct,0.1) from employees;    -- IFNULL()
select first_name, salary, if(commission_pct is null,0.1,commission_pct) as pct from employees;
select nullif(25,25); -- if arg is equal it gets True (null) otherwise False
select nullif(25,30); -- if arg is False it gets first arg
select first_name, job_id, if(job_id='IT_PROG',null,job_id) as revised_jobid from employees;
select employee_id, first_name, department_id, salary, nullif(commission_pct,0) commission_pct 
from employees where department_id in (80,90);      -- NULLIF()
-- CASE STATEMENTS
select first_name,salary, 
case
when salary >= 20000 then 'good package'
when salary between 18000 and 19999 then 'moderate'
when salary between 15000 and 17999 then 'average'
when salary between 10000 and 14999 then 'ok'
else 'bad'
end salary_tag from employees;
-- EXAMPLE OF NEW LEARNING - (UNIQUE, NOT NULL, PRIMARY KEY, DEFAULT)...
create table author(id int primary key, name varchar(10) not null default 'Mr.X',
country varchar(10) not null check (country in ('USA','UK','UAE')),
page int check(page > 0),
email varchar(15) unique);
desc author;
insert into author values(100,'kishore','UK',10,'xyz@gmail.com');
select * from author;
drop table author;
-- SET OPERATIONS
select department_id from employees; -- Table 1 
select department_id from departments; -- Table 2
select department_id from employees
union all
select department_id from departments; -- USE THIS FORMAT FOR ALL SET OPERATIONS
-- EXAMPLE STAR PROGRAM IN SQL
select "*" 
union 
select "* *"
union 
select "* * *";
-- AGGREGATE FUNCTION
-- count(),min(),max(),avg()
select min(salary), max(salary), avg(salary), count(*) from employees;
select count(*) from employees;
select count(commission_pct) from employees; -- It will not count NULL values
select count(ifnull(commission_pct,0)) from employees; -- Contains NULL values as well
select department_id, max(salary) from employees group by department_id;
-- Which dept has more salary
select department_id , avg(salary) as avg_sal from employees group by department_id
order by avg_sal desc limit 1;
-- How many employees work in each dept
select department_id,count(employee_id) from employees group by department_id;

select department_id, count(*) as tot,
case
when count(employee_id) = 1 then 'junior dept'
when count(employee_id) in (2,3) then 'moderate dept'
when count(employee_id) > 3 then 'senior dept'
end dept_tag from employees group by department_id;
select * from employees;
select job_id, count(employee_id) from employees group by job_id having count(employee_id)>=20; 