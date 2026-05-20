Stem Solutions Training



05/14/2026



A data is raw information \[ meaningful insights, history, transcation,] analysis, how to use, consume , process information will tell you.

Data storage, storage capacities.

data lakes



Data Engineer - to bring the data for someone else, transformation,stroing.



Data Analyst - who collects, cleans, analyzes, and interprets data to help businesses make decisions.



Data Warehouse - TO store data, we design fact and dimensioin table we store data and track different warehouse.



Data marts - power bi, tabaule to put info to the business people for loss and profit in next 1 or 3 years.





Machine Learning - Train the machine what u want to do so it can do.



predictions - stock, land, weather,



time series- patterns, seasonality



Data Business analyst, goverance, data goverance.



Python, SQL



Structered data - well formatted, tables, rows

Unstructered data - jpeg, to store s3 bucket, json files.

semi structured data - partially structured



Data Indestion --





1\. Data Collection

Purpose



Gather raw data from multiple systems.



Sources

Mobile apps

Websites

Banking systems

Sensors

APIs

Excel files

Databases

Example



An online shopping app collects:



customer clicks,

orders,

payments,

search history.

Technologies to Learn

Basics

SQL

Python

APIs

JSON

Industry

Kafka

REST APIs

2\. Ingestion

Purpose



Move collected data into centralized storage.



Think:



transporting data.



Types

Batch Ingestion



Data moves periodically.



Example:



Daily payroll upload.

Real-Time Ingestion



Continuous streaming.



Example:



Live stock market data.

Technologies

Batch

Apache Airflow

Azure Data Factory

Streaming

Apache Kafka

AWS Kinesis

3\. Processing

Purpose



Transform raw messy data into usable clean data.



Raw data usually contains:



duplicates,

missing values,

wrong formats,

inconsistent records.

Processing Tasks

Cleaning

Filtering

Joining

Aggregation

Validation

Transformation

Example



Raw:



JOHN

John

john



Processed:



John

Technologies

Must Learn

SQL

Python

Pandas

Big Data

Apache Spark

PySpark

Transformation

dbt

4\. Storage

Purpose



Store processed/raw data efficiently.



Storage Types

Database



Operational data.



Examples:



MySQL

PostgreSQL

Data Warehouse



Analytics-ready structured data.



Examples:



Snowflake

Redshift

BigQuery

Data Lake



Stores huge raw datasets.



Examples:



Amazon S3

Azure Data Lake

Technologies

Beginner

MySQL

PostgreSQL

Intermediate

Snowflake

Warehousing concepts

Advanced

Lakehouse

Delta Lake

5\. Analysis

Purpose



Enable:



Business Intelligence

Machine Learning

Reporting

Insights



This is where business teams and data scientists use the prepared data.



Example Questions

Why did sales drop?

Which customers may churn?

Which product performs best?

Technologies

BI Tools

Power BI

Tableau

Analytics

Python

Pandas

NumPy

ML

Scikit-learn

6\. Consumption

Purpose



Deliver data to users/systems.



Final business usage happens here.



Consumption Methods

Dashboards



Executives monitor KPIs.



APIs



Applications consume processed data.



Reports



Weekly/monthly reports.



ML Applications



Fraud detection, recommendations, predictions.



Technologies

APIs

FastAPI

Flask

Monitoring

Grafana

Kibana

Full Lifecycle Flow

Data Sources

&#x20;    ↓

Collection

&#x20;    ↓

Ingestion

&#x20;    ↓

Processing

&#x20;    ↓

Storage

&#x20;    ↓

Analysis

&#x20;    ↓

Consumption

Recommended Learning Order



For someone entering Data Engineering:



Step 1 — Foundation



Learn deeply:



SQL

Python

Excel basics

Git

APIs/JSON

Step 2 — Data Engineering Core



Learn:



ETL pipelines

Airflow

Data Warehousing

Snowflake

PySpark

Step 3 — Cloud



Choose one:



AWS

Azure



Azure aligns well with enterprise hiring.



Focus:



Azure Data Factory

Databricks

ADLS

Synapse





Data Ingestion



Data ingestion means bringing data from source systems into a target system like a database, data lake, or data warehouse.



Example sources:



application logs

transaction systems

APIs

CSV/Excel files

IoT sensors

databases



Example targets:



Snowflake

BigQuery

Redshift

Azure Data Lake

Amazon S3

PostgreSQL

1\. Batch Ingestion



Batch ingestion moves data at scheduled intervals.



Example:



every 1 hour

every night

once per day

Example



A company loads yesterday’s sales data every night at 12 AM into Snowflake.



Use cases

daily reports

payroll data

