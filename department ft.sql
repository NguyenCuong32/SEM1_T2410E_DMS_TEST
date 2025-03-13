USE [final test]
GO

/****** Object:  Table [dbo].[Department]    Script Date: 3/13/2025 6:49:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Department](
	[DepartmentCode] [char](10) NOT NULL,
	[DepartmentName] [nvarchar](128) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [final test]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 3/13/2025 6:50:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[EmployeeCode] [char](10) NOT NULL,
	[EmployeeName] [nvarchar](256) NULL,
	[DepartmentCode] [char](10) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentCode])
REFERENCES [dbo].[Department] ([DepartmentCode])
GO

ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Salary] FOREIGN KEY([EmployeeCode])
REFERENCES [dbo].[Salary] ([EmployeeCode])
GO

ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Salary]
GO

USE [final test]
GO

/****** Object:  Table [dbo].[Salary]    Script Date: 3/13/2025 6:51:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Salary](
	[EmployeeCode] [char](10) NOT NULL,
	[WorkingDays] [int] NULL,
	[DaysOffWithPay] [int] NULL,
	[DaysOffWithoutPay] [int] NULL,
	[BasicSalary] [numeric](10, 3) NULL,
	[GrossSalary] [numeric](10, 3) NULL,
	[NetSalary] [numeric](10, 3) NULL,
 CONSTRAINT [PK_Salary] PRIMARY KEY CLUSTERED 
(
	[EmployeeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO dbo.Department VALUES ('IT', 'Phong IT')
INSERT INTO dbo.Department VALUES ('HR', 'Phong HR')
INSERT INTO dbo.Department VALUES ('SALE', 'Phong Sale')

INSERT INTO dbo.Employee VALUES ('A1', 'Nguyen Van A', 'IT')
INSERT INTO dbo.Employee VALUES ('A2', 'Le Thi Binh', 'IT')
INSERT INTO dbo.Employee VALUES ('A3', 'Tran Van Nam', 'IT')
INSERT INTO dbo.Employee VALUES ('B1', 'Nguyen Lan', 'HR')
INSERT INTO dbo.Employee VALUES ('B2', 'Huynh Anh', 'SALE')
INSERT INTO dbo.Employee VALUES ('C1', 'Ha Thi Lan', 'HR')
INSERT INTO dbo.Employee VALUES ('C2', 'Le Tu Chinh', 'SALE')
INSERT INTO dbo.Employee VALUES ('D1', 'Mai Tuan Anh', 'HR')
INSERT INTO dbo.Employee VALUES ('D2', 'Tran Van Toan', 'HR')

