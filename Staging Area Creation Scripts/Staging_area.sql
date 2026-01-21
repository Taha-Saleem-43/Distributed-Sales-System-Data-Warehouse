
---------------	IMPORTANT NOTE--------------------------------------------------------------------------------
----------------DON'T RUN THE COMPLETE SCRIPT IN ONE GO USE SELECTED PART ONLY OR READ WHOLE FILE BEFORE RUNNING---------------------------------

-- Create database and use it
CREATE DATABASE Staging_Area_Northwind;
GO

USE Staging_Area_Northwind;
GO

-- 1. Region
CREATE TABLE Region (
    RegionID INT PRIMARY KEY,
    RegionDescription NVARCHAR(100) NOT NULL
);
GO

-- 2. Territories
CREATE TABLE Territories (
    TerritoryID INT PRIMARY KEY,
    TerritoryDescription NVARCHAR(100) NOT NULL,
    RegionID INT NOT NULL,
    CONSTRAINT FK_Territories_Region FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);
GO

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(400) NULL
);
GO

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    CompanyName NVARCHAR(150) NOT NULL,
    ContactName NVARCHAR(100),
    ContactTitle NVARCHAR(100),
    Address NVARCHAR(200),
    City NVARCHAR(100),
    Region NVARCHAR(100),
    PostalCode NVARCHAR(20),
    Country NVARCHAR(100),
    Phone NVARCHAR(50)
    -- Fax and HomePage removed as requested
);
GO

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    LastName NVARCHAR(50) NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    Title NVARCHAR(100),
    TitleOfCourtesy NVARCHAR(50),
    BirthDate DATE,
    HireDate DATE,
    Address NVARCHAR(200),
    City NVARCHAR(100),
    Region NVARCHAR(100),
    PostalCode NVARCHAR(20),
    Country NVARCHAR(100),
    HomePhone NVARCHAR(50),
    ReportsTo INT NULL,
    CONSTRAINT FK_Employees_ReportsTo FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID)
    -- Extension, Photo, Notes, PhotoPath removed
);
GO

CREATE TABLE Customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CompanyName NVARCHAR(150) NOT NULL,
    ContactName NVARCHAR(100),
    ContactTitle NVARCHAR(100),
    Address NVARCHAR(200),
    City NVARCHAR(100),
    Region NVARCHAR(100),
    PostalCode NVARCHAR(20),
    Country NVARCHAR(100),
    Phone NVARCHAR(50),
	Gender NVARCHAR(50)
    -- Gender Added Downward
);
GO

-- 7. Shippers
CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY,
    CompanyName NVARCHAR(150) NOT NULL,
    Phone NVARCHAR(50)
);
GO

-- 8. Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(200) NOT NULL,
    SupplierID INT NOT NULL,
    CategoryID INT NOT NULL,
    QuantityPerUnit NVARCHAR(100),
    UnitPrice DECIMAL(10,2),
    UnitsInStock INT,
    UnitsOnOrder INT,
    ReorderLevel INT,
    Discontinued BIT,
    CONSTRAINT FK_Products_Suppliers FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
GO
-- 9. Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(10) NOT NULL,
    EmployeeID INT NOT NULL,
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipVia INT NULL, -- ShipperID
    Freight DECIMAL(10,2),
    ShipName NVARCHAR(200),
    ShipAddress NVARCHAR(200),
    ShipCity NVARCHAR(100),
    ShipRegion NVARCHAR(100),
    ShipPostalCode NVARCHAR(20),
    ShipCountry NVARCHAR(100),
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CONSTRAINT FK_Orders_Employees FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    CONSTRAINT FK_Orders_Shippers FOREIGN KEY (ShipVia) REFERENCES Shippers(ShipperID)
);
GO

-- 10. OrderDetails (junction)
CREATE TABLE OrderDetails (
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    UnitPrice DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(4,2),
    CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderID, ProductID),
    CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_OrderDetails_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO

-- 11. EmployeeTerritories (junction)
CREATE TABLE EmployeeTerritories (
    EmployeeID INT NOT NULL,
    TerritoryID INT NOT NULL,
    CONSTRAINT PK_EmployeeTerritories PRIMARY KEY (EmployeeID, TerritoryID),
    CONSTRAINT FK_ET_Employees FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    CONSTRAINT FK_ET_Territories FOREIGN KEY (TerritoryID) REFERENCES Territories(TerritoryID)
);
GO

CREATE TABLE STG_Customer_Gender_Combined (
    Name VARCHAR(100),
	Gender NVARCHAR(50)
);

CREATE TABLE STG_Time (
    TimeKey INT NOT NULL PRIMARY KEY,   -- e.g., 20251212
    [Date] DATE NOT NULL,
    DayNbWeek INT NULL,
    DayNbMonth INT NULL,
    DayNbYear INT NULL,
    MonthName NVARCHAR(50) NULL,
    Quarter INT NULL,
    [Year] INT NULL
);
GO

CREATE TABLE STG_FactInternetSales (
    CustomerID NVARCHAR(50) NOT NULL,
    EmployeeID INT NOT NULL,
    OrderDate DATE NOT NULL,
    ShipperID INT NULL,
    ProductID INT NOT NULL,
    SupplierID INT NULL,
    UnitPrice DECIMAL(18,2) NOT NULL,
    Quantity INT NOT NULL,
    SalesAmount AS (UnitPrice * Quantity) PERSISTED
);


--------------------------MUST READ THE BELOW INSTRUCTIONS TO HELP BETER UNDERSTAND------------------

---------------------------Must RUN SQL Otherwise Error since table Modified afterwards---------------
ALTER TABLE Customers
ADD Gender NVARCHAR(50) NULL;
------------------------------------------------------------------------------------------------------



----------------------------For Checking values Comment them if not needed right now--------------------

SELECT TOP 20 *
FROM STG_FactInternetSales;


Select * from Territories;
Select * from Employees;
Select * from EmployeeTerritories;
Select * from Region;
Select * from OrderDetails;
Select * from Orders;
Select * from Products;
Select * from Suppliers;
Select * from Shippers;
Select * from Categories;
Select * from Customers;
Select * from STG_Customer_Gender_Combined;
Select * from STG_Time;
Select * from STG_FactInternetSales;

DELETE FROM EmployeeTerritories;
DELETE FROM OrderDetails;
DELETE FROM Orders;
DELETE FROM Products;
DELETE FROM Employees;
DELETE FROM Customers;
DELETE FROM Shippers;
DELETE FROM Suppliers;
DELETE FROM Categories;
DELETE FROM Territories;
DELETE FROM Region;
DELETE FROM STG_Customer_Gender_Combined;
DELETE FROM STG_Time;
DELETE FROM STG_FactInternetSales;

SELECT 
    MIN(OrderDate) AS MinDate,
    MAX(OrderDate) AS MaxDate
FROM Orders;


SELECT TOP 10 * FROM STG_Time ORDER BY Date;
SELECT COUNT(*) FROM STG_Time;





