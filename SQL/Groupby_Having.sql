-- Group by and Order 

USE logicfirst;

SELECT * FROM employee
ORDER BY job_desc;

-- want to know average salary of job_description

SELECT job_desc,AVG(salary)
FROM employee
GROUP BY job_desc;

-- want know how many members working in job
-- we can also count by job_decription , better we can count by primary key
-- its better  use aggregate functions whe we use group  by
 
SELECT job_desc,COUNT(emp_id)  AS Member
FROM employee
GROUP BY job_desc;

--  when we want to filter in group by function  using having functions

SELECT job_desc,COUNT(emp_id)  AS Member
FROM employee
GROUP BY job_desc
HAVING COUNT(emp_id)>1
ORDER BY job_desc; -- alphabets order sort , Always order by - use in last 

-- where filters rows 
-- having filters groups

SELECT job_desc,COUNT(emp_id)  AS Member
FROM employee
WHERE salary>20000
GROUP BY job_desc
HAVING COUNT(emp_id)>0
ORDER BY job_desc; 








