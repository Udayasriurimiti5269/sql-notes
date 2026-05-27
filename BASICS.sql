# Create  Your Database
CREATE DATABASE training_db;
#Use Database
USE training_db;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    age INT
);
INSERT INTO customers
VALUES
#INSERT INTO customers
(customer_id, customer_name, city, age)
VALUES
(1, 'John', 'Dallas', 25),
(2, 'Sara', 'Memphis', 30),
(3, 'David', 'Chicago', 28);
# View Data 
SELECT * FROM customers;
# Where Clause
SELECT * 
FROM customers
WHERE city = 'Chicago';
# Update Clause
UPDATE customers
SET city = 'Austin'
WHERE customer_id = 3;
SELECT * FROM customers;

DELETE FROM customers
WHERE customer_id = 2;
SELECT * FROM customers;

# Alter
ALTER TABLE customers
ADD email VARCHAR(100);
DESCRIBE customers;

# Update new column
UPDATE customers
SET email = 'john@gmail.com'
WHERE customer_id = 1;
SELECT * FROM customers;

