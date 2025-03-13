-- TAO DATABASE 
CREATE DATABASE SEM1_T2410E_DMS_TEST;
GO
--SU DUNG
USE SEM1_T2410E_DMS_TEST;
GO
--TAO CAC BANG
-- TAO BANG DEPARTMENTS
CREATE TABLE Departments (
    DeptCode CHAR(10) PRIMARY KEY,
    DeptName NVARCHAR(50) NOT NULL
);
SELECT *FROM Departments;
--TAO BANG EMPLOYEES
CREATE TABLE Employees (
    EmpCode CHAR(10) PRIMARY KEY,
    EmpName NVARCHAR(255) NOT NULL,
    DeptCode CHAR(10) FOREIGN KEY REFERENCES Departments(DeptCode)
);
SELECT *FROM Employees;
--TAO BANG SALARIES
CREATE TABLE Salaries (
    SalaryID INT IDENTITY(1,1) PRIMARY KEY,
    EmpCode CHAR(10) FOREIGN KEY REFERENCES Employees(EmpCode),
    WorkingDays INT CHECK (WorkingDays >= 0),
    DaysWithPay INT CHECK (DaysWithPay >= 0),
    DaysWithoutPay INT CHECK (DaysWithoutPay >= 0),
    BasicSalary DECIMAL(10,2),
    GrossSalary DECIMAL(10,2),
    NetSalary DECIMAL(10,2),
    Note NVARCHAR(255)
);
SELECT *FROM Salaries;
--THEM DU LIEU VAO TUNG BANG
--BANG DEPARTMENTS
INSERT INTO Departments VALUES
('IT', 'Information Technology'),
('HR', 'Human Resources'),
('SALE', 'Sales');

--BANG EMPLOYEES
INSERT INTO Employees VALUES
('A1', N'Nguyễn Văn A', 'IT'),
('A2', N'Lê Thị Bình', 'IT'),
('B1', N'Nguyễn Lan', 'HR'),
('D1', N'Mai Tuấn Anh', 'HR'),
('C1', N'Hà Thị Lan', 'HR'),
('C2', N'Lê Tú Chinh', 'SALE'),
('D2', N'Trần Văn Toàn', 'HR'),
('A3', N'Trần Văn Nam', 'IT'),
('B2', N'Huỳnh Anh', 'SALE');
--BANG SALARIES
INSERT INTO Salaries (EmpCode, WorkingDays, DaysWithPay, DaysWithoutPay, BasicSalary, GrossSalary, NetSalary, Note) VALUES
('A1', 22, 0, 0, 1000, 22000, 20000, NULL),
('A2', 21, 1, 0, 1200, 26400, 23000, NULL),
('B1', 13, 2, 0, 500, 11000, 10000, NULL),
('D1', 22, 0, 0, 1000, 22000, 20000, NULL),
('C1', 22, 0, 0, 1000, 22000, 20000, NULL),
('C2', 21, 1, 0, 1200, 26400, 23000, NULL),
('D2', 22, 0, 0, 500, 11000, 10000, NULL),
('A3', 21, 1, 0, 1200, 26400, 23000, NULL),
('B2', 21, 1, 0, 1200, 26400, 23000, NULL);

--TINH TONG LUONG NHAN VIEN CUA MOI PHONG BAN VA SAP XEP CHUNG THEO MA PHONG BAN VOI THU TU TANG DAN.

CREATE PROCEDURE TOTALEMPLOYEESALARYINASCRIPTINGORDER
AS
BEGIN
    SELECT E.DeptCode, D.DeptName, SUM(S.NetSalary) AS TotalSalary
    FROM Salaries S
    JOIN Employees E ON S.EmpCode = E.EmpCode
    JOIN Departments D ON E.DeptCode = D.DeptCode
    GROUP BY E.DeptCode, D.DeptName
    ORDER BY E.DeptCode ASC;
END;

EXEC TOTALEMPLOYEESALARYINASCRIPTINGORDER ;
