
INSERT INTO Sales (first_name, last_name, department_number, customers, zip_code, annual_sales)
VALUES
("Camina", "Drummer", 20, "Tycho", "12345", 54686),
("Lola", "Shaddid", 27, "Star Helix", "67890", 25408),
("Chrisjen", "Avasarala", 21, "UNN", "54321", 59807),
("Jules-Pierre", "Mao", 25, "Mao-Kwikowski Mercantile", "79876", 23269),
("Carlos", "De Baca", 24, "OPA", "74858", 187868),
("Josephus", "Miller", 28, "CPM Security", "18574", 127366),
("Kasim", "Andrada", 22, "Barbapiccola", "65749", 188836),
("Antony", "Dresden", 26, "Protogen", "99375", 96037),
("James", "Holden", 29, "Rocinante", "83792", 41865),
("Greg", "Stevenson", 23, "Donnager", "20398", 116714);

INSERT INTO SalesRegions (region, customers, customer_territory, region_sales, salesperson_id)
VALUES
("Belt", "Tycho", "Tycho Station", 267962, 1),
("Belt", "Star Helix", "Ceres Station", 267962, 2),
("United Nations", "UNN", "Earth", 367949, 3),
("United Nations", "Mao-Kwikowski Mercantile", "Phoebe", 367949, 4),
("Belt", "CPM Security", "Eros Station", 267962, 6),
("Ring Space", "OPA", "Medina Station", 358067, 5),
("Ring Space", "Barbapiccola", "Ilus IV", 358067, 7),
("United Nations", "Protogen", "Luna", 367949, 8),
("Ring Space", "Rocinante", "Ring Station", 358067, 9),
("Mars Congressional Republic", "Donnager", "MCRN", 116714, 10);

SOURCE views_procedures.sql;