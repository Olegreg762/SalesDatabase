CREATE VIEW sales_greater_25k_query AS
SELECT * FROM Sales
WHERE annual_sales > 25000;

CREATE VIEW sales_region_query AS
SELECT
s.last_name,
s.first_name,
s.annual_sales, 
r.region,
r.region_sales
FROM Sales s
JOIN SalesRegions r
ON s.salesperson_id = r.salesperson_id
ORDER BY s.annual_sales DESC;

DELIMITER //

CREATE PROCEDURE sales_by_region(IN region_name VARCHAR(50))
BEGIN
IF region_name IS NOT NULL THEN
SELECT * from sales_region_query
WHERE region = region_name
ORDER BY annual_sales DESC;
ELSE
SELECT * from sales_region_query
ORDER BY annual_sales DESC;
END IF;
END //

DELIMITER ;

CREATE VIEW sales_report AS
SELECT
sq.last_name,
SUM(sq.annual_sales) AS sales,
s.customers AS customer,
sq.region,
r.customer_territory AS sales_territory,
s.zip_code
FROM sales_region_query sq
JOIN Sales s
ON sq.last_name = s.last_name
JOIN SalesRegions r
ON s.salesperson_id = r.salesperson_id
GROUP BY
sq.last_name, 
s.customers, 
r.region, 
r.customer_territory, 
s.zip_code
ORDER BY sales ASC;

CREATE VIEW sales_by_region_report AS
SELECT
sq.region AS sales_territory,
s.customers AS customer,
sq.last_name,
s.zip_code,
sq.annual_sales AS sales,
SUM(sq.annual_sales) OVER (PARTITION BY sq.region) AS total_sales,
AVG(sq.annual_sales) OVER (PARTITION BY sq.region) AS average_sales,
MIN(sq.annual_sales) OVER (PARTITION BY sq.region) AS min_sales,
MAX(sq.annual_sales) OVER (PARTITION BY sq.region) AS max_sales
FROM sales_region_query sq
JOIN Sales s
ON sq.last_name = s.last_name
GROUP BY
sq.region,
s.customers,
s.zip_code,
sq.last_name,
sq.annual_sales
ORDER BY sq.region ASC;