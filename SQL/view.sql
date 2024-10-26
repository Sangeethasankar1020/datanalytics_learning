-- views
 USE logicfirst;
 
 SELECT * FROM employee;
 SELECT * FROM branch;
 --  creating view
 
CREATE VIEW emp_br
AS
SELECT employee.emp_id,employee.ename,employee.job_desc,branch.br_name
FROM employee
INNER JOIN branch
ON employee.branch_id=branch.branch_id
ORDER BY emp_id;

-- view
SELECT * FROM emp_br; -- selecting all rows from view

DROP VIEW emp_br; -- delete view

CREATE OR REPLACE VIEW emp_br  -- modify view
AS 
SELECT employee.emp_id,employee.ename,employee.job_desc,branch.br_name
FROM employee
INNER JOIN branch
ON employee.branch_id=branch.branch_id;



 
