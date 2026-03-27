
INSERT INTO Sales (first_name, last_name, department_number, customers, zip_code, annual_sales)
VALUES
("Camina", "Drummer", 20, "Tycho", "12345", random_int(5000, 200000)),
("Lola", "Shaddid", 27, "Star Helix", "67890", random_int(5000, 200000)),
("Chrisjen", "Avasarala", 21, "UN", "54321", random_int(5000, 200000)),
("Jules-Pierre", "Mao", 25, "Mao-Kwikowski Mercantile", "79876", random_int(5000, 200000)),
("Carlos", "De Baca", 24, "Behemoth", "74858", random_int(5000, 200000)),
("Josephus", "Miller", 28, "Ceres Station", "18574", random_int(5000, 200000)),
("Nancy", "Gao", 22, "Royal Charter Energy", "65749", random_int(5000, 200000)),
("Antony", "Dresden", 26, "Protogen", "99375", random_int(5000, 200000)),
("James", "Holden", 29, "Rocinante", "83792", random_int(5000, 200000)),
("Greg", "Steveson", 23, "MCRN", "20398", random_int(5000, 200000));

INSERT INTO SalesRegions (region, customers, customer_territory, region_sales, salesperson_id)
VALUES
("North America", "Tycho", "NA", random_int(100000, 500000), 1),
("Europe", "Star Helix", "EU", random_int(100000, 500000), 2),
("Asia", "UN", "AS", random_int(100000, 500000), 3),
("South America", "Mao-Kwikowski Mercantile", "SA", random_int(100000, 500000), 4),
("Africa", "Behemoth", "AF", random_int(100000, 500000), 5),
("Oceania", "Ceres Station", "OC", random_int(100000, 500000), 6),
("Antarctica", "Royal Charter Energy", "AN", random_int(100000, 500000), 7),
("Middle East", "Protogen", "ME", random_int(100000, 500000), 8),
("Central America", "Rocinante", "CA", random_int(100000, 500000), 9),
("Caribbean", "MCRN", "CB", random_int(100000, 500000), 10);