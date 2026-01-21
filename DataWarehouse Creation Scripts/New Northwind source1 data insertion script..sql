-- ===============================
-- INSERTION SCRIPT (correct order)
-- Run AFTER your CREATE TABLE statements
-- ===============================

USE Northwind_Source1;
GO

-- 1) Regions (parents of Territories)
INSERT INTO Region (RegionID, RegionDescription) VALUES
(1, 'North America'),
(2, 'Europe'),
(3, 'Asia');
GO

-- 2) Territories (depends on Region)
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID) VALUES
(101, 'New York Metro', 1),
(102, 'Midwest USA', 1),
(201, 'Western Europe', 2),
(202, 'Northern Europe', 2),
(301, 'South Asia', 3),
(302, 'East Asia', 3);
GO

-- 3) Categories (no dependencies)
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES
(1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
(2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
(3, 'Confections', 'Desserts, candies, and sweet breads'),
(4, 'Dairy Products', 'Cheeses and dairy items'),
(5, 'Grains/Cereals', 'Breads, crackers, pasta, and cereal');
GO

-- 4) Suppliers (no FK dependencies for this schema)
INSERT INTO Suppliers (SupplierID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone) VALUES
(1, 'Acme Beverages', 'Jamal Ahmed', 'Sales Manager', '101 Market St', 'Karachi', 'Sindh', '74000', 'Pakistan', '+92-21-111-0001'),
(2, 'Euro Foods Ltd', 'Sofia Rossi', 'Export Manager', 'Via Roma 4', 'Milan', 'Lombardy', '20121', 'Italy', '+39-02-123456'),
(3, 'Pacific Imports', 'Kenji Watanabe', 'Director', '2-3-4 Shibuya', 'Tokyo', 'Tokyo', '150-0002', 'Japan', '+81-3-3333-4444'),
(4, 'Midwest Farms', 'John Miller', 'Owner', '55 Harvest Rd', 'Chicago', 'IL', '60601', 'USA', '+1-312-555-0101'),
(5, 'London Sweets', 'Emma Brown', 'Purchasing', '10 Baker St', 'London', 'Greater London', 'WC2N', 'UK', '+44-20-7946-0123'),
(6, 'Istanbul Spices', 'Ozan Kaya', 'Manager', 'Ataturk Cd. 8', 'Istanbul', 'Istanbul', '34000', 'Turkey', '+90-212-555-0199'),
(7, 'Delhi Dairy', 'Rajesh Gupta', 'Supply Head', '3 Gandhi Rd', 'New Delhi', 'Delhi', '110001', 'India', '+91-11-2345-6789'),
(8, 'Shanghai Grains', 'Li Wei', 'Procurement', '100 Pudong Ave', 'Shanghai', 'Shanghai', '200120', 'China', '+86-21-400800');
GO

-- 5) Customers (no FK dependencies for this schema)
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone) VALUES
('C0001','Alpha Traders','Sara Khan','Owner','12 Clifton Road','Karachi','Sindh','74400','Pakistan','+92-21-2222001'),
('C0002','Beta Supplies','Omar Ali','Procurement Head','45 Mall Rd','Lahore','Punjab','54000','Pakistan','+92-42-2222002'),
('C0003','Gamma Foods','Lena Smith','Manager','78 Queen St','London','Greater London','WC1','UK','+44-20-3003003'),
('C0004','Delta Retail','James Brown','Store Mgr','9 High St','Manchester','Greater Manchester','M1','UK','+44-161-4004004'),
('C0005','Epsilon Mart','Carlos Ruiz','Buyer','120 Market Lane','Madrid','Community of Madrid','28001','Spain','+34-91-5005005'),
('C0006','Zeta Wholesale','Anna Muller','Sales','22 Hauptstrasse','Berlin','Berlin','10115','Germany','+49-30-6006006'),
('C0007','Eta Corner','Mei Lin','Owner','33 Nanjing Rd','Shanghai','Shanghai','200001','China','+86-21-7007007'),
('C0008','Theta Foods','David Lee','Procurement','200 Pine St','San Francisco','CA','94107','USA','+1-415-8008008'),
('C0009','Iota Grocers','Fatima Noor','Manager','4 Liberty Ave','Karachi','Sindh','74200','Pakistan','+92-21-3344333'),
('C0010','Kappa Traders','Liam O''Connor','Buyer','7 O''Connell St','Dublin','Leinster','D01','Ireland','+353-1-2222222'),
('C0011','Lambda Stores','Nora Svensson','Store Lead','12 Drottninggatan','Stockholm','Stockholm','111 21','Sweden','+46-8-9999000'),
('C0012','Mu Markets','Pedro Alvarez','Owner','88 Paseo','Barcelona','Catalonia','08002','Spain','+34-93-1231234'),
('C0013','Nu Boutique','Sara Park','Retail Head','56 Gangnam-ro','Seoul','Seoul','06000','South Korea','+82-2-123-4567'),
('C0014','Xi Foods','Ahmed Zafar','Procurement','30 Gulberg','Lahore','Punjab','54660','Pakistan','+92-42-5555500'),
('C0015','Omicron Deli','Marta Kowalski','Manager','19 Nowy Swiat','Warsaw','Mazovia','00-001','Poland','+48-22-1111111');
GO

