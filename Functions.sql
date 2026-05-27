### 05/21/2026

# SQL NOTES - Math Operations, Date Functions,
# String Functions, Subqueries, Bridge Table,
# CTE, Joins, Cardinality
# ============================================================

USE training_db;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE,
    city VARCHAR(50)
);

INSERT INTO employees
(employee_id, employee_name, department, salary, joining_date, city)
VALUES
(1, 'Anu', 'IT', 65000.50, '2023-01-15', 'Dallas'),
(2, 'Ravi', 'HR', 52000.75, '2022-06-10', 'Chicago'),
(3, 'Meena', 'IT', 78000.25, '2021-03-20', 'Dallas'),
(4, 'Kiran', 'Finance', 60000.00, '2024-02-05', 'New York');


USE training_db;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE,
    city VARCHAR(50)
);

INSERT INTO employees
(employee_id, employee_name, department, salary, joining_date, city)
VALUES
(1, 'Anu', 'IT', 65000.50, '2023-01-15', 'Dallas'),
(2, 'Ravi', 'HR', 52000.75, '2022-06-10', 'Chicago'),
(3, 'Meena', 'IT', 78000.25, '2021-03-20', 'Dallas'),
(4, 'Kiran', 'Finance', 60000.00, '2024-02-05', 'New York');

SELECT * FROM employees;

USE training_db;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE,
    city VARCHAR(50)
);

INSERT INTO employees
(employee_id, employee_name, department, salary, joining_date, city)
VALUES
(1, 'Anu', 'IT', 65000.50, '2023-01-15', 'Dallas'),
(2, 'Ravi', 'HR', 52000.75, '2022-06-10', 'Chicago'),
(3, 'Meena', 'IT', 78000.25, '2021-03-20', 'Dallas'),
(4, 'Kiran', 'Finance', 60000.00, '2024-02-05', 'New York');

SELECT * FROM employees;
USE training_db;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE,
    city VARCHAR(50)
);

INSERT INTO employees
(employee_id, employee_name, department, salary, joining_date, city)
VALUES
(1, 'Anu', 'IT', 65000.50, '2023-01-15', 'Dallas'),
(2, 'Ravi', 'HR', 52000.75, '2022-06-10', 'Chicago'),
(3, 'Meena', 'IT', 78000.25, '2021-03-20', 'Dallas'),
(4, 'Kiran', 'Finance', 60000.00, '2024-02-05', 'New York');

SELECT * FROM employees;

---------------------------------
# 1. SELECT
# SELECT is used to fetch data from a table.

# Fetches all columns and rows.
SELECT *
FROM employees;

# Fetches only selected columns.
SELECT employee_name, salary
FROM employees;

# 2. MATH OPERATIONS
# Math operations are used to calculate values.

# Addition
# Adds 5000 bonus to salary.
SELECT employee_name,
       salary,
       salary + 5000 AS updated_salary
FROM employees;

# Subtraction
# Deducts 2000 from salary.
SELECT employee_name,
       salary,
       salary - 2000 AS reduced_salary
FROM employees;

# Multiplication
# Calculates yearly salary.
SELECT employee_name,
       salary,
       salary * 12 AS yearly_salary
FROM employees;

# Division
# Divides salary into half.
SELECT employee_name,
       salary,
       salary / 2 AS half_salary
FROM employees;

# 3. POWER FUNCTION
# POWER() raises a number to a power.



# POWER() raises a number to a specified power.
# It is useful for mathematical calculations and analytics.
# Example: POWER(2,3) means 2 × 2 × 2 = 8.


# Calculates square of salary.
SELECT employee_name,
       salary,
       POWER(salary, 2) AS salary_square
FROM employees;

# 4. MODULUS FUNCTION [MOD]
# MOD() gives remainder after division.


# MOD() returns the remainder after division.
# It is mainly used to identify even/odd numbers.
# Useful in validations and conditional calculations.


# Finds remainder after dividing employee_id by 2.
SELECT employee_id,
       employee_name,
       MOD(employee_id, 2) AS remainder
FROM employees;

# Finds even employee IDs.
SELECT employee_id,
       employee_name
FROM employees
WHERE MOD(employee_id, 2) = 0;

# 5. CEIL / CEILING FUNCTION
# CEIL() rounds number upward.

# CEIL() rounds a decimal number upward to the next whole number.
# Even if the decimal value is very small, it rounds to higher value.
# Mostly used in billing and quantity calculations.

# Rounds salary upward.
SELECT employee_name,
       salary,
       CEIL(salary) AS rounded_salary
FROM employees;

# 6. ROUND FUNCTION
# ROUND() rounds a number to required decimal places.

# ROUND() rounds a number to required decimal places.
# It is useful when displaying accurate financial or decimal data.
# Helps in simplifying decimal values for reports

# Rounds salary to 0 decimal places.
SELECT employee_name,
       salary,
       ROUND(salary, 0) AS rounded_salary
FROM employees;

# Rounds number to 2 decimal places.
SELECT ROUND(123.4567, 2) AS rounded_value;

# 7. DATE FUNCTION
# DATE() extracts only date part.


# Displays current date.
SELECT CURRENT_DATE();

