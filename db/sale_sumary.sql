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