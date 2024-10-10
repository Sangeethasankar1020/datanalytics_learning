-- WINDOW FUNCTION (REMAINING PARTS)..
use hr;
select salary from employees;
select first_name, salary, first_value(salary) over(order by salary desc) from employees;
select first_name, salary, last_value(salary) over(order by salary desc) from employees; -- It is not working like first_value() w/ OB format

-- Unbounded preceding (start), Unbounded following (end)
select first_name, salary, last_value(salary) over(order by salary desc rows between unbounded preceding and unbounded following)
from employees;
select first_name, salary, sum(salary) over(rows between unbounded preceding and current row) from employees;
select first_name, salary, sum(salary) over(rows between 1 preceding and 1 following) from employees;

-- NTILE() TOPICS..
select first_name, ntile(12)over() bucket from employees; -- Normal ntile()
select first_name, salary,ntile(3)over(order by salary desc) bucket from employees; -- Another way
select*from employees;
-- Top paid employee in IT department
select first_name, job_id,salary,ntile(3)over(order by salary desc) from employees where job_id = 'IT_PROG';
-- List moderate earners from department sales and marketing
select * from
(select first_name,department_name,salary, ntile(3)over(partition by d.department_id order by salary desc) rnk from employees e 
join departments d on e.department_id = d.department_id where department_name in ("sales","marketing")) temp where rnk = 2;

-- INTERVIEW QUESTION...
create database kk;
create table k(id int,val int);
insert into k values(1,10),(2,11),(3,12),(4,13),(5,14),(6,15),(7,16);
select id, val from k;
select id,val,
case when id<4 then null
else
sum(val) over(rows between 3 preceding and 1 preceding) 
end output from k; 

-- TODAY WE COVERED PK, FK, REFERENCES, CASCADE, DELETE RESTRICTION...


