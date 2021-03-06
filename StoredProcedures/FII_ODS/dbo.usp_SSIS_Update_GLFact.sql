/****** Object:  StoredProcedure [dbo].[usp_SSIS_Update_GLFact]    Script Date: 5/15/2018 12:09:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[usp_SSIS_Update_GLFact]
 AS UPDATE F SET 
 F.ZW_Franchise_ID = U.ZW_Franchise_ID 
 , F.ID = U.ID 
 , F.TransactionDateTime = U.TransactionDateTime 
 , F.OrderID = U.OrderID 
 , F.OrderKey = U.OrderKey 
 , F.CustomerID = U.CustomerID 
 , F.CustomerKey = U.CustomerKey 
 , F.AccountCode = U.AccountCode 
 , F.UserID = U.UserID 
 , F.UserKey = U.UserKey 
 , F.Amount = U.Amount 
 , F.DescriptionKey = U.DescriptionKey 
 , F.Closed = U.Closed 
 , F.ClosedDate = U.ClosedDate 
 , F.Exported = U.Exported 
 , F.ExportedDate = U.ExportedDate 
 , F.ExportedBatch = U.ExportedBatch 
 , F.EnteredByID = U.EnteredByID 
 , F.EnteredByKey = U.EnteredByKey 
 , F.SubAccountCode = U.SubAccountCode 
 , F.Taxable = U.Taxable 
 , F.Consolidated = U.Consolidated 
 , F.Category = U.Category 
 , F.RoyaltyGroupID = U.RoyaltyGroupID 
 , F.ModifiedByComputerKey = U.ModifiedByComputerKey 
 , F.OrderDetailID = U.OrderDetailID 
 , F.OrderDetailKey = U.OrderDetailKey 
 , F.ProductID = U.ProductID 
 --, F.ProductKey = U.ProductKey 
 , F.OLTP_InsertDate = U.OLTP_InsertDate 
 , F.OLTP_UpdateDate = U.OLTP_UpdateDate 
 , F.UpdateCheckSum = U.UpdateCheckSum 
 , F.CenterKey = U.CenterKey
 , F.System = 'FSI'
FROM [Staging].[dbo].[GLFactUpdate] U 
     JOIN [GL].[GLFact] F ON U.GLFactKey = F.GLFactKey 
 WHERE U.GLFactKey > 0 
 
INSERT INTO  [GL].[GLFact] 
    ( ZW_Franchise_ID 
 , ID 
 , TransactionDateTime 
 , OrderID 
 , OrderKey 
 , CustomerID 
 , CustomerKey 
 , AccountCode 
 , UserID 
 , UserKey 
 , Amount 
 , DescriptionKey 
 , Closed 
 , ClosedDate 
 , Exported 
 , ExportedDate 
 , ExportedBatch 
 , EnteredByID 
 , EnteredByKey 
 , SubAccountCode 
 , Taxable 
 , Consolidated 
 , Category 
 , RoyaltyGroupID 
 , ModifiedByComputerKey 
 , OrderDetailID 
 , OrderDetailKey 
 , ProductID 
-- , ProductKey 
 , OLTP_InsertDate 
 , OLTP_UpdateDate 
 , UpdateCheckSum 
 , CenterKey
 , System
 ) SELECT ZW_Franchise_ID 
 , ID 
 , TransactionDateTime 
 , OrderID 
 , OrderKey 
 , CustomerID 
 , CustomerKey 
 , AccountCode 
 , UserID 
 , UserKey 
 , Amount 
 , DescriptionKey 
 , Closed 
 , ClosedDate 
 , Exported 
 , ExportedDate 
 , ExportedBatch 
 , EnteredByID 
 , EnteredByKey 
 , SubAccountCode 
 , Taxable 
 , Consolidated 
 , Category 
 , RoyaltyGroupID 
 , ModifiedByComputerKey 
 , OrderDetailID 
 , OrderDetailKey 
 , ProductID 
-- , ProductKey 
 , OLTP_InsertDate 
 , OLTP_UpdateDate 
 , UpdateCheckSum 
 , CenterKey
 , 'FSI'
 FROM [Staging].[dbo].[GLFactUpdate] WHERE GLFactKey = 0 

--SELECT *
--INTO FII_ODS.dbo.GLFactUpdate
--FROM Staging.dbo.GLFactUpdate

--SELECT *
--INTO FII_ODS.dbo.GLFACTStage
--FROM Staging.dbo.GLFACT

TRUNCATE TABLE Staging.dbo.GLFactUpdate 


-- Updates GL_Fact for New Dashboards
UPDATE GL.GLFact
  SET GL_Account =
  CASE
    When GL.GLFact.AccountCode In (4001, 4003, 4110, 4120) And
    GL.GLFact.SubAccountCode = 100 Then 4110
    When GL.GLFact.AccountCode In (4001, 4003, 4110, 4120) And
    GL.GLFact.SubAccountCode = 200 Then 4110
    When GL.GLFact.AccountCode In (4001, 4002, 4003, 4110, 4120) And
    GL.GLFact.SubAccountCode = 400 Then 4115
    When GL.GLFact.AccountCode In (4120) Or
    GL.GLFact.AccountCode In (4001, 4003, 4110) And GL.GLFact.SubAccountCode =
    300 Then 4401
    When GL.GLFact.AccountCode In (4002) And GL.GLFact.SubAccountCode <>
    400 Then 4120 Else 4140 End
From
  GL.GLFact
Where
  GL.GLFact.AccountCode In (4001, 4002, 4003, 4110, 4120) 
  AND System='FSI'
  AND GL_Account IS null

GO
