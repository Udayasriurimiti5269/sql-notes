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

# 13. STRING FUNCTIONS
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

# 14. SUBQUERY
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




#####################   05/22/2026 #########################


# CARDINALITY

# Cardinality means the relationship between two tables.
# Usually it is based on Primary Key in one table and Foreign Key in another table.
# It tells how many records from one table can match records in another table.

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

######## 1-1 RELATIONSHIP #######

# One record in Table A is connected to only one record in Table B.
# Example: One person has one passport.

CREATE TABLE person (
    person_id INT PRIMARY KEY,
    person_name VARCHAR(50)
);

CREATE TABLE passport (
    passport_id INT PRIMARY KEY,
    person_id INT UNIQUE,
    passport_number VARCHAR(50),
    FOREIGN KEY (person_id) REFERENCES person(person_id)
);


# 1-MANY RELATIONSHIP

# One record in Table A can have many records in Table B.
# Example: One customer can place many orders.

SELECT 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers VALUES
(1, 'Ravi'),
(2, 'Anu'),
(3, 'Kiran');

INSERT INTO orders VALUES
(101, 1, 250.00),
(102, 1, 300.00),
(103, 2, 150.00);

SELECT 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

# MANY-1 RELATIONSHIP

# Many records in Table A belong to one record in Table B.
# Example: Many orders belong to one customer.
# This is the reverse view of one-to-many.

SELECT 
    o.order_id,
    o.order_amount,
    c.customer_name
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;

# MANY-MANY RELATIONSHIP

# Many records in Table A can connect with many records in Table B.
# Example: One student can take many courses, and one course can have many students.
# We need a bridge table to connect them.

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

# JOINS

# Joins are used to bring data from different tables.
# We join tables using common columns, mostly primary key and foreign key.

# INNER JOIN

# Inner join returns only matching records from both tables.
# Customers without orders will not appear.

SELECT 
    c.customer_name,
    o.order_id,
    o.order_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

# LEFT JOIN

# Left join returns all records from the left table.
# Matching records from the right table will be shown.
# If no match exists, NULL will be displayed.

SELECT 
    c.customer_name,
    o.order_id,
    o.order_amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

# RIGHT JOIN

# Right join returns all records from the right table.
# Matching records from the left table will be shown.
# If no match exists, NULL will be displayed.

SELECT 
    c.customer_name,
    o.order_id,
    o.order_amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;


############ FULL OUTER JOIN  ######


# Full outer join returns all records from both tables.
# Matching records are combined.
# Non-matching records from both sides show NULL.
# MySQL does not directly support FULL OUTER JOIN.
# So we use LEFT JOIN + RIGHT JOIN with UNION.

SELECT 
    c.customer_name,
    o.order_id,
    o.order_amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id

UNION

SELECT 
    c.customer_name,
    o.order_id,
    o.order_amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

# LEFT JOIN EXCLUDING INNER JOIN

# This returns only records from the left table that do not have matching records in the right table.
# Example: Customers who have not placed any orders.

SELECT 
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

# RIGHT JOIN EXCLUDING INNER JOIN

# This returns only records from the right table that do not have matching records in the left table.
# Example: Orders that do not have a matching customer.

SELECT 
    o.order_id,
    o.order_amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;


# FULL OUTER JOIN EXCLUDING INNER JOIN

# This returns only non-matching records from both tables.
# It excludes records that match in both tables.

SELECT 
    c.customer_name,
    o.order_id,
    o.order_amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL

UNION

SELECT 
    c.customer_name,
    o.order_id,
    o.order_amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

###### CROSS JOIN ######
# Cross join returns every possible combination between two tables.
# If customers has 3 rows and orders has 3 rows, output will be 9 rows.

SELECT 
    c.customer_name,
    o.order_id
FROM customers c
CROSS JOIN orders o;

#### # DIFFERENT TYPES OF JOINS BASED ON CARDINALITY
# 1-1 relationship:
# Use INNER JOIN or LEFT JOIN to combine exact matching records.

# 1-many relationship:
# Use INNER JOIN when you need only matching records.
# Use LEFT JOIN when you need all records from the main table.

# many-many relationship:
# Use bridge table and join all three tables.

# Example for many-many relationship

SELECT 
    s.student_name,
    c.course_name
FROM students s
JOIN student_courses sc
ON s.student_id = sc.student_id
JOIN courses c
ON sc.course_id = c.course_id;

INSERT INTO students VALUES
(1, 'Ravi'),
(2, 'Anu'),
(3, 'Kiran');

INSERT INTO courses VALUES
(101, 'SQL'),
(102, 'Python'),
(103, 'Data Science');

