/****** Object:  StoredProcedure [dbo].[MaterialSubsidyUpdate]    Script Date: 5/15/2018 12:10:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialSubsidyUpdate
(
	@MatId int = NULL,
	@SubHId int = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE MaterialSubsidy SET ' + Left(@SQL, Len(@SQL)-1) + ' Where MatId = ' + convert(varchar,@MatId) + ' AND SubHId = ' + convert(varchar,@SubHId) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
