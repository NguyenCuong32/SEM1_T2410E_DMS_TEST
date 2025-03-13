
CREATE DATABASE ABCCompany;
GO

USE ABCCompany;
GO


CREATE TABLE Department (
    DepartmentCode VARCHAR(10) PRIMARY KEY,
   
);
GO
INSERT INTO Department (DepartmentCode)
VALUES 
('IT'),
('HR'),
('SALE');
GO
CREATE TABLE Employee (
    EmployeeCode VARCHAR(10) PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentCode VARCHAR(10) FOREIGN KEY REFERENCES Department(DepartmentCode)
);
GO


INSERT INTO Employee (EmployeeCode, EmployeeName, DepartmentCode)
VALUES 
('A1', N'Nguyễn Văn A', 'IT'),
('A2', N'Lê Thị Bình', 'IT'),
('B1', N'Nguyễn Lan', 'HR'),
('D1', N'Mai Tuấn Anh', 'HR'),
('C1', N'Hà Thị Lan', 'HR'),
('C2', N'Lê Tú Chinh', 'SALE'),
('D2', N'Trần Văn Toàn', 'HR'),
('A3', N'Trần Văn Nam', 'IT'),
('B2', N'Huỳnh Anh', 'SALE');
GO

CREATE TABLE Salary (
    EmployeeCode VARCHAR(10) FOREIGN KEY REFERENCES Employee(EmployeeCode),
    NumberOfWorkingDays INT,
    NumberOfDaysOffWithPay INT,
    NumberOfDaysOffWithoutPay INT,
    BasicSalary DECIMAL(18, 2),
    GrossSalary DECIMAL(18, 2),
    NetSalary DECIMAL(18, 2)
);
GO


INSERT INTO Salary (EmployeeCode, NumberOfWorkingDays, NumberOfDaysOffWithPay, NumberOfDaysOffWithoutPay, BasicSalary, GrossSalary, NetSalary)
VALUES 
('A1', 22, 0, 0, 1000, 22000, 20000),
('A2', 21, 1, 0, 1200, 26400, 23000),
('B1', 20, 1, 1, 600, 13200, 12000),
('D1', 20, 1, 1, 500, 11000, 10000),
('C1', 22, 0, 0, 500, 11000, 10000),
('C2', 22, 0, 0, 1200, 26400, 23000),
('D2', 22, 0, 0, 500, 11000, 10000),
('A3', 22, 0, 0, 1200, 26400, 23000),
('B2', 21, 1, 0, 1200, 26400, 23000);
GO
CREATE PROCEDURE CalculateTotalSalariesByDepartmen
AS
BEGIN
    SELECT 
        D.DepartmentCode,
        SUM(S.GrossSalary) AS TotalGrossSalary,
        SUM(S.NetSalary) AS TotalNetSalary
    FROM 
        Department D
    INNER JOIN 
        Employee E ON D.DepartmentCode = E.DepartmentCode
    INNER JOIN 
        Salary S ON E.EmployeeCode = S.EmployeeCode
    GROUP BY 
        D.DepartmentCode
    ORDER BY 
        D.DepartmentCode ASC;
END;
GO


EXEC CalculateTotalSalariesByDepartmen;
Select * from Salary
Select * from Employee