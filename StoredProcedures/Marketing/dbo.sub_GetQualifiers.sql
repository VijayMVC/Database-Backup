/****** Object:  StoredProcedure [dbo].[sub_GetQualifiers]    Script Date: 5/15/2018 12:10:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_GetQualifiers
(
	@SubDCalanderYear int,
	@SubDID int
)
AS
SELECT A.SubDID, A.QualifierName, A.SubsidyQualifierID, B.SubDDesc 
FROM SubsidyQualifiers A INNER JOIN SubsidyDtl B
	ON A.SubDID = B.SubDID
WHERE
	B.SubDCalanderYear = @SubDCalanderYear AND
	B.SubDID = @SubDID
GROUP BY A.SubDID, A.QualifierName, A.SubsidyQualifierID, B.SubDDesc



GO
