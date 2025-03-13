CREATE DATABASE SEM_FINAL;
GO
USE SEM_FINAL;
GO

CREATE TABLE EmployeeName(
    EmployeeID char(5) PRIMARY KEY,
    EmployeeName NVARCHAR(50),
    DepartmentCode char(5),

)
GO
CREATE TABLE EmployeeDay(
    AttendanceID int IDENTITY(1,1) PRIMARY KEY,
    EmployeeID char(5),
    WorkingDay int,
    Dayoff_pay int,
    Dayoff_nopay int,
    FOREIGN KEY (EmployeeID) REFERENCES EmployeeName(EmployeeID)
)
GO

CREATE TABLE EmployeeSalary(
    SalaryID int IDENTITY(1,1) PRIMARY KEY,  
    EmployeeID char(5),
    BasicSalary DECIMAL,
    GrossSalary DECIMAL,
    NetSalary DECIMAL,
    FOREIGN KEY (EmployeeID) REFERENCES EmployeeName(EmployeeID)
)
CREATE PROCEDURE TotalSalary
AS 
BEGIN
    SELECT 
        E.EmployeeID,
        E.DepartmentCode,
        SUM(S.BasicSalary) AS TotalBasicSalary,
        SUM(S.GrossSalary) AS TotalGrossSalary,
        SUM(S.NetSalary) AS TotalNetSalary
    FROM EmployeeName E
    INNER JOIN 
        EmployeeDay D on E.EmployeeID = D.EmployeeID
    INNER JOIN
        EmployeeSalary S on E.EmployeeID = S.EmployeeID
    GROUP BY 
        E.EmployeeID,
        E.DepartmentCode
    ORDER BY 
        TotalNetSalary ASC;
END
GO

DELETE From EmployeeName
DELEte from EmployeeDay
DELETE from EmployeeSalary



INSERT INTO EmployeeName VALUES('A1',N'Nguyễn Văn A','IT')
INSERT INTO EmployeeName VALUES('A2',N'Lê Thị Bình','IT')
INSERT INTO EmployeeName VALUES('B1',N'Nguyễn Lan','HR')
INSERT INTO EmployeeName VALUES('D1',N'Mai Tuấn Anh','HR')
INSERT INTO EmployeeName VALUES('C1',N'Hà Thị Lan','HR')
INSERT INTO EmployeeName VALUES('C2',N'Lê Tú Chinh','SALE')
INSERT INTO EmployeeName VALUES('D2',N'Trần Văn Toàn','HR')
INSERT INTO EmployeeName VALUES('A3',N'Trần Văn Nam','IT')
INSERT INTO EmployeeName VALUES('B2',N'Huỳnh Anh','SALE')

INSERT INTO EmployeeDay (EmployeeID,WorkingDay,Dayoff_pay,Dayoff_nopay) VALUES('A1',22,0,0)
INSERT INTO EmployeeDay (EmployeeID,WorkingDay,Dayoff_pay,Dayoff_nopay) VALUES('A2',21,1,0)
INSERT INTO EmployeeDay (EmployeeID,WorkingDay,Dayoff_pay,Dayoff_nopay) VALUES('B1',20,1,1)
INSERT INTO EmployeeDay (EmployeeID,WorkingDay,Dayoff_pay,Dayoff_nopay) VALUES('D1',20,1,1)
INSERT INTO EmployeeDay (EmployeeID,WorkingDay,Dayoff_pay,Dayoff_nopay) VALUES('C1',22,0,0)
INSERT INTO EmployeeDay (EmployeeID,WorkingDay,Dayoff_pay,Dayoff_nopay) VALUES('C2',22,0,0)
INSERT INTO EmployeeDay (EmployeeID,WorkingDay,Dayoff_pay,Dayoff_nopay) VALUES('D2',22,0,0)
INSERT INTO EmployeeDay (EmployeeID,WorkingDay,Dayoff_pay,Dayoff_nopay) VALUES('A3',22,0,0)
INSERT INTO EmployeeDay (EmployeeID,WorkingDay,Dayoff_pay,Dayoff_nopay) VALUES('B2',21,1,0)

INSERT INTO EmployeeSalary(EmployeeID,BasicSalary,GrossSalary,NetSalary) VALUES('A1',1000,22000,20000)
INSERT INTO EmployeeSalary(EmployeeID,BasicSalary,GrossSalary,NetSalary) VALUES('A2',1200,26400,23000)
INSERT INTO EmployeeSalary(EmployeeID,BasicSalary,GrossSalary,NetSalary) VALUES('B1',600,13200,12000)
INSERT INTO EmployeeSalary(EmployeeID,BasicSalary,GrossSalary,NetSalary) VALUES('D1',500,11000,10000)
INSERT INTO EmployeeSalary(EmployeeID,BasicSalary,GrossSalary,NetSalary) VALUES('C1',500,11000,10000)
INSERT INTO EmployeeSalary(EmployeeID,BasicSalary,GrossSalary,NetSalary) VALUES('C2',1200,26400,23000)
INSERT INTO EmployeeSalary(EmployeeID,BasicSalary,GrossSalary,NetSalary) VALUES('D2',500,11000,10000)
INSERT INTO EmployeeSalary(EmployeeID,BasicSalary,GrossSalary,NetSalary) VALUES('A3',1200,26400,23000)
INSERT INTO EmployeeSalary(EmployeeID,BasicSalary,GrossSalary,NetSalary) VALUES('B2',1200,26400,23000)

EXEC TotalSalary


SELECT * FROM EmployeeName
SELECT * FROM EmployeeDay
SELECT * FROM EmployeeSalary

Drop PROCEDURE TotalSalary