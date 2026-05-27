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
# Makes deeply nested queries cleaner.6