/****** Object:  StoredProcedure [dbo].[GetEstimateDetailsById]    Script Date: 5/15/2018 12:09:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE PROCEDURE [dbo].[GetEstimateDetailsById]
                @ZW_FranciseID CHAR(7),
                @OrderId int
AS
BEGIN

SELECT ProductDescription
        ,Height
        ,Width
        ,SignText
        ,ItemTotal
        ,LineItemNumber
        ,OrderDetailID
        ,OrderID
        ,ProductCode
        ,ProductID
        ,Quantity
        ,ZW_Franchise_ID
  FROM dbo.vw_EstimateDetails
  WHERE ZW_Franchise_ID=@ZW_FranciseID AND OrderID = @OrderId
END


GO
