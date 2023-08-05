CREATE DATABASE dbname;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    department VARCHAR(50)
);

/*Insert Data into Table*/
INSERT INTO employees (employee_id, first_name, last_name, hire_date, department)
VALUES (1, 'John', 'Doe', '2023-01-15', 'IT');

/*Updating Data from Table*/
UPDATE employees
SET department = 'HR'
WHERE employee_id = 2;

/*Delete Data from Table*/
DELETE FROM employees
WHERE employee_id = 3;
CREATE INDEX idx_employee_lastname
ON employees (last_name);

/*Check table Size then find duplicate records*/
SELECT COUNT(*) AS row_count
FROM employees;
SELECT first_name, last_name, COUNT(*) as occurrences
FROM employees
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;

/*Checking Permissions*/
SHOW GRANTS FOR user_name;

/*Backup and Restore Procedure*/
mysqldump -u username -p dbname > backup.sql
mysql -u username -p dbname < backup.sql