-- 6) Employees (self-referencing FK: inserting all rows in one statement is fine)
INSERT INTO Employees (EmployeeID, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, ReportsTo) VALUES
(1, 'Khan', 'Ahmed', 'Sales Representative', 'Mr.', '1980-05-12', '2010-04-01', '10 Agha Khan Rd', 'Karachi', 'Sindh', '74000', 'Pakistan', '+92-21-4001001', NULL),
(2, 'Rehman', 'Aisha', 'Order Clerk', 'Ms.', '1985-09-03', '2012-07-15', '22 Model Town', 'Lahore', 'Punjab', '54020', 'Pakistan', '+92-42-4002002', 1),
(3, 'Smith', 'John', 'Sales Manager', 'Mr.', '1975-12-20', '2008-03-05', '5 Market St', 'London', 'Greater London', 'WC2', 'UK', '+44-20-2002003', NULL),
(4, 'Garcia', 'Maria', 'Purchasing Manager', 'Ms.', '1982-02-14', '2011-06-10', '122 Avenida', 'Madrid', 'Community of Madrid', '28001', 'Spain', '+34-91-8888888', 3),
(5, 'Watanabe', 'Taro', 'Logistics Coordinator', 'Mr.', '1990-11-11', '2018-01-20', '3-2-1 Minami', 'Tokyo', 'Tokyo', '150-0001', 'Japan', '+81-3-7777777', 3),
(6, 'Patel', 'Sneha', 'Accountant', 'Ms.', '1988-07-07', '2014-09-01', '10 Connaught Place', 'New Delhi', 'Delhi', '110001', 'India', '+91-11-4444444', 4);
GO

-- 7) Shippers (parents of Orders)
INSERT INTO Shippers (ShipperID, CompanyName, Phone) VALUES
(1, 'Speedy Express', '+1-800-700-1000'),
(2, 'United Package', '+44-20-800-2000'),
(3, 'Federal Shipping', '+86-21-800-3000');
GO

-- 8) Products (depends on Suppliers and Categories)
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued) VALUES
(1001, 'Chai', 1, 1, '20 boxes x 20 bags', 18.00, 39, 0, 10, 0),
(1002, 'Coffee', 1, 1, '10 boxes x 12 bags', 22.50, 50, 0, 10, 0),
(1003, 'Aniseed Syrup', 2, 2, '12 - 550 ml bottles', 10.00, 13, 70, 25, 0),
(1004, 'Chef Anton''s Cajun Seasoning', 6, 2, '48 - 6 oz jars', 22.00, 53, 0, 0, 0),
(1005, 'Grandma''s Boysenberry Spread', 5, 3, '12 - 8 oz jars', 25.00, 120, 0, 25, 0),
(1006, 'Uncle Bob''s Organic Dried Pears', 7, 3, '12 - 1 lb pkgs.', 30.00, 15, 0, 10, 0),
(1007, 'Queso Cabrales', 4, 4, '10 - 500 g pkgs.', 21.00, 22, 30, 5, 0),
(1008, 'Tofu', 7, 4, '40 - 100 g pkgs.', 15.00, 35, 0, 10, 0),
(1009, 'Filo Mix', 8, 5, '16 - 2 kg boxes', 14.00, 60, 0, 20, 0),
(1010, 'Pavlova', 5, 3, '32 - 500 g boxes', 17.45, 29, 0, 10, 0),
(1011, 'Gumbo Mix', 6, 2, '20 - 1 kg bags', 21.35, 0, 0, 0, 1),
(1012, 'Sir Rodney''s Marmalade', 2, 3, '12 - 450 g jars', 9.20, 40, 0, 25, 0),
(1013, 'Louisiana Hot Sauce', 6, 2, '24 - 250 ml bottles', 14.00, 120, 0, 25, 0),
(1014, 'Ravioli', 4, 5, '12 - 250 g boxes', 19.50, 25, 0, 5, 0),
(1015, 'Baklava', 5, 3, '24 pieces', 9.00, 75, 0, 30, 0);
GO

