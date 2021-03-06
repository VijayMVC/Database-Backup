/****** Object:  StoredProcedure [dbo].[usp_SSIS_Update_EmployeeFact]    Script Date: 5/15/2018 12:09:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[usp_SSIS_Update_EmployeeFact]
 AS UPDATE F SET 
 F.ZW_Franchise_ID = U.ZW_Franchise_ID 
 , F.EmployeeID = U.EmployeeID 
 , F.FirstName = U.FirstName 
 , F.LastName = U.LastName 
 , F.Birthdate = U.Birthdate 
 , F.HireDate = U.HireDate 
 , F.TerminationDate = U.TerminationDate 
 , F.PhoneNumber = U.PhoneNumber 
 , F.PhoneExtention = U.PhoneExtention 
 , F.FaxNumber = U.FaxNumber 
 , F.EmailAddress = U.EmailAddress 
 , F.Address = U.Address 
 , F.City = U.City 
 , F.State = U.State 
 , F.HomePhoneNumber = U.HomePhoneNumber 
 , F.ZipKey = U.ZipKey 
 , F.DepartmentKey = U.DepartmentKey 
 , F.SalesPerson = U.SalesPerson 
 , F.CommissionSales = U.CommissionSales 
 , F.IsActive = U.IsActive 
 , F.OLTP_InsertDate = U.OLTP_InsertDate 
 , F.OLTP_UpdateDate = U.OLTP_UpdateDate 
 , F.UpdateCheckSum = U.UpdateCheckSum 
FROM [Staging].[dbo].[EmployeeFactUpdate] U 
     JOIN [Contact].[EmployeeFact] F ON U.EmployeeKey = F.EmployeeKey 
 WHERE U.EmployeeKey > 0 
 
INSERT INTO  [Contact].[EmployeeFact] 
    ( ZW_Franchise_ID 
 , EmployeeID 
 , FirstName 
 , LastName 
 , Birthdate 
 , HireDate 
 , TerminationDate 
 , PhoneNumber 
 , PhoneExtention 
 , FaxNumber 
 , EmailAddress 
 , Address 
 , City 
 , State 
 , HomePhoneNumber 
 , ZipKey 
 , DepartmentKey 
 , SalesPerson 
 , CommissionSales 
 , IsActive 
 , OLTP_InsertDate 
 , OLTP_UpdateDate 
 , UpdateCheckSum
 , CenterKey 
 ) SELECT ZW_Franchise_ID 
 , EmployeeID 
 , FirstName 
 , LastName 
 , Birthdate 
 , HireDate 
 , TerminationDate 
 , PhoneNumber 
 , PhoneExtention 
 , FaxNumber 
 , EmailAddress 
 , Address 
 , City 
 , State 
 , HomePhoneNumber 
 , ZipKey 
 , DepartmentKey 
 , SalesPerson 
 , CommissionSales 
 , IsActive 
 , OLTP_InsertDate 
 , OLTP_UpdateDate 
 , UpdateCheckSum
 , CenterKey 
 FROM [Staging].[dbo].[EmployeeFactUpdate] WHERE EmployeeKey = 0 
 --TRUNCATE TABLE Staging.dbo.EmployeeFactUpdate 

GO
