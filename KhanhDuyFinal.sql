CREATE TABLE Department (
    DepartmentCode VARCHAR(10) PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employee (
    EmployeeCode VARCHAR(10) PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentCode VARCHAR(10),
    FOREIGN KEY (DepartmentCode) REFERENCES Department(DepartmentCode)
);

CREATE TABLE SalaryDetails (
    EmployeeCode VARCHAR(10),
    NumberOfWorkingDays INT,
    NumberOfDaysOffWithPay INT,
    NumberOfDaysOffWithoutPay INT,
    BasicSalary DECIMAL(10, 2),
    GrossSalary DECIMAL(10, 2),
    NetSalary DECIMAL(10, 2),
    Note TEXT,
    FOREIGN KEY (EmployeeCode) REFERENCES Employee(EmployeeCode)
);
