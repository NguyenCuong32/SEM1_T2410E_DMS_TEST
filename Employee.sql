USE [Final_test_DMS]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 13/03/2025 18:35:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[Employeecode] [varchar](10) NOT NULL,
	[Employeename] [nvarchar](128) NULL,
	[Departmentcode] [char](5) NOT NULL,
	[Dayoffwithpay] [int] NULL,
	[Dayoffwithoutpay] [int] NULL,
	[Workingday] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employeecode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([Departmentcode])
REFERENCES [dbo].[Department] ([Departmentcode])
GO

ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO


