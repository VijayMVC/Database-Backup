/****** Object:  StoredProcedure [dbo].[usp_SSIS_TruncateStagingTables]    Script Date: 5/15/2018 12:09:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROC [dbo].[usp_SSIS_TruncateStagingTables]
as
DECLARE temp_cursor Cursor 
FOR 
SELECT [name] FROM sys.tables WHERE type='U' ORDER BY name
OPEN  temp_cursor
DECLARE @dbname AS VARCHAR(200)
DECLARE @str_sql AS VARCHAR(2000)
Fetch NEXT FROM temp_cursor INTO @dbname
While (@@FETCH_STATUS <> -1)
BEGIN
	SET @str_sql = 'Truncate Table ['+@dbname+']'
	PRINT @str_sql
	EXEC (@str_sql)
	Fetch NEXT FROM temp_cursor INTO @dbname
END
CLOSE temp_cursor
DEALLOCATE temp_cursor
--PRINT ''
--Print '**** Finished ****'


GO
