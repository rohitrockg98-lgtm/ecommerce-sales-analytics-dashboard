-- ==========================================
-- E-Commerce Sales Analytics Database Schema
-- ==========================================

CREATE DATABASE IF NOT EXISTS ecommerce_analysis;
USE ecommerce_analysis;

-- ==========================================
-- Customers Table
-- ==========================================

CREATE TABLE Customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    City VARCHAR(50),
    State VARCHAR(50)
);

-- ==========================================
-- Products Table
-- ==========================================

CREATE TABLE Products (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10,2) NOT NULL
);

-- ==========================================
-- Orders Table
-- ==========================================

CREATE TABLE Orders (
    OrderID VARCHAR(10) PRIMARY KEY,
    CustomerID VARCHAR(10) NOT NULL,
    OrderDate DATE NOT NULL,

    CONSTRAINT fk_customer
    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);

-- ==========================================
-- OrderDetails Table
-- ==========================================

CREATE TABLE OrderDetails (
    OrderID VARCHAR(10) NOT NULL,
    ProductID VARCHAR(10) NOT NULL,
    Quantity INT NOT NULL,

    CONSTRAINT fk_order
    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID),

    CONSTRAINT fk_product
    FOREIGN KEY (ProductID)
    REFERENCES Products(ProductID)
);