INSERT INTO student_courses VALUES
(1, 101),
(1, 102),
(2, 101),
(3, 103);

SELECT 
    s.student_name,
    c.course_name
FROM students s
JOIN student_courses sc
ON s.student_id = sc.student_id
JOIN courses c
ON sc.course_id = c.course_id;

######### CTE - COMMON TABLE EXPRESSION #########

# CTE means Common Table Expression.
# It creates a temporary result set that we can use inside the main query.
# It makes complex queries easy to read and reuse.
# Example: Find customers whose total order amount is greater than 300

WITH customer_total AS (
    SELECT 
        customer_id,
        SUM(order_amount) AS total_amount
    FROM orders
    GROUP BY customer_id
)
SELECT 
    c.customer_name,
    ct.total_amount
FROM customers c
JOIN customer_total ct
ON c.customer_id = ct.customer_id
WHERE ct.total_amount > 300;

# Explanation:
# First, the CTE calculates total order amount for each customer.
# Then, the main query joins that result with customers table.
# Finally, it filters customers whose total amount is greater than 300.


# ADVANTAGES OF CTE
# 1. Able to handle complexity:
# CTE breaks big queries into smaller readable parts.

# 2. Code reusability:
# The CTE result can be reused inside the main query.

# 3. Better readability:
# It makes SQL easier to understand compared to nested subqueries.


# DISADVANTAGES OF CTE

# 1. CTE exists only during query execution.
# It is not stored permanently in the database.

# 2. In some cases, CTE can be slower than temporary tables.
# Especially when the same CTE is used multiple times.

# 3. Beginners may find recursive CTE difficult at first.

# RECURSIVE CTE

# Recursive CTE means a CTE that calls itself.
# It is mainly used for hierarchical data.
# Example: Employee and manager relationship.
# Recursive CTE has two parts:
# 1. Anchor Member
# 2. Recursive Member

# Anchor Member:
# This is the starting point of the recursion.

# Recursive Member:
# This repeatedly calls the CTE until the condition stops.

