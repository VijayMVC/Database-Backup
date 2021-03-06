/****** Object:  StoredProcedure [dbo].[usp_SSIS_Update_IndustryDim]    Script Date: 5/15/2018 12:09:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[usp_SSIS_Update_IndustryDim]
 AS UPDATE F SET 
 F.ZW_Franchise_ID = U.ZW_Franchise_ID 
 , F.IndustryTypeID = U.IndustryTypeID 
 , F.IndustryTypeKey = U.IndustryTypeKey 
 , F.ActiveType = U.ActiveType 
 , F.SICCode = U.SICCode 
 , F.OLTP_InsertDate = U.OLTP_InsertDate 
 , F.OLTP_UpdateDate = U.OLTP_UpdateDate 
 , F.UpdateCheckSum = U.UpdateCheckSum 
FROM [Staging].[dbo].[IndustryDimUpdate] U 
     JOIN [Contact].[IndustryDim] F ON U.IndustryKey = F.IndustryKey 
 WHERE U.IndustryKey > 0 
 
INSERT INTO  [Contact].[IndustryDim] 
    ( ZW_Franchise_ID 
 , IndustryTypeID 
 , IndustryTypeKey 
 , ActiveType 
 , SICCode 
 , OLTP_InsertDate 
 , OLTP_UpdateDate 
 , UpdateCheckSum 
 ) SELECT ZW_Franchise_ID 
 , IndustryTypeID 
 , IndustryTypeKey 
 , ActiveType 
 , SICCode 
 , OLTP_InsertDate 
 , OLTP_UpdateDate 
 , UpdateCheckSum 
 FROM [Staging].[dbo].[IndustryDimUpdate] WHERE IndustryKey = 0 
TRUNCATE TABLE Staging.dbo.IndustryDimUpdate 

GO
