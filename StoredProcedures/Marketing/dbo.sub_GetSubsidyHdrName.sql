/****** Object:  StoredProcedure [dbo].[sub_GetSubsidyHdrName]    Script Date: 5/15/2018 12:10:27 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_GetSubsidyHdrName
(
	@SubHID int
)
AS
SELECT *
FROM SubsidyHdr
WHERE SubHID = @SubHID



GO
