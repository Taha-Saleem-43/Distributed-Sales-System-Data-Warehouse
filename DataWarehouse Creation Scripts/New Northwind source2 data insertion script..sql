Use Northwind_Source2;

-- Regions
INSERT INTO Region (RegionID, RegionDescription) VALUES
(1, 'North America'),
(2, 'Europe'),
(3, 'Asia'),
(4, 'Oceania');
GO

-- Territories
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID) VALUES
(110, 'Greater Toronto', 1),
(120, 'Pacific Northwest', 1),
(210, 'Southern Europe', 2),
(220, 'Central Europe', 2),
(310, 'Southeast Asia', 3),
(320, 'Northeast Asia', 3),
(410, 'Australia East', 4);
GO

-- Categories
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES
(11, 'Seafood', 'Fish, shellfish and related products'),
(12, 'Produce', 'Fresh fruits and vegetables'),
(13, 'Bakery', 'Fresh baked goods and pastries'),
(14, 'Deli', 'Prepared meats and sandwiches'),
(15, 'Snacks', 'Chips, nuts, and snack foods');
GO

-- Suppliers
INSERT INTO Suppliers (SupplierID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone) VALUES
(11, 'Northern Catch', 'Olivia Green', 'Sales Head', '75 Fisherman Row', 'Vancouver', 'BC', 'V5K0A1', 'Canada', '+1-604-111-2222'),
(12, 'SunFresh Produce', 'Miguel Santos', 'Export', 'Av. del Sol 10', 'Lisbon', 'Lisbon', '1100-200', 'Portugal', '+351-21-555-1234'),
(13, 'Bakers Co.', 'Helga Meier', 'Owner', '17 Back St', 'Hamburg', 'Hamburg', '20095', 'Germany', '+49-40-555-0101'),
(14, 'Deli Delights', 'Youssef Ali', 'Purchasing', '21 Nile Ave', 'Cairo', 'Cairo', '11511', 'Egypt', '+20-2-555-0202'),
(15, 'SnackTime Ltd', 'Kylie Brown', 'Manager', '250 George St', 'Sydney', 'NSW', '2000', 'Australia', '+61-2-9000-1111'),
(16, 'Manila Marine', 'Rico Dela Cruz', 'Director', '9 Baywalk', 'Manila', 'Metro Manila', '1000', 'Philippines', '+63-2-800-2000');
GO

-- Customers (some repeated business keys from Source1: C0003, C0009, C0012)
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone) VALUES
('C0201','NorthPoint Foods','Ayesha Khan','Buyer','10 Harbour St','Toronto','ON','M5J2N1','Canada','+1-416-2223001'),
('C0202','GreenGrocers','Marco Pereira','Manager','5 Rua Nova','Lisbon','Lisbon','1100-201','Portugal','+351-21-111222'),
('C0003','Gamma Foods','Lena Smith','Manager','78 Queen St','London','Greater London','WC1','UK','+44-20-3003003'),
('C0204','BakerHouse','Helga Meier','Purchasing','17 Back St','Hamburg','Hamburg','20095','Germany','+49-40-1112222'),
('C0205','DeliCorner','Mohamed Hassan','Store Mgr','9 Nile Rd','Cairo','Cairo','11511','Egypt','+20-2-2223333'),
('C0206','SnackWorld','Liam Smith','Merchandise','250 George St','Sydney','NSW','2000','Australia','+61-2-3334444'),
('C0009','Iota Grocers','Fatima Noor','Manager','4 Liberty Ave','Karachi','Sindh','74200','Pakistan','+92-21-3344333'),
('C0208','Pacific Wholesale','Rico Tan','Purchasing','55 Bay St','Manila','Metro Manila','1000','Philippines','+63-2-3334445'),
('C0209','Harbor Foods','Sophie King','Owner','12 Dockside','Vancouver','BC','V6B0N1','Canada','+1-604-3334000'),
('C0210','EuroFresh','Giovanni Rossi','Buyer','Via Dante 2','Rome','Lazio','00100','Italy','+39-06-4444000'),
('C0012','Mu Markets','Pedro Alvarez','Owner','88 Paseo','Barcelona','Catalonia','08002','Spain','+34-93-1231234'),
('C0212','Aussie Deli','Tom Hardy','Manager','88 Pitt St','Sydney','NSW','2000','Australia','+61-2-5556666'),
('C0213','Seoul Select','Kim Yuna','Retail Head','101 Gangnam','Seoul','Seoul','06001','South Korea','+82-2-3333333'),
('C0214','Shanghai Mart','Chen Li','Buyer','200 Huaihai Rd','Shanghai','Shanghai','200020','China','+86-21-9999000'),
('C0215','BayArea Foods','Rachel Kim','Procurement','88 Pine St','San Francisco','CA','94105','USA','+1-415-2223333');
GO

