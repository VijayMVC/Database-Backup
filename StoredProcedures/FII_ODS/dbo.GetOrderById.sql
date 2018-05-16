/****** Object:  StoredProcedure [dbo].[GetOrderById]    Script Date: 5/15/2018 12:09:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[GetOrderById]
                @ZW_FranciseID CHAR(7),
                @OrderId int
AS
BEGIN

SELECT TOP 1 [OrderHeaderKey]
	  ,[OrderID]
	  ,[ContactID]
	  ,[AccountName]
	  ,[CustomerName]
      ,[OrdererFirstName]
      ,[OrdererLastName]
      ,[OrdererEmailAddress]
      ,[OrderDescription]
      ,[OrderDate]      
      ,[AccountName]
      ,[ZW_Franchise_ID]
      ,[PickedUpDate]
  FROM dbo.vw_OrderHeader
  WHERE ZW_Franchise_ID=@ZW_FranciseID AND OrderID = @OrderId
END

GO
