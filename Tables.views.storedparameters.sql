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

