/****** Object:  StoredProcedure [dbo].[usp_FM_ZW2StoreNum]    Script Date: 5/15/2018 12:09:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:        Alex, Montminy
-- Create date: 1/30/2013
-- Description:   gets ZWID-storeNUm relationship ZW ID to StoreNum
-- =============================================
CREATE PROCEDURE [dbo].[usp_FM_ZW2StoreNum]
AS 
    BEGIN
        SET NOCOUNT ON;
/****** Script for SelectTopNRows command from SSMS  ******/
        SELECT
            [StoreNumber] ,
            'FSI' + RIGHT('000' + CONVERT(VARCHAR, [WebNumber]), 4) AS ZW_ID
   --  ('00'+ltrim(str( <number> )),2 )
        FROM
            [Alpine].[dbo].[COR_STORES]
  
    END


GO