-- Employees
INSERT INTO Employees (EmployeeID, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, ReportsTo) VALUES
(11, 'Nguyen', 'Minh', 'Regional Sales Rep', 'Mr.', '1984-02-10', '2013-05-01', '99 River Rd', 'Toronto', 'ON', 'M5V2A1', 'Canada', '+1-416-5551111', NULL),
(12, 'Oliveira', 'Clara', 'Order Clerk', 'Ms.', '1990-08-22', '2016-09-10', '45 Rua Nova', 'Lisbon', 'Lisbon', '1100-300', 'Portugal', '+351-21-222333', 11),
(13, 'Fernandez', 'Diego', 'Sales Manager', 'Mr.', '1978-04-04', '2009-02-18', '30 Via Roma', 'Rome', 'Lazio', '00100', 'Italy', '+39-06-5557777', NULL),
(14, 'Patel', 'Nisha', 'Logistics Lead', 'Ms.', '1992-12-12', '2019-03-25', '6 Connaught Place', 'New Delhi', 'Delhi', '110001', 'India', '+91-11-7778888', 13),
(15, 'Wong', 'Jia', 'Purchasing', 'Ms.', '1986-06-06', '2015-07-07', '20 Nanjing Rd', 'Shanghai', 'Shanghai', '200020', 'China', '+86-21-6667777', 13),
(16, 'Brown', 'Kylie', 'Accountant', 'Ms.', '1989-03-03', '2017-11-11', '250 George St', 'Sydney', 'NSW', '2000', 'Australia', '+61-2-2223344', 13);
GO

-- Shippers
INSERT INTO Shippers (ShipperID, CompanyName, Phone) VALUES
(11, 'Rapid Freight', '+1-888-900-1000'),
(12, 'EuroShip', '+44-20-700-2000'),
(13, 'AsiaCargo', '+63-2-700-3000');
GO

-- Products
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued) VALUES
(2001, 'Salmon Fillet', 11, 11, '10 - 1 kg packs', 120.00, 25, 0, 5, 0),
(2002, 'Shrimp Peeled', 11, 11, '20 - 500 g packs', 80.00, 40, 0, 10, 0),
(2003, 'Organic Apples', 12, 12, '100 - 1 kg bags', 3.50, 500, 0, 100, 0),
(2004, 'Bananas', 12, 12, '40 - bunches', 1.20, 600, 0, 150, 0),
(2005, 'Sourdough Loaf', 13, 13, '24 - 400 g', 4.80, 80, 0, 20, 0),
(2006, 'Croissant Pack', 13, 13, '30 - pack', 12.50, 45, 0, 10, 0),
(2007, 'Roast Beef Sandwich', 14, 14, 'Single', 6.75, 120, 0, 25, 0),
(2008, 'Smoked Turkey Slices', 14, 14, '200 - 250 g packs', 9.50, 60, 0, 15, 0),
(2009, 'Potato Chips', 15, 15, '24 - 50 g packs', 2.00, 1000, 0, 200, 0),
(2010, 'Mixed Nuts', 15, 15, '12 - 300 g tins', 8.50, 200, 0, 40, 0),
(2011, 'Tuna Cans', 16, 11, '48 - 185 g cans', 2.50, 300, 0, 50, 0),
(2012, 'Seaweed Snacks', 16, 15, '60 - 20 g packs', 0.90, 400, 0, 80, 0),
(2013, 'Mediterranean Olives', 12, 11, '12 - 350 g jars', 6.00, 90, 0, 20, 0),
(2014, 'Ciabatta', 13, 13, '20 - 300 g', 3.20, 70, 0, 15, 0),
(2015, 'Pita Bread', 13, 13, '30 - 200 g', 2.40, 150, 0, 30, 0),
(2016, 'Spicy Nuts', 15, 15, '20 - 150 g', 4.75, 120, 0, 25, 0);
GO

