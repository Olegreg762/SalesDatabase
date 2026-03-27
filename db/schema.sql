DROP DATABASE IF EXISTS sales_db;
CREATE DATABASE sales_db;
USE sales_db;

CREATE TABLE Sales (
    salesperson_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    department_number INT NOT NULL,
    customers VARCHAR(100) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    annual_sales DECIMAL(10, 2) NOT NULL
);

CREATE TABLE SalesRegions (
    region_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    region VARCHAR(50) NOT NULL,
    customers VARCHAR(100) NOT NULL,
    customer_territory VARCHAR(50) NOT NULL,
    region_sales DECIMAL(10, 2) NOT NULL,
    salesperson_id INT NOT NULL,
    FOREIGN KEY (salesperson_id) REFERENCES Sales(salesperson_id)
);