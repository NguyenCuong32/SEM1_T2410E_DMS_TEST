CREATE DATABASE HumanManagementFinalTest
GO

USE [HumanManagementFinalTest]
GO

/****** Object:  Table [dbo].[Employees]    Script Date: 3/13/2025 6:16:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employees](
	[EmpCode] [char](2) NOT NULL,
	[EmpName] [nvarchar](max) NOT NULL,
	[DeptCode] [varchar](10) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmpCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Salaries]    Script Date: 3/13/2025 6:17:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Salaries](
	[EmpCode] [char](2) NOT NULL,
	[BasicSalary] [int] NULL,
	[GrossSalary] [int] NULL,
	[NetSalary] [int] NULL,
 CONSTRAINT [PK_Salaries] PRIMARY KEY CLUSTERED 
(
	[EmpCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Salaries]  WITH CHECK ADD  CONSTRAINT [FK_Salaries_Employees] FOREIGN KEY([EmpCode])
REFERENCES [dbo].[Employees] ([EmpCode])
GO

ALTER TABLE [dbo].[Salaries] CHECK CONSTRAINT [FK_Salaries_Employees]
GO

/****** Object:  Table [dbo].[WorkingDays]    Script Date: 3/13/2025 6:17:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WorkingDays](
	[EmpCode] [char](2) NOT NULL,
	[WorkingDays] [int] NOT NULL,
	[WithPay] [int] NOT NULL,
	[WithoutPay] [int] NOT NULL,
 CONSTRAINT [PK_WorkingDays] PRIMARY KEY CLUSTERED 
(
	[EmpCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[WorkingDays]  WITH CHECK ADD  CONSTRAINT [FK_WorkingDays_Employees] FOREIGN KEY([EmpCode])
REFERENCES [dbo].[Employees] ([EmpCode])
GO

ALTER TABLE [dbo].[WorkingDays] CHECK CONSTRAINT [FK_WorkingDays_Employees]
GO

INSERT INTO dbo.Employees Values('A1',N'Nguyễn Văn A','IT')
INSERT INTO dbo.Employees Values('A2',N'Lê Thị Bình','IT')
INSERT INTO dbo.Employees Values('B1',N'Nguyễn Lan','HR')
INSERT INTO dbo.Employees Values('D1',N'Mai Tuấn Anh','HR')
INSERT INTO dbo.Employees Values('C1',N'Hà Thị Lan','HR')
INSERT INTO dbo.Employees Values('C2',N'Lê Tú Chinh','SALE')
INSERT INTO dbo.Employees Values('D2',N'Trần Văn Toàn','HR')
INSERT INTO dbo.Employees Values('A3',N'Trần Văn Nam','IT')
INSERT INTO dbo.Employees Values('B2',N'Huỳnh Anh','SALE')

INSERT INTO dbo.WorkingDays Values('A1',22,0,0)
INSERT INTO dbo.WorkingDays Values('A2',21,1,0)
INSERT INTO dbo.WorkingDays Values('B1',20,1,1)
INSERT INTO dbo.WorkingDays Values('D1',20,1,1)
INSERT INTO dbo.WorkingDays Values('C1',22,0,0)
INSERT INTO dbo.WorkingDays Values('C2',22,0,0)
INSERT INTO dbo.WorkingDays Values('D2',22,0,0)
INSERT INTO dbo.WorkingDays Values('A3',22,0,0)
INSERT INTO dbo.WorkingDays Values('B2',21,1,0)

INSERT INTO dbo.Salaries Values('A1',1000,22000,20000)
INSERT INTO dbo.Salaries Values('A2',1200,26400,23000)
INSERT INTO dbo.Salaries Values('B1',600,13200,12000)
INSERT INTO dbo.Salaries Values('D1',500,11000,10000)
INSERT INTO dbo.Salaries Values('C1',500,11000,10000)
INSERT INTO dbo.Salaries Values('C2',1200,26400,23000)
INSERT INTO dbo.Salaries Values('D2',500,11000,10000)
INSERT INTO dbo.Salaries Values('A3',1200,26400,23000)
INSERT INTO dbo.Salaries Values('B2',1200,26400,23000)

SELECT * FROM dbo.Employees
SELECT * FROM dbo.WorkingDays
SELECT *, BasicSalary + GrossSalary + NetSalary as FullSalary FROM dbo.Salaries