-- Orders
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry) VALUES
(6001, 'C0201', 11, '2025-11-11', '2025-11-21', '2025-11-13', 11, 18.00, 'NorthPoint Foods', '10 Harbour St', 'Toronto', 'ON', 'M5J2N1', 'Canada'),
(6002, 'C0202', 12, '2025-10-30', '2025-11-10', '2025-11-01', 12, 10.50, 'GreenGrocers', '5 Rua Nova', 'Lisbon', 'Lisbon', '1100-201', 'Portugal'),
(6003, 'C0003', 13, '2025-09-25', '2025-10-05', '2025-09-27', 12, 22.20, 'Gamma Foods', '78 Queen St', 'London', 'Greater London', 'WC1', 'UK'),
(6004, 'C0204', 13, '2025-11-02', '2025-11-16', NULL, NULL, 0.00, 'BakerHouse', '17 Back St', 'Hamburg', 'Hamburg', '20095', 'Germany'),
(6005, 'C0205', 14, '2025-10-08', '2025-10-22', '2025-10-10', 13, 7.00, 'DeliCorner', '9 Nile Rd', 'Cairo', 'Cairo', '11511', 'Egypt'),
(6006, 'C0206', 16, '2025-10-20', '2025-11-03', '2025-10-22', 11, 6.40, 'SnackWorld', '250 George St', 'Sydney', 'NSW', '2000', 'Australia'),
(6007, 'C0009', 15, '2025-11-05', '2025-11-19', '2025-11-07', 13, 13.25, 'Iota Grocers', '4 Liberty Ave', 'Karachi', 'Sindh', '74200', 'Pakistan'),
(6008, 'C0208', 11, '2025-09-15', '2025-09-29', '2025-09-17', 13, 9.80, 'Pacific Wholesale', '55 Bay St', 'Manila', 'Metro Manila', '1000', 'Philippines'),
(6009, 'C0209', 11, '2025-11-06', '2025-11-20', NULL, NULL, 0.00, 'Harbor Foods', '12 Dockside', 'Vancouver', 'BC', 'V6B0N1', 'Canada'),
(6010, 'C0210', 13, '2025-09-05', '2025-09-19', '2025-09-07', 12, 5.00, 'EuroFresh', 'Via Dante 2', 'Rome', 'Lazio', '00100', 'Italy'),
(6011, 'C0012', 12, '2025-10-28', '2025-11-11', '2025-10-30', 12, 11.00, 'Mu Markets', '88 Paseo', 'Barcelona', 'Catalonia', '08002', 'Spain'),
(6012, 'C0215', 16, '2025-10-01', '2025-10-15', '2025-10-03', 11, 4.50, 'BayArea Foods', '88 Pine St', 'San Francisco', 'CA', '94105', 'USA'),
(6013, 'C0201', 11, '2024-01-15', '2024-01-29', '2024-01-17', 11, 10.50, 'NorthPoint Foods', '10 Harbour St', 'Toronto', 'ON', 'M5J2N1', 'Canada'),
(6014, 'C0202', 12, '2024-03-05', '2024-03-19', '2024-03-07', 12, 8.25, 'GreenGrocers', '5 Rua Nova', 'Lisbon', 'Lisbon', '1100-201', 'Portugal'),
(6015, 'C0003', 13, '2024-01-25', '2024-02-08', '2024-01-27', 12, 15.00, 'Gamma Foods', '78 Queen St', 'London', 'Greater London', 'WC1', 'UK'),
(6016, 'C0204', 13, '2024-03-18', '2024-04-01', '2024-03-20', 12, 12.40, 'BakerHouse', '17 Back St', 'Hamburg', 'Hamburg', '20095', 'Germany'),
(6017, 'C0205', 14, '2024-07-10', '2024-07-24', '2024-07-12', 13, 6.70, 'DeliCorner', '9 Nile Rd', 'Cairo', 'Cairo', '11511', 'Egypt'),
(6018, 'C0206', 16, '2024-07-22', '2024-08-05', '2024-07-24', 11, 7.80, 'SnackWorld', '250 George St', 'Sydney', 'NSW', '2000', 'Australia'),
(6019, 'C0009', 15, '2024-01-12', '2024-01-26', '2024-01-14', 13, 14.50, 'Iota Grocers', '4 Liberty Ave', 'Karachi', 'Sindh', '74200', 'Pakistan'),
(6020, 'C0208', 11, '2024-03-28', '2024-04-11', '2024-03-30', 13, 9.90, 'Pacific Wholesale', '55 Bay St', 'Manila', 'Metro Manila', '1000', 'Philippines'),
(6021, 'C0209', 11, '2024-07-02', '2024-07-16', '2024-07-04', 11, 5.50, 'Harbor Foods', '12 Dockside', 'Vancouver', 'BC', 'V6B0N1', 'Canada'),
(6022, 'C0210', 13, '2024-01-08', '2024-01-22', '2024-01-10', 12, 6.00, 'EuroFresh', 'Via Dante 2', 'Rome', 'Lazio', '00100', 'Italy'),
(6023, 'C0012', 12, '2024-03-12', '2024-03-26', '2024-03-14', 12, 11.50, 'Mu Markets', '88 Paseo', 'Barcelona', 'Catalonia', '08002', 'Spain'),
(6024, 'C0215', 16, '2024-01-20', '2024-02-03', '2024-01-22', 11, 4.80, 'BayArea Foods', '88 Pine St', 'San Francisco', 'CA', '94105', 'USA'),
(6025, 'C0201', 11, '2025-02-05', '2025-02-19', '2025-02-07', 11, 10.00, 'NorthPoint Foods', '10 Harbour St', 'Toronto', 'ON', 'M5J2N1', 'Canada'),
(6026, 'C0202', 12, '2025-01-18', '2025-02-01', '2025-01-20', 12, 9.20, 'GreenGrocers', '5 Rua Nova', 'Lisbon', 'Lisbon', '1100-201', 'Portugal'),
(6027, 'C0003', 13, '2025-03-10', '2025-03-24', '2025-03-12', 12, 16.50, 'Gamma Foods', '78 Queen St', 'London', 'Greater London', 'WC1', 'UK'),
(6028, 'C0204', 13, '2025-01-12', '2025-01-26', '2025-01-14', 12, 13.00, 'BakerHouse', '17 Back St', 'Hamburg', 'Hamburg', '20095', 'Germany'),
(6029, 'C0205', 14, '2025-03-22', '2025-04-05', '2025-03-24', 13, 8.10, 'DeliCorner', '9 Nile Rd', 'Cairo', 'Cairo', '11511', 'Egypt'),
(6030, 'C0206', 16, '2025-02-15', '2025-03-01', '2025-02-17', 11, 7.60, 'SnackWorld', '250 George St', 'Sydney', 'NSW', '2000', 'Australia');
GO

-- OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount) VALUES
(6001, 2001, 120.00, 4, 0.00),
(6001, 2009, 2.00, 50, 0.00),
(6002, 2003, 3.50, 100, 0.05),
(6002, 2013, 6.00, 10, 0.00),
(6003, 2005, 4.80, 12, 0.00),
(6003, 2011, 2.50, 24, 0.10),
(6004, 2006, 12.50, 30, 0.00),
(6004, 2014, 3.20, 20, 0.00),
(6005, 2007, 6.75, 8, 0.00),
(6005, 2008, 9.50, 6, 0.00),
(6006, 2010, 8.50, 15, 0.00),
(6006, 2016, 4.75, 10, 0.00),
(6007, 2011, 2.50, 20, 0.00),
(6007, 2009, 2.00, 40, 0.00),
(6008, 2002, 80.00, 6, 0.00),
(6008, 2012, 0.90, 30, 0.00),
(6009, 2013, 6.00, 12, 0.00),
(6009, 2004, 1.20, 48, 0.00),
(6010, 2014, 3.20, 6, 0.00),
(6010, 2005, 4.80, 3, 0.05),
(6011, 2016, 4.75, 25, 0.00),
(6011, 2012, 0.90, 50, 0.00),
(6012, 2001, 120.00, 2, 0.00),
(6012, 2009, 2.00, 80, 0.00),
(6013, 2001, 120.00, 3, 0.00),
(6013, 2009, 2.00, 30, 0.00),
(6014, 2003, 3.50, 50, 0.05),
(6014, 2013, 6.00, 8, 0.00),
(6015, 2005, 4.80, 15, 0.00),
(6015, 2011, 2.50, 20, 0.10),
(6016, 2006, 12.50, 25, 0.00),
(6016, 2014, 3.20, 18, 0.00),
(6017, 2007, 6.75, 10, 0.00),
(6017, 2008, 9.50, 5, 0.00),
(6018, 2010, 8.50, 12, 0.00),
(6018, 2016, 4.75, 6, 0.00),
(6019, 2011, 2.50, 18, 0.00),
(6019, 2009, 2.00, 35, 0.00),
(6020, 2002, 80.00, 5, 0.00),
(6020, 2012, 0.90, 20, 0.00),
(6021, 2013, 6.00, 10, 0.00),
(6021, 2004, 1.20, 20, 0.00),
(6022, 2014, 3.20, 4, 0.00),
(6022, 2005, 4.80, 8, 0.05),
(6023, 2016, 4.75, 10, 0.00),
(6023, 2012, 0.90, 25, 0.00),
(6024, 2001, 120.00, 1, 0.00),
(6024, 2009, 2.00, 40, 0.00),
(6025, 2001, 120.00, 4, 0.00),
(6025, 2009, 2.00, 50, 0.00),
(6026, 2003, 3.50, 60, 0.05),
(6026, 2013, 6.00, 12, 0.00),
(6027, 2005, 4.80, 20, 0.00),
(6027, 2011, 2.50, 25, 0.10),
(6028, 2006, 12.50, 15, 0.00),
(6028, 2014, 3.20, 10, 0.00),
(6029, 2007, 6.75, 8, 0.00),
(6029, 2008, 9.50, 4, 0.00),
(6030, 2010, 8.50, 10, 0.00),
(6030, 2016, 4.75, 8, 0.00);
GO

-- EmployeeTerritories
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID) VALUES
(11, 110),
(11, 120),
(12, 120),
(13, 220),
(13, 210),
(14, 310),
(15, 320),
(16, 410);
GO

-- Quick verification counts
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