# Extracts date from datetime.
SELECT DATE('2024-03-15 10:30:45') AS only_date;

# 8. MONTH FUNCTION
# Used to check month from date.

# MONTH() returns the month number from a date.
# MONTHNAME() returns the name of the month.
# Useful for monthly reports and date analysis.

# Displays month number and month name.
SELECT employee_name,
       joining_date,
       MONTH(joining_date) AS month_number,
       MONTHNAME(joining_date) AS month_name
FROM employees;

# Finds employees joined in January.
SELECT employee_name,
       joining_date
FROM employees
WHERE MONTH(joining_date) = 1;

# 9. DAY FUNCTION
# Used to find day from a date.

# DAY() returns the day number from a date.
# DAYNAME() returns the weekday name.
# Useful for attendance, scheduling, and reporting systems.

# Displays day number and day name.
SELECT employee_name,
       joining_date,
       DAY(joining_date) AS day_number,
       DAYNAME(joining_date) AS day_name
FROM employees;


# 10. DATE_ADD FUNCTION
# Adds days/months/years to a date.

# DATE_ADD() adds days, months, or years to a date.
# It helps calculate future or expiry dates.
# Commonly used in scheduling and due-date calculations.

# Adds 30 days to joining_date.
SELECT employee_name,
       joining_date,
       DATE_ADD(joining_date, INTERVAL 30 DAY) AS future_date
FROM employees;

# Adds 2 months.
SELECT DATE_ADD('2024-01-01', INTERVAL 2 MONTH);

# 11. DATE_FORMAT FUNCTION
# Changes display format of date.

# DATE_FORMAT() changes the display format of a date.
# It does not modify the original stored value.
# Mainly used for better readability in reports.


# Displays date in DD-MM-YYYY format.
SELECT employee_name,
       joining_date,
       DATE_FORMAT(joining_date, '%d-%m-%Y') AS formatted_date
FROM employees;

# Displays month and year.
SELECT DATE_FORMAT(joining_date, '%M %Y')
FROM employees;

# 12. UPDATE
# UPDATE modifies existing records.
# Always use WHERE condition carefully.


# UPDATE is used to modify existing records in a table.
# Always use WHERE condition carefully to avoid updating all rows.
# Commonly used for correcting or changing stored data.


# Updates salary for employee_id 1.
UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 1;

# Updates city.
UPDATE employees
SET city = 'Memphis'
WHERE employee_id = 2;

############### 13. STRING FUNCTIONS
# Used to work with text data.

# UPPER() converts text to uppercase.
SELECT employee_name,
       UPPER(employee_name) AS uppercase_name
FROM employees;

# LOWER() converts text to lowercase.
SELECT employee_name,
       LOWER(employee_name) AS lowercase_name
FROM employees;

# LENGTH() gives number of characters.
SELECT employee_name,
       LENGTH(employee_name) AS name_length
FROM employees;

# CONCAT() combines strings.
SELECT CONCAT(employee_name, ' - ', department) AS details
FROM employees;

# SUBSTRING() extracts part of string.
SELECT employee_name,
       SUBSTRING(employee_name, 1, 3) AS short_name
FROM employees;

# REPLACE() replaces characters.
SELECT employee_name,
       REPLACE(employee_name, 'a', '@') AS replaced_name
FROM employees;

# LIKE operator searches patterns.
SELECT employee_name,
       city
FROM employees
WHERE city LIKE 'D%';

########### 14. SUBQUERY
# A query within a query and used to select some data[particular column/fetch particular data]

# 14.1 SUBQUERY IN WHERE CLAUSE
# Used for filtering.

# Used for filtering records based on another query result.
# Inner query executes first and passes result to outer query.
# Commonly used in conditional filtering.


# Finds employees earning more than average salary.
SELECT employee_name,
       salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

# Inner query calculates average salary.
# Outer query compares employee salary with average.

# 14.2 SUBQUERY IN SELECT STATEMENT
# Used as a column in SELECT.

# Subquery can also be used as a column in SELECT statement.
# It helps display calculated or summary values with each row.
# Useful for comparisons and analytics.

# Displays employee salary along with average salary.
SELECT employee_name,
       salary,
       (SELECT AVG(salary) FROM employees) AS average_salary
FROM employees;

# 14.3 DERIVED TABLE
# Temporary table created inside FROM clause.

# A derived table is a temporary table created using subquery.
# It is written inside the FROM clause.
# Helps simplify complex calculations and filtering.

# Finds departments with average salary > 55000.
SELECT department,
       avg_salary
FROM (
    SELECT department,
           AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
) AS dept_avg
WHERE avg_salary > 55000;

# 14.4 CORRELATED SUBQUERY
# Inner query depends on outer query.


 A correlated subquery depends on the outer query.
# Inner query executes once for every row of outer query.
# Used when comparing row-wise data dynamically.

# Finds employees earning above department average.
SELECT e.employee_name,
       e.department,
       e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department = e.department
);

# 15. CTE
# CTE = Common Table Expression
# Makes queries easier to read.

WITH dept_avg AS (
    SELECT department,
           AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM dept_avg
WHERE avg_salary > 55000;
