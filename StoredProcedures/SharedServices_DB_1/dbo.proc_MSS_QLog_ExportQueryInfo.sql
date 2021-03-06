/****** Object:  StoredProcedure [dbo].[proc_MSS_QLog_ExportQueryInfo]    Script Date: 5/15/2018 12:11:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_QLog_ExportQueryInfo
@StartDateTime datetime,
@EndDateTime datetime,
@StartIndex int,
@EndIndex int
AS

IF (@StartIndex IS NOT NULL AND @StartIndex > 0)
BEGIN
 IF (@EndIndex IS NULL)
 BEGIN
  SELECT TOP 0 * FROM MSSQLogDetail
  RETURN
 END

 DECLARE @Range int
 SET @Range = @EndIndex - @StartIndex

 IF (@Range <= 0)
 BEGIN
  SELECT TOP 0 * FROM MSSQLogDetail
  RETURN
 END

 DECLARE @sqlString varchar(1000)
 SET @sqlString = 
  'SELECT * FROM 
   (SELECT TOP ' + CAST(@Range AS varchar) + ' * FROM 
    (SELECT TOP ' + CAST (@EndIndex AS varchar) + ' * FROM MSSQLogDetail'

  IF (@StartDateTime IS NOT NULL AND @EndDateTime IS NOT NULL)
  BEGIN
   SET @sqlString = @sqlString + ' WHERE (searchTime >= ''' + CAST(@StartDateTime AS varchar) + ''') AND (searchTime < ''' + CAST(@EndDateTime AS varchar)  + ''')'
  END
  ELSE IF (@StartDateTime IS NOT NULL)
  BEGIN
   SET @sqlString = @sqlString + ' WHERE (searchTime >= ''' + CAST(@StartDateTime AS varchar)  + ''')'
  END
  ELSE IF (@EndDateTime IS NOT NULL)
  BEGIN
   SET @sqlString = @sqlString + ' WHERE (searchTime < ''' + CAST(@EndDateTime AS varchar) + ''')'
  END
  SET @sqlString = @sqlString + ' ORDER BY searchTime ASC
    ) AS first20
    ORDER BY searchTime DESC
   ) AS rangeRev
 ORDER BY searchTime ASC'

 EXEC(@sqlString)
END
ELSE
BEGIN

 IF ((@StartIndex IS NULL OR @StartIndex = 0) AND (@EndIndex IS NOT NULL AND @EndIndex > 0))
 BEGIN 
  SET ROWCOUNT @EndIndex
 END

 IF (@StartDateTime IS NOT NULL AND @EndDateTime IS NOT NULL)
 BEGIN
  SELECT * FROM MSSQLogDetail WHERE searchTime >= @StartDateTime AND searchTime < @EndDateTime ORDER BY searchTime ASC
 END
 ELSE IF (@StartDateTime IS NOT NULL)
 BEGIN
  SELECT * FROM MSSQLogDetail WHERE searchTime >= @StartDateTime ORDER BY searchTime ASC
 END
 ELSE IF (@EndDateTime IS NOT NULL)
 BEGIN
  SELECT * FROM MSSQLogDetail WHERE searchTime < @EndDateTime ORDER BY searchTime ASC 
 END
 ELSE
 BEGIN
  SELECT * FROM MSSQLogDetail ORDER BY searchTime ASC
 END
END


GO
