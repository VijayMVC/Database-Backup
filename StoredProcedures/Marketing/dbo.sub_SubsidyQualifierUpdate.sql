/****** Object:  StoredProcedure [dbo].[sub_SubsidyQualifierUpdate]    Script Date: 5/15/2018 12:10:28 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_SubsidyQualifierUpdate
(
	@SubsidyQualifierID int,
	@QualifierName varchar(50)
)
AS
UPDATE SubsidyQualifiers
SET
	QualifierName = @QualifierName
WHERE
	SubsidyQualifierID = @SubsidyQualifierID



GO
