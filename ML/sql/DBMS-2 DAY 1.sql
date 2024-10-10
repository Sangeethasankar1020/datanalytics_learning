select e.first_name, e.employee_id, e.department_id, d.department_name from employees e join departments d
on e.department_id = d.department_id where department_name = 'sales';  -- Using(department_id) DIFFERENT APPROACH

select e.salary from employees e join departments d
on e.department_id = d.department_id
where first_name = 'neena';

-- SUB QUERY IN SQL

select employee_id, first_name, department_id from employees where department_id = 
(select department_id from departments where department_name = 'sales');

select * from employees where salary = 
(select salary from employees where first_name = 'neena');

-- Who are all getting more than avg salary ?
select employee_id, first_name, salary from employees where salary >
(select avg(salary) from employees);  
-- How many of them are working under PAYAM ?
select * from employees where manager_id =
(select employee_id from employees where first_name = 'payam');

-- normal way with joins for the above question
select e1.* from employees e1 join employees e2
on e1.manager_id = e2.employee_id
where e1.first_name = 'payam';
-- Who all joined the company with CLARA ?
-- Who all joined the company with CLARA ?
select * from employees where year(hire_date) =
(select year(hire_date) from employees where first_name = 'clara')
and first_name <> 'clara';

-- list all employees who are earning equal to neena and same designation of neena.
select * from employees where (salary, job_id) =
(select salary, job_id from employees where first_name = 'neena');

-- Another way
select * from employees where salary =
(select salary from employees where first_name = 'neena') and job_id = 
(select job_id from employees where first_name = 'neena');

-- second max salary
select max(salary) from employees where salary <
(select max(salary) from employees);

-- second max salary with their details
select * from employees where salary =
(select max(salary) from employees where salary <
(select max(salary) from employees));

-- display employee id, first name, salary, dept name and city for all employees 
-- who gets salary more than maximum salary earn by employee who joined in year 1997.
select employee_id, first_name, salary, department_name, city from employees e join departments d
on e.department_id = d.department_id join locations l 
on d.location_id = l.location_id where e.salary >
(select max(salary) from employees where year(hire_date) = 1997);

-- Display first name, salary, department id for those employees who earn less than avg salary of laura's dept.
select first_name, salary, department_id from employees where salary <
(select avg(salary) from employees where department_id =
(select department_id from employees where first_name = 'laura')); 

-- list all employees earning equal to david.
select * from employees where salary in
(select salary from employees where first_name = 'david');

-- list all employees earning more than all david's.
select * from employees where salary > all                       -- (ALL) function used here for listing all employees  
(select salary from employees where first_name = 'david');

-- list all employees earning more than any one of the david.
select * from employees where salary > ANY
(select salary from employees where first_name = 'david');

-- list employees who are earning min salary compared to any of the other depts.
select * from employees where salary in 
(select min(salary) from employees group by department_id);

-- list dept name if atleast one employee is working.
select department_name from departments where department_id not in
(select distinct department_id from employees where department_id is not null);

-- Write all manager name.
select employee_id, first_name, manager_id from employees where employee_id in
(select manager_id from employees where manager_id is not null);  

-- list all employees belong to location 1700.
select * from employees e join departments d
on e.department_id = d.department_id where location_id = 1700; -- Using joins method

select * from employees where department_id in                  -- Using subquery method
(select department_id from departments where location_id = 1700);