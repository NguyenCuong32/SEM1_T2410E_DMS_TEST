CREATE TABLE [dbo].[Employees] (
    [Employee_Code]   VARCHAR (10)   NOT NULL,
    [Employee_Name]   NVARCHAR (256) NULL,
    [Department_Code] VARCHAR (10)   NULL,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED ([Employee_Code] ASC)
);
INSERT INTO Employees (Employee_Code, Employee_Name, Department_Code) VALUES
('A1', N'Nguyễn Văn A', 'IT'),
('A2', N'Lê Thị Bình', 'IT'),
('B1', N'Nguyễn Lan', 'HR'),
('D1', N'Mai Tuấn Anh', 'HR'),
('C1', N'Hà Thị Lan', 'HR'),
('C2', N'Lê Tú Chinh', 'SALE'),
('D2', N'Trần Văn Toàn', 'HR'),
('A3', N'Trần Văn Nam', 'IT'),
('B2', N'Huỳnh Anh', 'SALE');

CREATE TABLE [dbo].[Departments] (
    [Department_Code] VARCHAR (10)   NOT NULL,
    [Department_Name] NVARCHAR (256) NULL,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED ([Department_Code] ASC)
);
INSERT INTO Departments (Department_Code, Department_Name) VALUES
('IT', N'Công nghệ thông tin'),
('HR', N'Nhân sự'),
('SALE', N'Kinh doanh');

CREATE TABLE [dbo].[SalaryStructure] (
    [JobLevel]    NVARCHAR (50)  NOT NULL,
    [BasicSalary] INT           NULL,
    CONSTRAINT [PK_SalaryStructure] PRIMARY KEY CLUSTERED ([JobLevel] ASC)
);
INSERT INTO SalaryStructure (JobLevel, BasicSalary) VALUES
('IT Senior', 1200),
('IT Junior', 1000),
('HR Senior', 1100),
('HR Junior', 600),
('Sales Rep', 1200);

CREATE TABLE [dbo].[Payroll] (
    [Employee_Code]     VARCHAR (10)  NOT NULL,
    [Working_Days]      INT           NULL,
    [Paid_Leave_Days]   INT           NULL,
    [Unpaid_Leave_Days] INT           NULL,
    [JobLevel]         NVARCHAR (50) NULL,
    CONSTRAINT [PK_Payroll] PRIMARY KEY CLUSTERED ([Employee_Code] ASC)
);
NSERT INTO Payroll (Employee_Code, Working_Days, Paid_Leave_Days, Unpaid_Leave_Days, JobLevel) VALUES
('A1', 22, 0, 0, 'IT Junior'),
('A2', 21, 1, 0, 'IT Senior'),
('B1', 20, 1, 0, 'HR Junior'),
('D1', 22, 0, 0, 'HR Senior'),
('C1', 22, 0, 0, 'HR Junior'),
('C2', 22, 0, 0, 'Sales Rep'),
('D2', 22, 0, 0, 'HR Junior'),
('A3', 22, 0, 0, 'IT Senior'),
('B2', 21, 1, 0, 'Sales Rep');
