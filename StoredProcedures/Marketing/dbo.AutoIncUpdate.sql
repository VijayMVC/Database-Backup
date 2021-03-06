/****** Object:  StoredProcedure [dbo].[AutoIncUpdate]    Script Date: 5/15/2018 12:10:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.AutoIncUpdate
(
	@TableName varchar(25) = NULL,
	@FieldName varchar(25) = NULL,
	@StartId int = NULL,
	@StartIdFlag bit = NULL,
	@EndId int = NULL,
	@EndIdFlag bit = NULL,
	@StepValue int = NULL,
	@StepValueFlag bit = NULL,
	@CurrentId int = NULL,
	@CurrentIdFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@StartIdFlag Is Not NULL)
BEGIN
	IF (@StartId Is Not NULL)
		SET @SQL = @SQL + 'StartId=' + convert(varchar,@StartId) + ', ';
	ELSE
		SET @SQL = @SQL + 'StartId=NULL, ';
END
IF (@EndIdFlag Is Not NULL)
BEGIN
	IF (@EndId Is Not NULL)
		SET @SQL = @SQL + 'EndId=' + convert(varchar,@EndId) + ', ';
	ELSE
		SET @SQL = @SQL + 'EndId=NULL, ';
END
IF (@StepValueFlag Is Not NULL)
BEGIN
	IF (@StepValue Is Not NULL)
		SET @SQL = @SQL + 'StepValue=' + convert(varchar,@StepValue) + ', ';
	ELSE
		SET @SQL = @SQL + 'StepValue=NULL, ';
END
IF (@CurrentIdFlag Is Not NULL)
BEGIN
	IF (@CurrentId Is Not NULL)
		SET @SQL = @SQL + 'CurrentId=' + convert(varchar,@CurrentId) + ', ';
	ELSE
		SET @SQL = @SQL + 'CurrentId=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE AutoInc SET ' + Left(@SQL, Len(@SQL)-1) + ' Where TableName=''' + @TableName + '''' + ' AND FieldName=''' + @FieldName + '''' 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
