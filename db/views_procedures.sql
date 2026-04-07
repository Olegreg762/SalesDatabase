CREATE VIEW sales_greater_25k_query AS
SELECT
salesperson_id,
CONCAT(first_name, ' ', last_name) AS full_name,
annual_sales
FROM Sales
WHERE annual_sales > 25000;

CREATE VIEW sales_region_query AS
SELECT
s.salesperson_id,
CONCAT(s.first_name, ' ', s.last_name) AS full_name,
s.annual_sales, 
r.region,
r.region_sales
FROM Sales s
JOIN SalesRegions r
ON s.salesperson_id = r.salesperson_id
ORDER BY s.annual_sales DESC;

DELIMITER //

CREATE PROCEDURE sales_report()
BEGIN
SELECT
s.last_name AS salesperson_last_name,
SUM(sq.annual_sales) AS sales,
s.customers AS customer,
sq.region,
r.customer_territory AS sales_territory,
s.zip_code
FROM sales_region_query sq
JOIN Sales s
ON sq.salesperson_id = s.salesperson_id
JOIN SalesRegions r
ON s.salesperson_id = r.salesperson_id
GROUP BY
s.last_name, 
s.customers, 
r.region, 
r.customer_territory, 
s.zip_code
ORDER BY sales ASC;
END //

CREATE PROCEDURE region_sales_report()
BEGIN
SELECT
s.last_name AS salesperson_last_name,
r.customer_territory AS sales_territory,
sq.region,
s.customers AS customer,
s.zip_code,
sq.annual_sales,
SUM(sq.annual_sales) OVER (PARTITION BY r.region) AS region_total_sales,
AVG(sq.annual_sales) OVER (PARTITION BY r.region) AS region_average_sales,
MIN(sq.annual_sales) OVER (PARTITION BY r.region) AS region_min_sales,
MAX(sq.annual_sales) OVER (PARTITION BY r.region) AS region_max_sales
FROM sales_region_query sq
JOIN Sales s
ON sq.salesperson_id = s.salesperson_id
JOIN SalesRegions r
ON s.salesperson_id = r.salesperson_id
GROUP BY
s.last_name,
r.customer_territory,
sq.region,
s.customers,
s.zip_code,
sq.annual_sales
ORDER BY sq.annual_sales ASC;
END //

DELIMITER ;