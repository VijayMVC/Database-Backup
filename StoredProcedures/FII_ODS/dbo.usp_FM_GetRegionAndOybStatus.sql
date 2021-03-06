/****** Object:  StoredProcedure [dbo].[usp_FM_GetRegionAndOybStatus]    Script Date: 5/15/2018 12:09:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_FM_GetRegionAndOybStatus]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		Select
  Store.FastMailDim.FastMailGroupId,
  Cast(Replace(Store.StoreFact.ZW_Franchise_ID, 'FSI', '') As int) As WebNum,
  Store.FastMailDim.IS_OYB,
  System.CountryCodes.Country,
  Store.StoreFact.OpenStatus
From
  Store.FastMailDim Inner Join
  Store.StoreFact On Store.FastMailDim.CenterKey = Store.StoreFact.CenterKey
  Inner Join
  Store.CountryDim On Store.StoreFact.CountryKey = Store.CountryDim.CountryKey
  Inner Join
  System.CountryCodes On Store.CountryDim.CountryCode =
    System.CountryCodes.CountryCode
Order By
  WebNum
  end



GO
