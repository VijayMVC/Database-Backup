/****** Object:  StoredProcedure [dbo].[sub_CoOpSearch]    Script Date: 5/15/2018 12:10:25 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE sub_CoOpSearch
(
	@SubLYear int,
	@CoOpID int
)
AS
DECLARE @str nvarchar(1500)
SELECT *
FROM CoOpLog
WHERE
	CoOpID = @CoOpID AND
	[Year] = @SubLYear
ORDER BY CoOpLogID desc;
GO
