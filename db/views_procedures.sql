CREATE VIEW sales_greater_25k_query AS
SELECT * FROM Sales
WHERE annual_sales > 25000;

CREATE VIEW salesperson_query AS
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

CREATE VIEW sales_report AS
SELECT
s.last_name AS last_name,
s.annual_sales AS sales,
s.customers AS customer,
r.region,
r.customer_territory AS sales_territory,
s.zip_code
FROM Sales s
JOIN SalesRegions r
ON s.salesperson_id = r.salesperson_id
ORDER BY s.last_name ASC;

CREATE VIEW sales_by_region_report AS
SELECT
r.customer_territory AS sales_territory,
COUNT(*) AS total_customers,
SUM(s.annual_sales) AS total_sales,
AVG(s.annual_sales) AS average_sales,
MIN(s.annual_sales) AS min_sales,
MAX(s.annual_sales) AS max_sales,
FROM Sales s
JOIN SalesRegions r
ON s.salesperson_id = r.salesperson_id
GROUP BY r.customer_territory
ORDER BY total_sales DESC;