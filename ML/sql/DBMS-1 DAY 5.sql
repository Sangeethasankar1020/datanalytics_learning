select * from employees;
-- JOINS TOPICS
select concat(first_name,last_name) as full_name, job_title, salary, max_salary, max_salary - salary as diff_sal from employees e
join jobs j on e.job_id = j.job_id where (max_salary-salary) < 1000;
-- Detail of person in london.
select first_name, salary from employees e join departments d 
on e.department_id = d.department_id 
join locations l on d.location_id = l.location_id 
where city = 'london';
-- who is earning less than 182.
select e1.first_name, e1.salary from employees e1
join employees e2 on e1.salary < e2.salary where e2.employee_id = 182;
-- Who is manager and employees.
select e1.first_name as emp_name, e2.first_name as mng_name from employees e1 
join employees e2 on e1.manager_id=e2.employee_id;

select d.department_id,department_name, avg(salary) as avg_sal, count(employee_id) as emp_cnt from employees e
join departments d on e.employee_id=d.department_id group by department_name, d.department_id;
-- Employee who is working more than 35 years.
select department_name,first_name,salary, round(datediff(current_date(),hire_date)/365,0) as tenure 
from departments d join employees e on d.manager_id = e.employee_id 
where round(datediff(current_date(),hire_date)/365,0)>35;