/****** Object:  StoredProcedure [dbo].[sub_GetSubsidyDtl]    Script Date: 5/15/2018 12:10:27 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_GetSubsidyDtl
(
	@SubDID int
)
AS
SELECT *
FROM SubsidyDtl
WHERE SubDID = @SubDID



GO