-- 9) Orders (depends on Customers, Employees, Shippers)
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry) VALUES
(5001, 'C0001', 1, '2025-11-10', '2025-11-20', '2025-11-12', 1, 12.50, 'Alpha Traders', '12 Clifton Road', 'Karachi', 'Sindh', '74400', 'Pakistan'),
(5002, 'C0002', 2, '2025-11-05', '2025-11-15', '2025-11-06', 1, 25.00, 'Beta Supplies', '45 Mall Rd', 'Lahore', 'Punjab', '54000', 'Pakistan'),
(5003, 'C0003', 3, '2025-10-20', '2025-11-03', '2025-10-22', 2, 7.80, 'Gamma Foods', '78 Queen St', 'London', 'Greater London', 'WC1', 'UK'),
(5004, 'C0004', 3, '2025-10-18', '2025-10-28', '2025-10-20', 2, 15.25, 'Delta Retail', '9 High St', 'Manchester', 'Greater Manchester', 'M1', 'UK'),
(5005, 'C0005', 4, '2025-09-30', '2025-10-14', '2025-10-02', 2, 8.40, 'Epsilon Mart', '120 Market Lane', 'Madrid', 'Community of Madrid', '28001', 'Spain'),
(5006, 'C0006', 3, '2025-11-01', '2025-11-15', NULL, NULL, 0.00, 'Zeta Wholesale', '22 Hauptstrasse', 'Berlin', 'Berlin', '10115', 'Germany'),
(5007, 'C0007', 5, '2025-10-29', '2025-11-12', '2025-10-30', 3, 18.75, 'Eta Corner', '33 Nanjing Rd', 'Shanghai', 'Shanghai', '200001', 'China'),
(5008, 'C0008', 1, '2025-10-15', '2025-10-22', '2025-10-18', 1, 5.60, 'Theta Foods', '200 Pine St', 'San Francisco', 'CA', '94107', 'USA'),
(5009, 'C0009', 2, '2025-11-03', '2025-11-17', '2025-11-05', 1, 9.90, 'Iota Grocers', '4 Liberty Ave', 'Karachi', 'Sindh', '74200', 'Pakistan'),
(5010, 'C0010', 3, '2025-09-21', '2025-10-05', '2025-09-23', 2, 12.00, 'Kappa Traders', '7 O''Connell St', 'Dublin', 'Leinster', 'D01', 'Ireland'),
(5011, 'C0011', 4, '2025-11-04', '2025-11-18', NULL, 3, 20.00, 'Lambda Stores', '12 Drottninggatan', 'Stockholm', 'Stockholm', '111 21', 'Sweden'),
(5012, 'C0012', 6, '2025-10-12', '2025-10-26', '2025-10-14', 3, 6.50, 'Mu Markets', '88 Paseo', 'Barcelona', 'Catalonia', '08002', 'Spain'),
(5013, 'C0001', 1, '2024-01-15', '2024-01-25', '2024-01-17', 1, 10.00, 'Alpha Traders', '12 Clifton Road', 'Karachi', 'Sindh', '74400', 'Pakistan'),
(5014, 'C0002', 2, '2024-03-22', '2024-04-01', '2024-03-25', 1, 18.50, 'Beta Supplies', '45 Mall Rd', 'Lahore', 'Punjab', '54000', 'Pakistan'),
(5015, 'C0003', 3, '2024-07-10', '2024-07-20', '2024-07-12', 2, 12.00, 'Gamma Foods', '78 Queen St', 'London', 'Greater London', 'WC1', 'UK'),
(5016, 'C0004', 3, '2024-08-05', '2024-08-15', '2024-08-08', 2, 15.75, 'Delta Retail', '9 High St', 'Manchester', 'Greater Manchester', 'M1', 'UK'),
(5017, 'C0005', 4, '2024-01-28', '2024-02-10', '2024-01-30', 2, 8.60, 'Epsilon Mart', '120 Market Lane', 'Madrid', 'Community of Madrid', '28001', 'Spain'),
(5018, 'C0006', 3, '2024-03-11', '2024-03-25', NULL, 1, 0.00, 'Zeta Wholesale', '22 Hauptstrasse', 'Berlin', 'Berlin', '10115', 'Germany'),
(5019, 'C0007', 5, '2024-07-22', '2024-08-05', '2024-07-24', 3, 20.25, 'Eta Corner', '33 Nanjing Rd', 'Shanghai', 'Shanghai', '200001', 'China'),
(5020, 'C0008', 1, '2024-08-14', '2024-08-21', '2024-08-16', 1, 6.50, 'Theta Foods', '200 Pine St', 'San Francisco', 'CA', '94107', 'USA'),
(5021, 'C0009', 2, '2025-01-05', '2025-01-19', '2025-01-07', 1, 11.20, 'Iota Grocers', '4 Liberty Ave', 'Karachi', 'Sindh', '74200', 'Pakistan'),
(5022, 'C0010', 3, '2025-02-12', '2025-02-26', '2025-02-15', 2, 13.50, 'Kappa Traders', '7 O''Connell St', 'Dublin', 'Leinster', 'D01', 'Ireland'),
(5023, 'C0011', 4, '2025-03-07', '2025-03-21', NULL, 3, 18.00, 'Lambda Stores', '12 Drottninggatan', 'Stockholm', 'Stockholm', '111 21', 'Sweden'),
(5024, 'C0012', 6, '2025-01-18', '2025-02-01', '2025-01-20', 3, 7.80, 'Mu Markets', '88 Paseo', 'Barcelona', 'Catalonia', '08002', 'Spain'),
(5025, 'C0001', 1, '2024-07-03', '2024-07-13', '2024-07-05', 1, 14.00, 'Alpha Traders', '12 Clifton Road', 'Karachi', 'Sindh', '74400', 'Pakistan'),
(5026, 'C0002', 2, '2024-07-18', '2024-07-28', '2024-07-20', 1, 16.75, 'Beta Supplies', '45 Mall Rd', 'Lahore', 'Punjab', '54000', 'Pakistan'),
(5027, 'C0003', 3, '2024-03-05', '2024-03-19', '2024-03-08', 2, 9.50, 'Gamma Foods', '78 Queen St', 'London', 'Greater London', 'WC1', 'UK'),
(5028, 'C0004', 3, '2024-01-12', '2024-01-26', '2024-01-15', 2, 11.20, 'Delta Retail', '9 High St', 'Manchester', 'Greater Manchester', 'M1', 'UK'),
(5029, 'C0005', 4, '2024-03-20', '2024-04-03', '2024-03-22', 2, 7.90, 'Epsilon Mart', '120 Market Lane', 'Madrid', 'Community of Madrid', '28001', 'Spain'),
(5030, 'C0006', 3, '2024-07-25', '2024-08-08', NULL, 1, 0.00, 'Zeta Wholesale', '22 Hauptstrasse', 'Berlin', 'Berlin', '10115', 'Germany');
GO

