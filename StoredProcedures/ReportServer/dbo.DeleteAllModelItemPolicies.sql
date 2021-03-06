/****** Object:  StoredProcedure [dbo].[DeleteAllModelItemPolicies]    Script Date: 5/15/2018 12:11:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[DeleteAllModelItemPolicies]
@Path as nvarchar(450)
AS 

DELETE Policies
FROM
   Policies AS P
   INNER JOIN ModelItemPolicy AS MIP ON P.PolicyID = MIP.PolicyID
   INNER JOIN Catalog AS C ON MIP.CatalogItemID = C.ItemID
WHERE
   C.[Path] = @Path

GO
