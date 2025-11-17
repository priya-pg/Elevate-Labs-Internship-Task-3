# Elevate-Labs-Internship-Task-3

## Overview 
This task analyzes a Shiping Cart dataset using MySQL.
The goal is to demonstrate SQL proficiency by performing data cleaning, joining multiple tables, running analytical queries, creating views, and optimizing performance using indexes.

## Dataset Overview

The task uses four relational tables:

1. customers

- customer_id
- customer_name
- gender
- age
- home_address
- zip_code
- city
- state
- country

2. orders

- order_id
- customer_id
- payment
- order_date
- delivery_date

3. products

- product_id
- product_type
- product_name
- size
- colour
- price
- quantity
- description

4. sales

- sales_id
- order_id
- product_id
- price_per_unit
- quantity
- total_price

All tables were successfully imported into MySQL and linked using foreign keys.

## Database Relationships

customers.customer_id → orders.customer_id

orders.order_id → sales.order_id

products.product_id → sales.product_id

These relationships were enforced using FOREIGN KEY constraints.

## Data Cleaning
Mixed date formats fixed

order_date and delivery_date columns had inconsistent formats (YYYY-MM-DD and YYYY-M-D).
Steps performed:

Imported as TEXT

Standardized using STR_TO_DATE

Converted to proper DATE type

## SQL Concepts Demonstrated

This task covers all important SQL components:

- SELECT queries
- WHERE filtering
- ORDER BY sorting
- GROUP BY + aggregate functions
- INNER JOIN, LEFT JOIN
- Subqueries
- Views for reusable logic
- Index creation
- EXPLAIN for performance analysis
