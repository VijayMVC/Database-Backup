/****** Object:  StoredProcedure [dbo].[proc_UrlToWebUrl]    Script Date: 5/15/2018 12:12:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UrlToWebUrl(
    @WebSiteId uniqueidentifier,
    @Url nvarchar(260))
AS
    SET NOCOUNT ON
    DECLARE @WebUrl nvarchar(256)
    DECLARE @retval int
    DECLARE @WebDirName nvarchar(256)
    DECLARE @WebLeafName nvarchar(128)
    EXEC @retval = proc_UrlToWebUrlOutput @WebSiteId, @Url, 
        @WebDirName OUTPUT, @WebLeafName OUTPUT
    SET @WebUrl = CASE WHEN (DATALENGTH(@WebDirName) = 0) THEN @WebLeafName WHEN (DATALENGTH(@WebLeafName) = 0) THEN @WebDirName ELSE @WebDirName + N'/' + @WebLeafName END
    SELECT @WebUrl
    RETURN @retval

GO
