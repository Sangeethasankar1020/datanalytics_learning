-- CORRELATED SUBQUERY
-- Display employee details if he is earning more than the avg salary of his or her own department.
select * from employees o where salary > (select avg(salary) from employees i where i.department_id=o.department_id);

#MANI WAY...
select * from employees O where salary >
(select avg(salary) from employees I where O.department_id = I.department_id);

-- EXISTS OPERATOR
select * from employees e where exists
(select * from employees where e.department_id=80);
 
 select * from employees e where exists (select * from employees where e.department_id=80);
 -- or 
 select * from employees where department_id=80;
 -- display the department details where atleast one employee works
select * from departments where exists
(select department_id from employees);
-- OR
select department_id, department_name from departments corr where exists
(select * from employees where department_id = corr.department_id);         -- Using EXISTS & CORR
 
 -- Dept ID & Dept Name of all departments that has at least one employee with salary greater than 10000
 -- solve using in / exists oprator.
 select department_id, department_name from departments where department_id 
 in (select department_id from employees where salary > 10000);
 select department_id, department_name from departments where department_id in
 (select department_id from employees where salary > 10000); -- IN OPERATOR
 
select department_id, department_name from departments corr where exists
(select department_id from employees where department_id=corr.department_id and salary > 10000); -- EXISTS OPERATOR

select department_id, department_name from departments corr where department_id =
(select distinct department_id from employees where salary>10000 and department_id=corr.department_id); -- = & CORR OPERATOR
 
 -- List the name of manager
 select first_name from employees corr where employee_id =
 (select distinct manager_id from employees where manager_id=corr.employee_id);
 -- or-- = & CORR OPERATOR
 select first_name from employees o where employee_id in
 (select distinct manager_id from employees);
 -- when we use ( = ) we need to give distinct or we can change it as ( IN )  
 
 -- USE EXIST FOR THIS Q
 select first_name from employees o where exists
 (select*from employees where manager_id = o.employee_id);
 
 -- Which department_id, avg_salary has the highest avg salary
 select department_id, avg(salary) avg_sal from employees group by department_id 
 order by avg_sal desc limit 1;-- Normal answer

 -- Display dept name in which you have highest employee count
 select department_name, count(employee_id) cnt from employees e
 join departments d on e.department_id = d.department_id group by department_name having cnt >= all
 (select count(employee_id) cnt from employees group by department_id);
 -- or
 select department_name, count(employee_id) cnt from employees e
 join departments d on e.department_id = d.department_id group by department_name 
 order by cnt desc limit 1;
 -- SUBQUERY IN SELECT CLAUSE
 select count(employee_id),
 (select count(department_id) from departments) cnt_dept from employees;

-- employee_id, first_name, dept id, dept name.
select employee_id, first_name, department_id,
(select department_name from departments where department_id=corr.department_id) dept_nm from employees corr; 

-- list emp name and manager name
select first_name emp_name,                                 -- Like self join using select subquery
(select first_name from employees where employee_id = corr.manager_id) mgr_name from employees corr;
 
 #Another Way Normally...
 select e1.first_name emp , e2.first_name mgr from employees e1 join employees e2
 on e1.manager_id = e2.employee_id;
 
 -- SUBQUERY IN FROM CLAUSE    
 -- Derived table/ Inline table
 select * from (select salary, salary*0.1 bonus from employees) temp where bonus>1000;
 --  CTE - Common Table Expression (INTERVIEW QUESTION)
 -- CTE using 'with' clause
 with temp as
 (select employee_id, salary, salary*0.1 bonus from employees)
 select * from temp where bonus > 1000; -- normally to use CTE expression
 
 -- count total manager and clerk 
select new_jobid , count(new_jobid) from
(select job_id,
case when job_id like '%mgr%' then 'manager'
else 'clerk' 
end new_jobid from employees
where job_id like '%mgr%' or job_id like '%clerk%') temp
group by new_jobid;

# USING SETS FUNCTION:-
select 'manager',count(*) from employees
where job_id like '%mgr%'
union
select 'clerks',count(*) from employees
where job_id like '%clerk%';

-- Select clause subquery to find job id for particular dept.
select department_id,job_id,count(job_id)cnt
from employees where department_id=80 group by job_id;

select department_id,job_id,count(*),
(select count(*) from employees where department_id = 80)total_cnt from employees where department_id = 80
group by department_id,job_id;

#using sets :-
select * from 
(select department_id,job_id,count(*) from employees where department_id = 80 
group by department_id,job_id)t1
cross join
(select count(*) total_cnt from employees where department_id =80) t2