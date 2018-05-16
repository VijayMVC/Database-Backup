/****** Object:  StoredProcedure [dbo].[sub_GetQualifierDesc]    Script Date: 5/15/2018 12:10:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_GetQualifierDesc
(
  	 @QID int
)
 AS
SELECT 
	a.QualifierName, 
	b.subdDesc 
FROM
	 SubsidyQualifiers a
INNER JOIN 
	SubsidyDtl b 
ON 
	a.subDID = b.subDID
WHERE
	 a.SubsidyQualifierID = @QID



GO
