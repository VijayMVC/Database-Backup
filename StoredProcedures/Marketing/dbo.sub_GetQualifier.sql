/****** Object:  StoredProcedure [dbo].[sub_GetQualifier]    Script Date: 5/15/2018 12:10:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_GetQualifier
(
	@SubsidyQualifierID int
)
AS
SELECT * FROM SubsidyQualifiers
WHERE SubsidyQualifierID = @SubsidyQualifierID



GO
