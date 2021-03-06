/****** Object:  StoredProcedure [dbo].[proc_MSS_GetCrawlErrorID]    Script Date: 5/15/2018 12:13:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetCrawlErrorID
@hrResult int,
@ErrorID int OUTPUT,
@ErrorLevel int OUTPUT,
@MarkDelete bit OUTPUT
AS
    SET NOCOUNT ON  
    DECLARE @ERRORLEVEL_SUCCESS int SET @ERRORLEVEL_SUCCESS = 0 DECLARE @ERRORLEVEL_WARNING int SET @ERRORLEVEL_WARNING = 1 DECLARE @ERRORLEVEL_ERROR int SET @ERRORLEVEL_ERROR = 2
    SET @ErrorID  = 0
    SET @ErrorLevel = @ERRORLEVEL_SUCCESS
    SET @MarkDelete  = 0
    IF @hrResult != 0
    BEGIN
        SET @ErrorID = -1
        SET @ErrorLevel = @ERRORLEVEL_ERROR 
        SELECT @ErrorID = ErrorID, @ErrorLevel = ErrorLevel, @MarkDelete = MarkDelete FROM  MSSCrawlErrorList WHERE hrResult = @hrResult
        IF @@ROWCOUNT = 0
        BEGIN
            SELECT @ErrorID = ErrorID, @ErrorLevel = ErrorLevel, @MarkDelete = MarkDelete FROM  MSSCrawlErrorList WITH(TABLOCKX) WHERE hrResult = @hrResult
            IF @@ROWCOUNT = 0
            BEGIN
                INSERT INTO MSSCrawlErrorList (hrResult, ErrorLevel) VALUES (@hrResult, @ERRORLEVEL_ERROR)
                SET @ErrorID = @@IDENTITY
            END
        END
    END

GO
