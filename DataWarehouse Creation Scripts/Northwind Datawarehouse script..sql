
---------------	IMPORTANT NOTE--------------------------------------------------------------------------------
----------------DON'T RUN THE COMPLETE SCRIPT IN ONE GO USE SELECTED PART ONLY OR READ WHOLE FILE BEFORE RUNNING---------------------------------



IF DB_ID('DW_Northwind') IS NULL
BEGIN
    CREATE DATABASE [DW_Northwind];
END;
GO

USE [DW_Northwind];
GO

-- Drop tables if they exist (in dependency order)
IF OBJECT_ID('dbo.Sales','U') IS NOT NULL DROP TABLE dbo.Sales;
IF OBJECT_ID('dbo.Time','U') IS NOT NULL DROP TABLE dbo.Time;
IF OBJECT_ID('dbo.Shipper','U') IS NOT NULL DROP TABLE dbo.Shipper;
IF OBJECT_ID('dbo.Supplier','U') IS NOT NULL DROP TABLE dbo.Supplier;
IF OBJECT_ID('dbo.Product','U') IS NOT NULL DROP TABLE dbo.Product;
IF OBJECT_ID('dbo.Category','U') IS NOT NULL DROP TABLE dbo.Category;
IF OBJECT_ID('dbo.Employee','U') IS NOT NULL DROP TABLE dbo.Employee;
IF OBJECT_ID('dbo.EmployeeCity','U') IS NOT NULL DROP TABLE dbo.EmployeeCity;
IF OBJECT_ID('dbo.Customer','U') IS NOT NULL DROP TABLE dbo.Customer;
IF OBJECT_ID('dbo.CustomerContactCategory','U') IS NOT NULL DROP TABLE dbo.CustomerContactCategory;
GO

-- 1. Category (business key - NOT IDENTITY)
CREATE TABLE dbo.Category (
    CategoryKey INT NOT NULL PRIMARY KEY,   -- business key (not surrogate)
    CategoryName NVARCHAR(200) NOT NULL
);
GO

-- 2. Product (business key - NOT IDENTITY)
CREATE TABLE dbo.Product (
    ProductKey INT NOT NULL PRIMARY KEY,    -- business key (not surrogate)
    ProductName NVARCHAR(250) NOT NULL,
    CategoryKey INT NOT NULL,               -- FK -> Category
    CONSTRAINT FK_Product_Category FOREIGN KEY (CategoryKey)
        REFERENCES dbo.Category (CategoryKey)
);
GO

-- 3. Supplier (business key - NOT IDENTITY)
CREATE TABLE dbo.Supplier (
    SupplierKey INT NOT NULL PRIMARY KEY,   -- business key (not surrogate)
    CompanyName NVARCHAR(250) NOT NULL
);
GO

-- 4. Shipper (business key - NOT IDENTITY)
CREATE TABLE dbo.Shipper (
    ShipperKey INT NOT NULL PRIMARY KEY,    -- business key (not surrogate)
    CompanyName NVARCHAR(250) NOT NULL
);
GO

-- 5. EmployeeCity (surrogate PK, IDENTITY)
CREATE TABLE dbo.EmployeeCity (
    EmpCityKey INT IDENTITY(1,1) NOT NULL PRIMARY KEY, -- surrogate key
    City NVARCHAR(200) NOT NULL,
    Country NVARCHAR(200) NOT NULL
);
GO

-- 6. CustomerContactCategory (surrogate PK, IDENTITY)
CREATE TABLE dbo.CustomerContactCategory (
    CustomerCategKey INT IDENTITY(1,1) NOT NULL PRIMARY KEY, -- surrogate key
    Gender NVARCHAR(50) NOT NULL
);
GO

