/****** Object:  StoredProcedure [dbo].[sub_GetSubsidyDetailCoOp]    Script Date: 5/15/2018 12:10:27 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_GetSubsidyDetailCoOp
(
	@Year int,
	@CoOpID int
)
AS
SELECT COL.*, CS.CoOpName
FROM CoOpLog COL
	INNER JOIN CoOps CS ON CS.CoOpID = COL.CoOpID
WHERE
	COL.CoOpLogID = @CoOpID AND
	COL.[Year] = @Year



GO
