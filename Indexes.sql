05/26/2026

########### INDEXES


# Index is used to improve data retrieval speed.
# It helps database fetch required data quickly
# without scanning entire table row by row.

# Index works similar to a book index.
# Instead of checking every page,
# database directly jumps to required data.

# CLUSTERED INDEX

# Clustered index determines the physical order
# of data stored inside the table.

# Table data is physically organized
# based on clustered index column.

# Only one clustered index is allowed per table
# because data can be physically sorted only once.

# Usually PRIMARY KEY becomes clustered index automatically.

# EXAMPLE

CREATE TABLE employees (

    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50)

);

# Explanation:
# employee_id becomes clustered index automatically.
# Rows are physically stored in sorted order
# based on employee_id.


# NON-CLUSTERED INDEX
# Non-clustered index creates separate structure
# apart from actual table data.

# Actual table data remains unchanged physically.

# Non-clustered index stores:
# indexed column values + pointers to actual rows.

# Multiple non-clustered indexes can exist in one table.


CREATE INDEX idx_employee_name
ON employees(employee_name);

# Explanation:
# Separate index structure is created for employee_name.
# Faster searching happens using row pointers.

# PRIMARY KEY
# Primary key uniquely identifies each record.
# Duplicate and NULL values are not allowed.

# Primary key usually creates clustered index automatically.

CREATE TABLE customers (

    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)

);

# Explanation:
# customer_id uniquely identifies each customer.

# INDEXES ARE STORED SEPARATELY
# Non-clustered indexes are stored separately
# from actual table data.

# They contain:
# 1. Indexed values
# 2. Row location pointers

# Database uses pointers to quickly fetch rows.

# NATURAL KEY

# Natural key is a real-world naturally unique value.

# It already exists naturally in business data.

# Examples:
# Aadhaar Number
# Passport Number
# Email ID


CREATE TABLE users (

    email VARCHAR(100) UNIQUE,
    user_name VARCHAR(50)

);

# Explanation:
# Email naturally acts as unique identifier.

# SURROGATE KEY
# Surrogate key is system-generated unique value.

# It has no business meaning.
# Mostly generated using AUTO_INCREMENT.

# Used when natural keys are large or change frequently.

### OPTIMIZATION
# SQL Optimization means improving query performance
# and reducing execution time.
# Also called SQL Query Fine-Tuning.

# 1. USE ONLY NECESSARY COLUMNS
# Avoid SELECT *

# BAD PRACTICE
SELECT *
FROM customer;
