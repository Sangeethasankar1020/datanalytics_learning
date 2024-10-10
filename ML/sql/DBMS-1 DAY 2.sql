use hr;
-- Arthimetic Operations
-- bonus calculations ( AS keyword for Alias)
show tables;
select employee_id, first_name, salary, salary*0.1 as bonus from employees;
select * from employees where salary*0.1 > 1000;
select first_name, salary*12 as annual_salary from employees where department_id = 80;
-- Even without AS we can assign column name or with double quotes("")
-- Null value nullify the values
select employee_id, first_name, salary, commission_pct, salary*commission_pct as commission_value,
salary + salary*ifnull(commission_pct,0) as Total_salary from employees;
-- ifnull(exp1,0)
-- Tell employees who joined in 1994
select employee_id, hire_date from employees where hire_date >= '1994-01-01' and hire_date <= '1994-12-31';
-- list all IT programmer
select first_name, job_id from employees where job_id like 'IT%';
select distinct department_id from employees;
select * from employees where department_id = 90;
select department_id, hire_date from employees where first_name in ('neena','bruce');
select * from employees where manager_id is null;
select * from employees where job_id like 'clerk' or salary > 4000;
-- list employees whose salary > 10000 and dept in both 80,90
select * from employees where (department_id = 80 or department_id = 90) and salary>10000;
-- List employees who doesn't work in dept 70,80,90
select * from employees where department_id not in (70,80,90);
-- ORDER BY - Ordering it in either ascending(ASC) or descending(DESC)
select employee_id, first_name, department_id, salary from employees order by department_id;
select employee_id, first_name, department_id, salary from employees order by department_id asc, salary desc;
-- We can give position number in order by to be clear
select first_name,department_id,hire_date from employees where department_id is not null
order by 2,3;
-- Display first name, last name where last name should contain 'li' and first name in asc
select first_name,last_name from employees where last_name like '%LI%' order by first_name asc;
-- LIMIT function is to limit rows we get in o/p
-- LIMIT 0,2 gives start,stop
select * from employees limit 3;
select * from employees where job_id like '%IT%' order by salary desc limit 1,1;
-- Functions in SQL
select round(456.345,0);
select truncate(456.444);
select floor(504.668);
select ceil(675.382);
select mod(10,3);
select sqrt(25);
select pow(3,2);
-- Functions example in SQL
select salary, round(salary) as sal from employees; 
select upper(first_name) as up from employees;
select lower(last_name) as low from employees;
select length(first_name) as len from employees  limit 5;
select concat(first_name," ",last_name) as emp_name from employees;
select substr('kishore',1,4); -- starts from 1 to infinity
select instr('kishore','e'); -- Letter can be identified where it is
select lpad(salary,10,'$') from employees;
select rpad(salary,10,"*") from employees;
select length(trim('   kishore '));
select trim('m' from 'madam');
select trim(Trailing 'M' from 'MADAM'); -- leading(last) and trailing(first)
select employee_id, concat(first_name,last_name) as emp_nam,job_id, length(last_name) as len_lname,
instr(last_name,'a') as pos_a from employees
where job_id like '%REP%' and last_name like '%a';
-- Date Functions
select current_date(); 
select current_time();
select now();
select utc_timestamp();
select year(current_date());
select month(current_date());
select day(current_date());
select first_name, round(datediff(current_date(), hire_date)/365,0) as experience from employees;