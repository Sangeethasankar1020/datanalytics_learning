select department_id, max(salary) as max_dept_sal from employees group by department_id having max_dept_sal > 5000; 
select department_id, count(employee_id) as em from employees group by department_id having em > 5 ;
select department_id, count(employee_id) as emm from employees group by department_id having department_id in (30,80,90); 
-- Both above and below differ.. How ?
select department_id, count(employee_id) as emmm from employees where department_id in (30,80,90) group by department_id; 
-- Answer : formats are (select from where group by) , (select from  where group by having)
-- WHERE gives simple overall filter / GROUP BY HAVING gives particular filter..
-- TYPES OF JOINS
select e.first_name, e.department_id, e.salary, d.department_name from employees as e inner join departments as d
on e.department_id = d.department_id; 

select e.first_name, d.department_id, d.department_name, l.city, l.state_province from employees as e join departments as d
on e.department_id = d.department_id join locations as l on d.location_id = l.location_id; 

select first_name, last_name, e.department_id, department_name from employees as e join departments as d 
on e.department_id = d.department_id where e.department_id in (80,40);

select department_id, department_name from departments;

select distinct e.department_id, department_name from employees as e join departments as d 
on e.department_id = d.department_id;