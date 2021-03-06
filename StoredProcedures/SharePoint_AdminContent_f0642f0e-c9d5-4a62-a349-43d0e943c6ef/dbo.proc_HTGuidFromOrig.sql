/****** Object:  StoredProcedure [dbo].[proc_HTGuidFromOrig]    Script Date: 5/15/2018 12:12:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_HTGuidFromOrig(
    @DocSiteId uniqueidentifier,
    @DocDirName nvarchar(256),
    @DocLeafName nvarchar(128),
    @JobType tinyint
)
AS
    DECLARE @dtLastModified as datetime
    DECLARE @TypeBlockList as tinyint
    DECLARE @SiteBlockListCount as int
    SET @dtLastModified = (SELECT TimeLastModified 
        FROM Docs
        WHERE SiteId=@DocSiteId AND 
            DirName=@DocDirName AND
            LeafName=@DocLeafName)
    SET @TypeBlockList  = (SELECT value FROM HT_Settings WHERE [key] = 'TypeBlklst')
    IF(@TypeBlockList = @JobType)
    BEGIN
        IF((SELECT COUNT(*)
            FROM HT_Cache
            WHERE [SiteId]=@DocSiteId AND 
                [DirName]=@DocDirName AND
                [LeafName]=@DocLeafName AND
                [JobType]=@TypeBlockList AND
                [STSDocVersion] >= @dtLastModified) > 0)
        BEGIN
            DECLARE @FileBlocklisted as nvarchar(17)
            SET @FileBlocklisted = N'File Block listed'
            SELECT @FileBlocklisted
            RETURN 5;
        END
        IF((SELECT COUNT(*) 
            FROM HT_Cache 
            WHERE [SiteId]=@DocSiteId AND 
                [JobType]=@TypeBlockList AND 
                DATEDIFF(Day, [TimeStamp], GETUTCDATE()) <= 0) >= 50)
        BEGIN
            DECLARE @SiteBlocklisted as nvarchar(17)
            SET @SiteBlocklisted = N'Site Block listed'
            SELECT @SiteBlocklisted
            RETURN 5;
        END
        SELECT NULL
    END
    ELSE
    BEGIN
        SELECT [TransName] 
            FROM HT_Cache
            WHERE [SiteId]=@DocSiteId AND 
                [DirName]=@DocDirName AND
                [LeafName]=@DocLeafName AND
                [JobType]=@JobType AND
                [STSDocVersion] >= @dtLastModified AND
                [MainFile]=1
    END

GO
