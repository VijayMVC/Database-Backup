/****** Object:  StoredProcedure [dbo].[proc_MSS_UpdateHostStats2]    Script Date: 5/15/2018 12:11:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_UpdateHostStats2
AS
    DECLARE @ERRORLEVEL_SUCCESS int SET @ERRORLEVEL_SUCCESS = 0 DECLARE @ERRORLEVEL_WARNING int SET @ERRORLEVEL_WARNING = 1 DECLARE @ERRORLEVEL_ERROR int SET @ERRORLEVEL_ERROR = 2

    UPDATE MSSCrawlHostList SET
    SuccessCount = 
        (SELECT COUNT(*)
         FROM msscrawlurl c WITH(NOLOCK), msscrawlErrorList d WITH(NOLOCK)
         WHERE ProjectID = 1 AND hostid = a.hostid AND c.errorID = d.errorID AND c.commitcrawlid <> 0 AND d.errorlevel = @ERRORLEVEL_SUCCESS) 
        +
        (SELECT COUNT(*)
         FROM msscrawldeletedurl c WITH(NOLOCK)
         WHERE ProjectID = 1 AND hostid = a.hostid AND errorlevel = @ERRORLEVEL_SUCCESS) 
        ,
    WarningCount = 
        (SELECT COUNT(*)
         FROM dbo.msscrawlurl c WITH(NOLOCK), msscrawlErrorList d WITH(NOLOCK)
         WHERE ProjectID = 1 AND hostid = a.hostid AND c.errorID = d.errorID AND c.commitcrawlid <> 0 AND d.errorlevel = @ERRORLEVEL_WARNING) 
        +
        (SELECT COUNT(*)
         FROM msscrawldeletedurl c WITH(NOLOCK)
         WHERE ProjectID = 1 AND hostid = a.hostid AND errorlevel = @ERRORLEVEL_WARNING) 
        ,
    ErrorCount = 
        (SELECT COUNT(*)
         FROM dbo.msscrawlurl c WITH(NOLOCK), msscrawlErrorList d WITH(NOLOCK)
         WHERE ProjectID = 1 AND hostid = a.hostid AND c.errorID = d.errorID AND c.commitcrawlid <> 0 AND d.errorlevel = @ERRORLEVEL_ERROR) 
        +
        (SELECT COUNT(*)
         FROM msscrawldeletedurl c WITH(NOLOCK)
         WHERE ProjectID = 1 AND hostid = a.hostid AND errorlevel = @ERRORLEVEL_ERROR) 
    FROM MSSCrawlHostList A

GO
