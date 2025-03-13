USE [Final_test_DMS]
GO

/****** Object:  Table [dbo].[Salary]    Script Date: 13/03/2025 18:47:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Salary](
	[Employeecode] [varchar](10) NULL,
	[Departmentcode] [char](5) NOT NULL,
	[Basicsalary] [int] NULL,
	[Grosssalary] [int] NULL,
	[Netsalary] [int] NULL,
	[Totalsalary] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Salary] PRIMARY KEY CLUSTERED 
(
	[Totalsalary] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_Department] FOREIGN KEY([Departmentcode])
REFERENCES [dbo].[Department] ([Departmentcode])
GO

ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_Department]
GO

ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_Employee] FOREIGN KEY([Employeecode])
REFERENCES [dbo].[Employee] ([Employeecode])
GO

ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_Employee]
GO


