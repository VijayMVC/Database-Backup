/****** Object:  StoredProcedure [dbo].[GetEstimateById]    Script Date: 5/15/2018 12:09:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE PROCEDURE [dbo].[GetEstimateById]
                @ZW_FranciseID CHAR(7),
                @OrderId int
AS
BEGIN

SELECT TOP 1 [EstimateHeaderKey]
	  ,[OrderID]
	  ,[ContactID]
	  ,[CustomerName]
      ,[OrdererFirstName]
      ,[OrdererLastName]
      ,[OrdererEmailAddress]
      ,[Description]
      ,[EstimateDate]      
      ,[ZW_Franchise_ID]
      ,[PickedUpDate]
  FROM dbo.vw_EstimateHeaderFact
  WHERE ZW_Franchise_ID=@ZW_FranciseID AND OrderID = @OrderId
END


GO