billing data

historical analytics

log files

Tools

Apache Airflow

Azure Data Factory

AWS Glue

Informatica

Talend

Apache NiFi

Pros

easier to build

cheaper

stable

good for reporting

Cons

not real-time

delays in insights

2\. Real-Time Ingestion



Real-time ingestion moves data continuously as events happen.



Example



When a customer makes a payment, that transaction is immediately sent to a fraud detection system.



Use cases

fraud detection

stock market data

live order tracking

Uber/food delivery tracking

real-time dashboards

Tools

Kafka

AWS Kinesis

Azure Event Hub

Google Pub/Sub

Apache Flume

Pros

fast

near real-time insights

useful for alerts and monitoring

Cons

harder to build

more expensive

needs strong monitoring

Tools in Your Slide

Apache NiFi



Apache NiFi is a drag-and-drop tool used to move, route, transform, and monitor data flows.



Good for:

file movement

API ingestion

database ingestion

simple transformations

visual pipeline building

Example



Move CSV files from a folder → clean fields → send to database.



Kafka



Kafka is a distributed streaming platform.



It is used when huge amounts of events need to move in real time.



Example



E-commerce clickstream:



User clicks product

&#x20;       ↓

Kafka topic

&#x20;       ↓

Fraud/Recommendation/Analytics system

Important Kafka terms

Producer: sends data

Consumer: reads data

Topic: category/channel where data is stored

Broker: Kafka server

Partition: splits data for scalability

Flume



Apache Flume is mainly used for collecting and moving log data.



Example



Server logs → Flume → Hadoop/HDFS.



It is older now. Kafka is more common in modern systems.



ETL and ELT (role of data engineer)

ETL = Extract, Transform, Load



Traditional method:



Source System

&#x20;  ↓

ETL Tool

&#x20;  ↓

Transformed Data

&#x20;  ↓

Data Warehouse

Meaning

Extract



Get data from source systems.



Example:



read customer data from MySQL

pull order data from API

read CSV files from S3

Transform



Clean and modify data before loading.



Example:



remove duplicates

standardize date format

join customer and order tables

calculate total sales

Load



Store final clean data into warehouse.



Example:



load clean data into Snowflake table

ELT = Extract, Load, Transform



Modern cloud method:



Source System

&#x20;  ↓

Raw Data Loaded First

&#x20;  ↓

Data Warehouse/Data Lake

&#x20;  ↓

Transform Inside Warehouse

Example



Load raw JSON data into Snowflake first, then transform using SQL/dbt.



ETL vs ELT

Feature	ETL	ELT

Transform happens	Before loading	After loading

Best for	Traditional systems	Cloud warehouses

Raw data stored?	Usually no	Yes

Flexibility	Lower	Higher

Tools	Informatica, Talend	dbt, Snowflake, BigQuery

Speed to ingest	Slower	Faster

ETL Tools in Your Slide

Talend



Used for data integration and ETL pipelines.



Good for:



connecting multiple sources

cleaning data

batch processing

enterprise ETL

Informatica



Enterprise-level ETL tool.



Used heavily in big companies, banks, healthcare, insurance.



Good for:



complex ETL workflows

governance

data quality

large enterprise pipelines

Apache NiFi



Visual drag-and-drop dataflow tool.



Good for:



ingestion

routing

lightweight transformations

monitoring flow in real time

Simple Real-Time Example

Bank Fraud Detection

Customer swipes card

&#x20;     ↓

Transaction event generated

&#x20;     ↓

Kafka ingests event

&#x20;     ↓

Fraud model checks risk

&#x20;     ↓

Alert sent if suspicious



This needs real-time ingestion.



Simple Batch Example

Daily Sales Report

Sales data from stores

&#x20;     ↓

Airflow runs pipeline at midnight

&#x20;     ↓

Data cleaned

&#x20;     ↓

Loaded into warehouse

&#x20;     ↓

Power BI dashboard refreshes



This is batch ingestion.



What You Should Learn First



Do not start with Kafka first. That is a common beginner mistake.



Learn in this order:



SQL

Python

ETL basics

Batch pipelines

Airflow

Snowflake or BigQuery

dbt

Kafka



Kafka is important, but without SQL + ETL basics, it becomes memorization.



Data Storage, Processing, Pipelines.



Workflow Orchestration,



Statistics--- ML,---NLP Models,

&#x20;LLM Models - Text models,





AI MODELS



Today learning-

WHAT, HOW DATA

HOW DATA STORED



HOW IT STEP BY STEP EVALUTED UNTIL AI?



topics with green color cover all this in weekend -- implement in sakila database, notes  \[referral links]



