/****** Object:  StoredProcedure [dbo].[rc_GetReportInfo]    Script Date: 5/15/2018 12:13:21 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE rc_GetReportInfo

(   @ReportID int,
    @TableName varchar(50) )

AS

DECLARE
 @str nvarchar(2000)
SELECT @str = 'SELECT * FROM ' + cast(@TableName as varchar)
SELECT @str = @str + ' WHERE ReportID =' + cast(@ReportID as varchar)

EXEC sp_executesql @str

GO
