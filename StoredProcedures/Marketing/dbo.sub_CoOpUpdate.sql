/****** Object:  StoredProcedure [dbo].[sub_CoOpUpdate]    Script Date: 5/15/2018 12:10:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_CoOpUpdate
(
	@CoOpName varchar(50),
	@CoOpID int
)
AS
UPDATE CoOps
SET
	CoOpName = @CoOpName
WHERE
	CoOpID = @CoOpID



GO
