/****** Object:  StoredProcedure [dbo].[GetChildrenBeforeDelete]    Script Date: 5/15/2018 12:11:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[GetChildrenBeforeDelete]
@Prefix nvarchar (850),
@AuthType int
AS
SELECT C.PolicyID, C.Type, SD.NtSecDescPrimary
FROM
   Catalog AS C LEFT OUTER JOIN SecData AS SD ON C.PolicyID = SD.PolicyID AND SD.AuthType = @AuthType
WHERE
   C.Path LIKE @Prefix ESCAPE '*'  -- return children only, not item itself

GO
