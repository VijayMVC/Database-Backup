/****** Object:  StoredProcedure [dbo].[usp_SSIS_Update_AccountCodeDim]    Script Date: 5/15/2018 12:09:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[usp_SSIS_Update_AccountCodeDim]
 AS UPDATE F SET 
 F.ZW_Franchise_ID = U.ZW_Franchise_ID 
 , F.GLNumberID = U.GLNumberID 
 , F.IDCode = U.IDCode 
 , F.Type = U.Type 
 , F.DescriptionKey = U.DescriptionKey 
 , F.TextKey = U.TextKey 
 , F.BreakOutSub = U.BreakOutSub 
 , F.BaseTextKey = U.BaseTextKey 
 , F.ModifierTextKey = U.ModifierTextKey 
 , F.DiscountTextKey = U.DiscountTextKey 
 , F.InstallTextKey = U.InstallTextKey 
 , F.OLTP_InsertDate = U.OLTP_InsertDate 
 , F.OLTP_UpdateDate = U.OLTP_UpdateDate 
 , F.UpdateCheckSum = U.UpdateCheckSum
 , F.CenterKey = u.CenterKey
FROM [Staging].[dbo].[AccountCodeDimUpdate] U 
     JOIN [GL].[AccountCodeDim] F ON U.AccountCodeKey = F.AccountCodeKey 
 WHERE U.AccountCodeKey > 0 
 
INSERT INTO  [GL].[AccountCodeDim] 
    ( ZW_Franchise_ID 
 , GLNumberID 
 , IDCode 
 , Type 
 , DescriptionKey 
 , TextKey 
 , BreakOutSub 
 , BaseTextKey 
 , ModifierTextKey 
 , DiscountTextKey 
 , InstallTextKey 
 , OLTP_InsertDate 
 , OLTP_UpdateDate 
 , UpdateCheckSum 
 , CenterKey
 ) SELECT ZW_Franchise_ID 
 , GLNumberID 
 , IDCode 
 , Type 
 , DescriptionKey 
 , TextKey 
 , BreakOutSub 
 , BaseTextKey 
 , ModifierTextKey 
 , DiscountTextKey 
 , InstallTextKey 
 , OLTP_InsertDate 
 , OLTP_UpdateDate 
 , UpdateCheckSum 
 , CenterKey
 FROM [Staging].[dbo].[AccountCodeDimUpdate] WHERE AccountCodeKey = 0 
TRUNCATE TABLE Staging.dbo.AccountCodeDimUpdate 

GO
