-- Create database and use it
IF DB_ID('Northwind_Source1') IS NOT NULL
BEGIN
    ALTER DATABASE Northwind_Source1 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Northwind_Source1;
END
CREATE DATABASE Northwind_Source1;
GO

USE Northwind_Source1;
GO

/******************************************
  Table creation (modified per notes)
  - Customers: no Fax
  - Suppliers: no Fax, no HomePage
  - Categories: no Picture
  - Employees: no Extension, Photo, Notes, PhotoPath
*******************************************/

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

-- 3. Categories (NO Picture column)
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(400) NULL
);
GO

-- 4. Suppliers (NO Fax, NO HomePage)
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

-- 5. Customers (NO Fax)
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
    Phone NVARCHAR(50)
    -- Fax removed
);
GO

-- 6. Employees (NO Extension, Photo, Notes, PhotoPath)
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
