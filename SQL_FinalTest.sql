CREATE DATABASE T2410E-DMS-TEST;
GO

USE T2410E-DMS-TEST;
GO



CREATE TABLE dbo.Departments (
    DeptCode VARCHAR(10) PRIMARY KEY, 
    DeptName NVARCHAR(50) NOT NULL    
);


CREATE TABLE dbo.Employees (
    EmployeeCode VARCHAR(10) PRIMARY KEY, 
    EmployeeName NVARCHAR(100) NOT NULL,  
    DeptCode VARCHAR(10) NOT NULL,         
    FOREIGN KEY (DeptCode) REFERENCES dbo.Departments(DeptCode) 
);


CREATE TABLE dbo.Salaries (
    SalaryID INT IDENTITY(1,1) PRIMARY KEY, 
    EmployeeCode VARCHAR(10) NOT NULL,      
    WorkingDays INT NOT NULL,        
    DaysOffWithPay INT NOT NULL,        
    DaysOffWithoutPay INT NOT NULL,          
    BasicSalary DECIMAL(10,2) NOT NULL,      
    GrossSalary DECIMAL(10,2) NOT NULL,      
    NetSalary DECIMAL(10,2) NOT NULL,        
    FOREIGN KEY (EmployeeCode) REFERENCES dbo.Employees(EmployeeCode) 
);


INSERT INTO dbo.Departments (DeptCode, DeptName) VALUES
('IT', 'Information Technology'),
('HR', 'Human Resources'),
('SALE', 'Sales');


INSERT INTO dbo.Employees (EmployeeCode, EmployeeName, DeptCode) VALUES
('A1', N'Nguyễn Văn A', 'IT'),
('A2', N'Lê Thị Bình', 'IT'),
('A3', N'Trần Văn Nam', 'IT'),
('B1', N'Nguyễn Lan', 'HR'),
('D1', N'Mai Tuấn Anh', 'HR'),
('C1', N'Hà Thị Lan', 'HR'),
('D2', N'Trần Văn Toàn', 'HR'),
('C2', N'Lê Tú Chinh', 'SALE'),
('B2', N'Huỳnh Anh', 'SALE');


INSERT INTO dbo.Salaries (EmployeeCode, WorkingDays, DaysOffWithPay, DaysOffWithoutPay, BasicSalary, GrossSalary, NetSalary) VALUES
('A1', 22, 0, 0, 1000, 22000, 20000),
('A2', 21, 1, 0, 1200, 26400, 23000),
('A3', 22, 0, 0, 1200, 26400, 23000),
('B1', 20, 1, 1, 600, 13200, 12000),
('D1', 20, 1, 1, 500, 11000, 10000),
('C1', 22, 0, 0, 500, 11000, 10000),
('D2', 22, 0, 0, 500, 11000, 10000),
('C2', 22, 0, 0, 1200, 26400, 23000),
('B2', 21, 1, 0, 1200, 26400, 23000);

CREATE PROCEDURE GetTotalSalaryByDepartment
AS
BEGIN
    SELECT e.EmployeeCode, e.EmployeeName, d.DeptName, 
           s.WorkingDays, s.DaysOffWithPay, s.DaysOffWithoutPay,
           s.BasicSalary, s.GrossSalary, s.NetSalary
    FROM dbo.Salaries s
    JOIN dbo.Employees e ON s.EmployeeCode = e.EmployeeCode
    JOIN dbo.Departments d ON e.DeptCode = d.DeptCode
    ORDER BY d.DeptCode, e.EmployeeCode;

    SELECT d.DeptCode, d.DeptName, SUM(s.NetSalary) AS TotalNetSalary
    FROM dbo.Salaries s
    JOIN dbo.Employees e ON s.EmployeeCode = e.EmployeeCode
    JOIN dbo.Departments d ON e.DeptCode = d.DeptCode
    GROUP BY d.DeptCode, d.DeptName
    ORDER BY d.DeptCode ASC;
END;

EXEC GetTotalSalaryByDepartment;
