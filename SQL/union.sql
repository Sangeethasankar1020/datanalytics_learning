-- union 
USE logicfirst;

-- creating client table similar to branch table
CREATE TABLE clients (
client_id INT PRIMARY KEY AUTO_INCREMENT,
location VARCHAR(30) NOT NULL,
addr VARCHAR(200) );

INSERT INTO clients VALUES(1,"NewYork","25 10th Block");
INSERT INTO clients VALUES(2,"Coimbatore","120 15th Block");
INSERT INTO clients VALUES(3,"London","21 ABC Road");

-- combines the two tables removing duplicates
SELECT * FROM branch
UNION 
SELECT * FROM clients;

-- combines the two tables without removing duplicates
SELECT * FROM branch
UNION ALL
SELECT * FROM clients;