-- 10) OrderDetails (depends on Orders and Products)
INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount) VALUES
(5001, 1001, 18.00, 10, 0.00),
(5001, 1002, 22.50, 5, 0.00),
(5002, 1003, 10.00, 12, 0.05),
(5002, 1004, 22.00, 8, 0.00),
(5003, 1005, 25.00, 4, 0.00),
(5003, 1012, 9.20, 10, 0.10),
(5004, 1007, 21.00, 6, 0.00),
(5004, 1014, 19.50, 7, 0.00),
(5005, 1005, 25.00, 2, 0.00),
(5005, 1010, 17.45, 3, 0.00),
(5006, 1008, 15.00, 20, 0.00),
(5006, 1006, 30.00, 5, 0.00),
(5007, 1009, 14.00, 10, 0.00),
(5007, 1013, 14.00, 12, 0.00),
(5008, 1015, 9.00, 20, 0.00),
(5008, 1001, 18.00, 7, 0.00),
(5009, 1002, 22.50, 3, 0.00),
(5009, 1003, 10.00, 6, 0.00),
(5010, 1004, 22.00, 1, 0.00),
(5010, 1014, 19.50, 4, 0.05),
(5011, 1011, 21.35, 15, 0.00),
(5011, 1012, 9.20, 8, 0.00),
(5012, 1009, 14.00, 6, 0.00),
(5012, 1015, 9.00, 10, 0.00),
(5013, 1001, 18.00, 5, 0.00),
(5013, 1002, 22.50, 3, 0.00),
(5014, 1003, 10.00, 8, 0.05),
(5014, 1004, 22.00, 6, 0.00),
(5015, 1005, 25.00, 4, 0.00),
(5015, 1006, 30.00, 2, 0.00),
(5016, 1007, 21.00, 6, 0.00),
(5016, 1008, 15.00, 5, 0.00),
(5017, 1005, 25.00, 3, 0.00),
(5017, 1010, 17.45, 2, 0.00),
(5018, 1008, 15.00, 10, 0.00),
(5018, 1006, 30.00, 3, 0.00),
(5019, 1009, 14.00, 7, 0.00),
(5019, 1013, 14.00, 5, 0.00),
(5020, 1015, 9.00, 8, 0.00),
(5020, 1001, 18.00, 4, 0.00),
(5021, 1002, 22.50, 5, 0.00),
(5021, 1003, 10.00, 6, 0.00),
(5022, 1004, 22.00, 3, 0.00),
(5022, 1014, 19.50, 2, 0.05),
(5023, 1011, 21.35, 10, 0.00),
(5023, 1012, 9.20, 5, 0.00),
(5024, 1009, 14.00, 6, 0.00),
(5024, 1015, 9.00, 8, 0.00),
(5025, 1001, 18.00, 3, 0.00),
(5025, 1002, 22.50, 2, 0.00),
(5026, 1003, 10.00, 5, 0.00),
(5026, 1004, 22.00, 4, 0.00),
(5027, 1005, 25.00, 3, 0.00),
(5027, 1012, 9.20, 6, 0.00),
(5028, 1007, 21.00, 4, 0.00),
(5028, 1014, 19.50, 3, 0.00),
(5029, 1005, 25.00, 2, 0.00),
(5029, 1010, 17.45, 3, 0.00),
(5030, 1008, 15.00, 8, 0.00),
(5030, 1006, 30.00, 2, 0.00);
GO

-- 11) EmployeeTerritories (depends on Employees and Territories)
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID) VALUES
(1, 101),
(1, 102),
(2, 102),
(3, 201),
(3, 202),
(4, 201),
(5, 301),
(6, 301);
GO

-- Optional quick counts to verify
SELECT 'Regions' AS [Table], COUNT(*) AS Rows FROM Region
UNION ALL SELECT 'Territories', COUNT(*) FROM Territories
UNION ALL SELECT 'Categories', COUNT(*) FROM Categories
UNION ALL SELECT 'Suppliers', COUNT(*) FROM Suppliers
UNION ALL SELECT 'Customers', COUNT(*) FROM Customers
UNION ALL SELECT 'Employees', COUNT(*) FROM Employees
UNION ALL SELECT 'Shippers', COUNT(*) FROM Shippers
UNION ALL SELECT 'Products', COUNT(*) FROM Products
UNION ALL SELECT 'Orders', COUNT(*) FROM Orders
UNION ALL SELECT 'OrderDetails', COUNT(*) FROM OrderDetails
UNION ALL SELECT 'EmployeeTerritories', COUNT(*) FROM EmployeeTerritories;
GO