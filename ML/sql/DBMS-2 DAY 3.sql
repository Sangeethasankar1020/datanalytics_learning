# List those depts who are having avg salary more than the avg salary of department 80.
select e.department_id, department_name, avg(salary) from employees e
join departments d on e.department_id = d.department_id group by department_name, department_id having avg(salary) > 
(select avg(salary) from employees where department_id = 80);
-- or 
select department_id, department_name, round(avg(salary),2) avg_sal from employees e join
departments d using (department_id) group by 1,2 
having avg_sal > (select avg(salary) from employees where department_id = 80);
 
-- We used join, group by, having, subquery, where...alter

-- WINDOW FUNCTION
-- row_number()over() -- It creates a row number for all...
select row_number()over() as 'S.No', employee_id, first_name from employees;
select row_number()over() as 'S.No', employee_id, first_name from employees;
-- Using with function.. 
with temp as
(select row_number() over() as S, employee_id, first_name from employees)
select * from temp;
-- or
with temp as (select row_number()over() as 'S.No', employee_id, first_name as name from employees)
select * from temp;
-- Want only row no. from 10 and 20.
with T as
(select row_number() over() as 'S.no', employee_id, first_name from employees)
select * from T where `S.no` between 10 and 20;
-- or
with temp as 
(select row_number() over() 'S.no', employee_id, first_name name from employees)
select * from temp limit 10,10; 

-- RANK() TOPIC...
-- Who is the earner earning high salary.
select employee_id, first_name, salary, rank() over(order by salary desc) rnk from employees;

-- Who earns 2nd highest salary.
select * from
(select first_name,salary,rank() over(order by salary desc) rnk from employees) temp
where rnk = 2;

--  DENSE_RANK() TOPIC
select dense_rank() over(order by salary desc) drnk,salary, employee_id, first_name from employees;

-- CUME_DIST() TOPIC
select cume_dist() over(order by salary) 'C.D' ,first_name, employee_id from employees;

-- DENSE_RANK() and PARTITION BY TOPIC
select * from
(select employee_id, first_name, salary, department_id, 
dense_rank() over(partition by department_id order by salary desc) rnk
from employees) temp;

select * from (select employee_id,first_name, salary, department_id,
dense_rank()over(partition by department_id order by salary desc) rnk from employees)
temp;
-- partition by - It will give multiple outputs eg.different flavour and how many biscuits.. 
 
select employee_id, first_name, sum(salary) from employees group by employee_id; -- It will not work in group by

select department_id, employee_id, first_name, sum(salary) 
over(partition by department_id) tot_sal from employees;

-- normal correlation method of first hired employee
select * from employees e where hire_date =
(select min(hire_date) from employees where department_id = e.department_id group by department_id);
select * from employees e where hire_date = 
(select min(hire_date) from employees);
-- another method
select * from employees where (department_id,hire_date) in
(select department_id, min(hire_date) from employees group by department_id);
-- partition by method
select * from
(select *, min(hire_date) over(partition by department_id) min_date from employees) temp where hire_date = min_date;

-- List all employee who are recently/junior in sales and marketing
select * from
(select e.*,max(hire_date) over(partition by department_id) recent_date from employees e join departments d 
on e.department_id = d.department_id where department_name in ('sales','marketing'))temp where hire_date=recent_date;

-- LEAD() & LAG() TOPICS -- multiple o/p 
-- lead will check eg.salary if there is a change(should not decrease) it will give in order..
-- lag will check eg.temperature if there is a change(should not increase) it will give in order..
select*from job_history;
select *, lead(salary) over() from employees;
select *, lag(salary) over() from employees;
-- list employee id, first desig, promoted desig.
select * from
(select employee_id, job_id first_job, start_date first_jod_date,
lead(job_id)over(partition by employee_id order by start_date) promoted_job,
lead(start_date)over(partition by employee_id order by start_date) promoted_date
 from job_history )t
 where promoted_job is not null;
 
 select * from job_history;
