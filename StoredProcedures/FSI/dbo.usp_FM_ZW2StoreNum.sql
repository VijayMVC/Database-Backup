/****** Object:  StoredProcedure [dbo].[usp_FM_ZW2StoreNum]    Script Date: 5/15/2018 12:09:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:        Alex, Montminy
-- Create date: 1/30/2013
-- Description:   gets ZWID-storeNUm relationship ZW ID to StoreNum
-- =============================================
CREATE PROCEDURE usp_FM_ZW2StoreNum
AS
BEGIN
      SET NOCOUNT ON;
      SELECT TOP 1000 [zw_franchise_id] ,[StoreNumber] 
  FROM [FSI].[dbo].[_ExactTarget_Integration_Stores]
END

GO