CREATE TABLE employees_hierarchy (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees_hierarchy VALUES
(1, 'CEO', NULL),
(2, 'Manager A', 1),
(3, 'Manager B', 1),
(4, 'Employee A1', 2),
(5, 'Employee A2', 2),
(6, 'Employee B1', 3);


# Recursive CTE Example:
# Display employee hierarchy from CEO to employees.

WITH RECURSIVE employee_tree AS (
    
    # Anchor Member
    SELECT 
        employee_id,
        employee_name,
        manager_id,
        1 AS level
    FROM employees_hierarchy
    WHERE manager_id IS NULL

    UNION ALL

    # Recursive Member
    SELECT 
        e.employee_id,
        e.employee_name,
        e.manager_id,
        et.level + 1 AS level
    FROM employees_hierarchy e
    JOIN employee_tree et
    ON e.manager_id = et.employee_id
)
SELECT 
    employee_id,
    employee_name,
    manager_id,
    level
FROM employee_tree;

# Explanation:
# Anchor member selects the CEO because manager_id is NULL.
# Recursive member finds employees who report to the previous level.
# The query continues until no more employees are found.

############ MAIN DIFFERENCE BETWEEN SUBQUERY AND CTE  ################

# SUBQUERY
# 1. Query inside another query.
# 2. Harder to read when query becomes large.
# 3. Mostly used for small/simple conditions.
# 4. Cannot easily reuse multiple times.
# 5. Written inside WHERE, SELECT, or FROM.

# CTE
# 1. Temporary named result using WITH.
# 2. Easier to read and maintain.
# 3. Better for large and complex queries.
# 4. Can reuse the same CTE multiple times.
# 5. Written before main query.

####### WHY DO WE USE CTE?   ###########

# 1. Better Readability
# CTE breaks large query into smaller readable parts.

# 2. Easier Maintenance
# Complex SQL becomes easier to debug and modify.

# 3. Reusability
# Same temporary result can be used multiple times.

# 4. Recursive Queries
# CTE supports recursion for hierarchical data.

# 5. Replaces Nested Subqueries
# Makes deeply nested queries cleaner.






########### 05/25/2026  ############

# TEMPORARY TABLES
# Temporary tables are tables that exist only during the
# current session or until they are dropped manually.
# They are useful for storing intermediate results,
# calculations, or testing data temporarily.

# CREATE TEMPORARY TABLE
# TEMPORARY keyword creates a session-based table.
# The table automatically disappears after session ends.


CREATE TEMPORARY TABLE temp_employees (
    employee_id INT,
    employee_name VARCHAR(50),
    salary DECIMAL(10,2)
);

# Explanation:
# This creates a temporary table named temp_employees.
# It can be used like a normal table during the session.


###########  INSERT DATA INTO TEMPORARY TABLE  ##############
# Used to store temporary/intermediate data.

INSERT INTO temp_employees VALUES
(1, 'John', 50000),
(2, 'Sara', 65000);

# Explanation:
# Inserts temporary employee records into temp table.

##### VIEW TEMPORARY TABLE DATA

SELECT *
FROM temp_employees;

# Explanation:
# Displays all records from temporary table.


########### # DROP TEMPORARY TABLE
# Removes temporary table manually before session ends.

DROP TEMPORARY TABLE temp_employees;

# Explanation:
# Deletes temporary table permanently from current session.

############# VIEWS
# A view is a virtual table created using a SELECT query.
# It does not store data physically.
# Views are used to simplify complex queries and improve security.

# CREATE VIEW
# This creates a virtual table for recent rentals.

CREATE VIEW recent_rentals AS
SELECT rental_id,
       customer_id,
       rental_date
FROM rental
WHERE rental_date >= '2005-08-01';

# recent_rentals view stores query logic virtually.
# Data comes from rental table dynamically.

# DISPLAY VIEW DATA

SELECT *
FROM recent_rentals;

# Fetches records from virtual table/view.

####### UPDATE VIEW
# OR REPLACE updates existing view definition.

CREATE OR REPLACE VIEW recent_rentals AS
SELECT rental_id,
       customer_id,
       rental_date,
       inventory_id
FROM rental
WHERE rental_date >= '2005-08-01';

# Modifies existing view by adding inventory_id column.


# DROP VIEW
# Deletes the virtual table.

DROP VIEW recent_rentals;

# Explanation:
# Removes the view definition only.
# Original table data remains safe.

############ # STORED PROCEDURES
# Stored procedures are precompiled SQL programs stored
# inside the database.
# They help automate repeated tasks and improve performance.


######### TYPES OF PARAMETERS
# 1. IN      -> Input parameter
# 2. OUT     -> Output parameter
# 3. INOUT   -> Both input and output

######### IN PARAMETER PROCEDURE
# IN parameter accepts value from user.


DELIMITER //

CREATE PROCEDURE GetCustomerById (
    IN cust_id INT
)

BEGIN

    SELECT *
    FROM customer
    WHERE customer_id = cust_id;

END //

DELIMITER ;

# Explanation:
# Procedure accepts customer ID as input.
# Returns matching customer details.


########### CALL THE PROCEDURE ############

CALL GetCustomerById(5);

# Explanation:
# Executes stored procedure with customer_id = 5.


# OUT PARAMETER PROCEDURE
# OUT parameter returns value from procedure.


DELIMITER //

CREATE PROCEDURE GetCustomerCount (
    OUT total_customers INT
)

BEGIN

    SELECT COUNT(*)
    INTO total_customers
    FROM customer;

END //

DELIMITER ;

# Explanation:
# Counts total customers and stores result
# inside OUT parameter.

########### CALL OUT PARAMETER PROCEDURE ###########

CALL GetCustomerCount(@total);

SELECT @total;

# Explanation:
# Calls procedure and stores result in variable @total.

# INOUT PARAMETER PROCEDURE
# INOUT parameter acts as both input and output.


DELIMITER //

CREATE PROCEDURE IncreaseValue (
    INOUT num INT
)

BEGIN

    SET num = num + 10;

END //

DELIMITER ;

# Explanation:
# Takes input value and updates same variable.

########## CALL INOUT PROCEDURE

SET @number = 20;

CALL IncreaseValue(@number);

SELECT @number;

# Explanation:
# Input 20 becomes 30 after procedure execution.


# DYNAMIC SQL PROCEDURE
# Dynamic SQL allows SQL query creation at runtime.
# Useful when table names or conditions change dynamically.

DELIMITER //

CREATE PROCEDURE GetTableData (
    IN table_name VARCHAR(100)
)

BEGIN

    SET @query = CONCAT('SELECT * FROM ', table_name);

    PREPARE stmt FROM @query;

    EXECUTE stmt;

    DEALLOCATE PREPARE stmt;

END //

DELIMITER ;

# Explanation:
# CONCAT builds SQL query dynamically.
# PREPARE prepares query.
# EXECUTE runs query dynamically.

######### CALL DYNAMIC SQL PROCEDURE


CALL GetTableData('customer');

# Explanation:
# Dynamically fetches all data from customer table.


# ADVANTAGES OF STORED PROCEDURES
# 1. Reusable SQL logic.
# 2. Better performance.
# 3. Reduces duplicate code.
# 4. Improves security.
# 5. Easier maintenance.

