USE [Final_test_DMS]
GO

CREATE PROCEDURE [dbo].[CalculateTotalSalariesByDepartment]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        d.[Departmentcode],
        d.[departmentname],
        SUM(s.[Netsalary]) AS TotalDepartmentSalary
    FROM 
        [dbo].[Department] d
        LEFT JOIN [dbo].[Employee] e ON d.[Departmentcode] = e.[Departmentcode]
        LEFT JOIN [dbo].[Salary] s ON e.[Employeecode] = s.[Employeecode]
    GROUP BY 
        d.[Departmentcode],
        d.[departmentname]
    ORDER BY 
        d.[Departmentcode] ASC;

END;
GO