word document to put in the github





05/19/2026

serve is a space in which to store in database.

command line and workbench to communicate between server and user.



all tables will sit in the database and database is created in the server.



schema - multiple schemas are under the database.



A schema is a structured plan or blueprint that defines how information is organized.



The meaning changes slightly depending on the field:



In Databases



A schema describes:



what tables exist

what columns they contain

data types

relationships between tables.

SQL - Structured query language

to interact with
to create , manipulate

ddl,dcl,tcl,dml,dql are the queries used to written in sql

SQL Command Types

Type	Full Form	Purpose

DDL	Data Definition Language	Defines database structure

DML	Data Manipulation Language	Modifies data

DQL	Data Query Language	Retrieves data

DCL	Data Control Language	Controls permissions

TCL	Transaction Control Language	Manages transactions

1\. DDL – Data Definition Language



Used to create or modify database objects.



Commands:



CREATE

ALTER

DROP

TRUNCATE

RENAME



Example:



CREATE TABLE employees (

&#x20;   id INT,

&#x20;   name VARCHAR(50),

&#x20;   salary INT

);



This creates a table.



2\. DML – Data Manipulation Language



Used to insert, update, and delete data.



Commands:



INSERT

UPDATE

DELETE



Example:



INSERT INTO employees

VALUES (1, 'John', 50000);



Adds data into table.



3\. DQL – Data Query Language



Used to fetch/retrieve data.



Command:



SELECT



Example:



SELECT \* FROM employees;



Retrieves all employee records.



4\. DCL – Data Control Language



Used to give or remove access permissions.



Commands:



GRANT

REVOKE



Example:



GRANT SELECT ON employees TO user1;



Gives permission to access table.



5\. TCL – Transaction Control Language



Used to manage transactions.



Commands:



COMMIT

ROLLBACK

SAVEPOINT



Example:



ROLLBACK;



Undo changes before commit.



Easy Way to Remember

Category	Meaning

DDL	Structure

DML	Data Changes

DQL	Data Reading

DCL	Permissions

TCL	Transactions

DATA DEFINITION LANGUAGE {DDL}-

1. Create database
create table \[ database.tablename ex- id and name]
2. select
dml and dql
3. insert



practice in sql

DDL, DML,DQL --

Primary key and Foreign key

Primary key --uniquiely identify each row of the table.
A Primary Key is a column (or combination of columns) that uniquely identifies each row in a table.



It ensures:



no duplicate values

no NULL values

every record is uniquely identifiable

select
alter table

Foreign Key -
Foreign Key in SQL



A Foreign Key (FK) is a column in one table that refers to the Primary Key (PK) of another table.



It is used to create a relationship between tables.

Normaliztion-

Normalization is the process of organizing data in a database to:



reduce data redundancy

avoid duplicate data

improve data consistency

maintain data integrity



It divides large tables into smaller related tables using:



Primary Keys

Foreign Keys

Why Normalization is Needed



Without normalization:



duplicate data increases

storage wastes

updates become inconsistent

data anomalies occur





DeNormalization-
Denormalization is the process of combining tables and intentionally adding redundancy to improve read/query performance.



Opposite of normalization.



Why Denormalization is Used



Normalization improves consistency but:



joins become expensive

queries become slower



Denormalization improves:



read speed

reporting performance

analytics performance

check constraints and default constraints
A CHECK constraint is used to restrict the values that can be inserted into a column.



It ensures data follows specific conditions/rules.



Purpose of CHECK Constraint



Used to enforce:



valid ranges

allowed values

business rules

data validation



A DEFAULT constraint automatically assigns a value if no value is provided during insertion.



Purpose



Used when:



common/default values exist

users may skip some columns

automatic initialization needed



diff b/w drop, delete and truncate:

DELETE



Used to remove specific rows from a table.

DROP



Used to completely remove database object.

TRUNCATE



Used to remove all rows quickly.


NOTES IN DETAIL

1. Server, Database, Schema, Table

Server



A server is a system/software that stores and manages databases.



It provides:



storage

processing

database services

communication between user and database



Example:



MySQL Server

SQL Server

PostgreSQL Server

Correct Understanding



Your sentence:



“server is a space in which to store in database”



Better version:



A server is a system where databases are stored and managed.



Command Line \& Workbench



These are tools used to communicate with the database server.



Command Line



Text-based interface to execute SQL queries.



Example:



SELECT \* FROM employees;

MySQL Workbench



GUI (Graphical User Interface) tool used to:



write queries

create tables

manage databases

visualize schemas

2\. Database



A database is an organized collection of data.



Inside a database:



tables are stored

schemas exist

relationships are maintained



Example:



CREATE DATABASE company\_db;

3\. Schema



A schema is the logical structure or blueprint of a database.



It defines:



tables

columns

data types

constraints

relationships

Example



Schema contains:



Table	Columns

employees	id, name, salary

departments	dept\_id, dept\_name

Important



A database can contain multiple schemas.



4\. Table



A table stores data in:



rows

columns



Example:



id	name	salary

1	John	50000

5\. SQL



SQL stands for:



Structured Query Language



Used to:



create databases

create tables

insert data

update data

retrieve data

manage permissions

6\. SQL Command Types

Type	Full Form	Purpose

DDL	Data Definition Language	Defines structure

DML	Data Manipulation Language	Modifies data

DQL	Data Query Language	Retrieves data

DCL	Data Control Language	Controls access

TCL	Transaction Control Language	Manages transactions

7\. DDL — Data Definition Language



Used to define or modify database structure.



Commands

CREATE

ALTER

DROP

TRUNCATE

RENAME

CREATE Example

CREATE TABLE employees (

&#x20;   id INT,

&#x20;   name VARCHAR(50),

&#x20;   salary INT

);



Creates a new table.



ALTER Example

ALTER TABLE employees

ADD email VARCHAR(100);



Adds a new column.



DROP Example

DROP TABLE employees;



Deletes the entire table permanently.



TRUNCATE Example

TRUNCATE TABLE employees;



Deletes all rows quickly.



8\. DML — Data Manipulation Language



Used to manipulate data inside tables.



Commands

INSERT

UPDATE

DELETE

INSERT Example

INSERT INTO employees

VALUES (1, 'John', 50000);



Adds data.



UPDATE Example

UPDATE employees

SET salary = 60000

WHERE id = 1;



Updates existing data.



DELETE Example

DELETE FROM employees

WHERE id = 1;



Deletes specific rows.



9\. DQL — Data Query Language



Used to retrieve data.



Command

SELECT

Example

SELECT \* FROM employees;



Retrieves all records.



10\. DCL — Data Control Language



Used to manage permissions.



Commands

GRANT

REVOKE

GRANT Example

GRANT SELECT ON employees TO user1;



Gives access permission.



REVOKE Example

REVOKE SELECT ON employees FROM user1;



Removes permission.



11\. TCL — Transaction Control Language



Used to manage transactions.



Commands

COMMIT

ROLLBACK

SAVEPOINT

COMMIT



Saves changes permanently.



COMMIT;

ROLLBACK



Undo changes before commit.



ROLLBACK;

SAVEPOINT



Creates a checkpoint inside transaction.



SAVEPOINT sp1;

12\. Primary Key



A Primary Key uniquely identifies each row in a table.



Rules

No duplicate values

No NULL values

One primary key per table

Example

CREATE TABLE employees (

&#x20;   id INT PRIMARY KEY,

&#x20;   name VARCHAR(50)

);

13\. Foreign Key



A Foreign Key creates relationships between tables.



It references the primary key of another table.



Example

CREATE TABLE orders (

&#x20;   order\_id INT PRIMARY KEY,

&#x20;   customer\_id INT,

&#x20;   FOREIGN KEY (customer\_id)

&#x20;   REFERENCES customers(customer\_id)

);

14\. Normalization



Normalization organizes data to reduce redundancy.



Goals

avoid duplicate data

improve consistency

improve integrity

Benefits

less storage waste

easier updates

fewer anomalies

Uses

Primary Keys

Foreign Keys

15\. Denormalization



Denormalization intentionally adds redundancy for faster queries.



Why Used



Normalization improves consistency but:



joins become expensive

analytics queries become slower



Denormalization improves:



reporting speed

read performance

analytics performance

16\. CHECK Constraint



Restricts values inserted into a column.



Example

CREATE TABLE employees (

&#x20;   age INT CHECK (age >= 18)

);



Only allows age ≥ 18.



17\. DEFAULT Constraint



Automatically inserts a default value if no value is provided.



Example

CREATE TABLE employees (

&#x20;   country VARCHAR(50) DEFAULT 'USA'

);



If country is not provided, USA is inserted automatically.



18\. Difference Between DELETE, DROP, and TRUNCATE

Feature	DELETE	TRUNCATE	DROP

Removes	Specific rows	All rows	Entire table

WHERE allowed	Yes	No	No

Structure remains	Yes	Yes	No

Rollback possible	Yes	Usually No	No

Speed	Slower	Faster	Fastest

19\. Easy Memory Trick

Type	Meaning

DDL	Structure

DML	Data Changes

DQL	Reading Data

DCL	Permissions

TCL	Transactions