-- 7. Customer (surrogate PK identity; CustomerID is business key)
CREATE TABLE dbo.Customer (
    CustomerKey INT IDENTITY(1,1) NOT NULL PRIMARY KEY, -- surrogate PK
    CustomerID NVARCHAR(50) NOT NULL,                   -- business key from OLTP
    CompanyName NVARCHAR(250) NULL,
    ContactName NVARCHAR(200) NULL,
    CustomerCategKey INT NULL,                          -- FK -> CustomerContactCategory
    CONSTRAINT UQ_Customer_CustomerID UNIQUE (CustomerID),
    CONSTRAINT FK_Customer_CustomerCateg FOREIGN KEY (CustomerCategKey)
        REFERENCES dbo.CustomerContactCategory (CustomerCategKey)
);
GO

-- 8. Employee (business key - NOT IDENTITY)
-- Note: Country removed (country comes from EmployeeCity)
CREATE TABLE dbo.Employee (
    EmployeeKey INT NOT NULL PRIMARY KEY,   -- business key (not surrogate)
    FirstName NVARCHAR(150) NOT NULL,
    LastName NVARCHAR(150) NOT NULL,
    Title NVARCHAR(150) NULL,
    BirthDate DATE NULL,
    HireDate DATE NULL,
    Address NVARCHAR(500) NULL,
    EmpCityKey INT NULL,                    -- FK -> EmployeeCity
    CONSTRAINT FK_Employee_EmployeeCity FOREIGN KEY (EmpCityKey)
        REFERENCES dbo.EmployeeCity (EmpCityKey)
);
GO

-- 9. Time (TimeKey INT e.g., YYYYMMDD, not identity)
CREATE TABLE dbo.Time (
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

-- 10. Sales (fact) - SalesKey surrogate identity PK
CREATE TABLE dbo.Sales (
    SalesKey INT IDENTITY(1,1) NOT NULL PRIMARY KEY, -- surrogate PK
    CustomerKey INT NOT NULL,                        -- FK -> Customer
    EmployeeKey INT NOT NULL,                        -- FK -> Employee (business key)
    OrderDateKey INT NOT NULL,                       -- FK -> Time(TimeKey)
    ShipperKey INT NULL,                             -- FK -> Shipper (business key)
    ProductKey INT NOT NULL,                         -- FK -> Product (business key)
    SupplierKey INT NULL,                            -- FK -> Supplier (business key)
    UnitPrice DECIMAL(18,2) NOT NULL,                -- price at sale
    Quantity INT NOT NULL,
    SalesAmount DECIMAL(18,2) NOT NULL,
    CONSTRAINT FK_Sales_Customer FOREIGN KEY (CustomerKey)
        REFERENCES dbo.Customer (CustomerKey),
    CONSTRAINT FK_Sales_Employee FOREIGN KEY (EmployeeKey)
        REFERENCES dbo.Employee (EmployeeKey),
    CONSTRAINT FK_Sales_Time FOREIGN KEY (OrderDateKey)
        REFERENCES dbo.Time (TimeKey),
    CONSTRAINT FK_Sales_Shipper FOREIGN KEY (ShipperKey)
        REFERENCES dbo.Shipper (ShipperKey),
    CONSTRAINT FK_Sales_Product FOREIGN KEY (ProductKey)
        REFERENCES dbo.Product (ProductKey),
    CONSTRAINT FK_Sales_Supplier FOREIGN KEY (SupplierKey)
        REFERENCES dbo.Supplier (SupplierKey)
);
GO

-- Script complete.



----------------------------------For Checking Values------------------------------------------------------

Select * from Category;
Select * from Product;
Select * from Shipper;
Select * from Supplier;
Select * from EmployeeCity;
Select * from CustomerContactCategory;
Select * from Customer;
Select * from Employee;
Select * from Time;
Select * from Sales;

DELETE FROM dbo.Sales;
-- 2. Delete from child dimensions (dependent on parent tables)
DELETE FROM dbo.Customer;
DELETE FROM dbo.Employee;
DELETE FROM dbo.Product;
DELETE FROM dbo.Shipper;
DELETE FROM dbo.Supplier;
-- 3. Delete from parent dimensions (no dependencies)
DELETE FROM dbo.CustomerContactCategory;
DELETE FROM dbo.EmployeeCity;
DELETE FROM dbo.Category;

