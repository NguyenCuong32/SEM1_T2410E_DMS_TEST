USE [Final_test_DMS]
GO

/****** Object:  Table [dbo].[Department]    Script Date: 13/03/2025 18:33:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Department](
	[Departmentcode] [char](5) NOT NULL,
	[departmentname] [nvarchar](128) NULL,
	[Employeename] [nvarchar](128) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Departmentcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [Final_test_DMS]
GO

INSERT INTO [dbo].[Department] ([Departmentcode], [departmentname], [Employeename])
VALUES 
    ('IT', N'Thông Tin', NULL),
    ('HR', N'Nhân Sự', NULL),
    ('SALE', N'Bán Hàng', NULL);
GO