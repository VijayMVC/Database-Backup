/****** Object:  StoredProcedure [dbo].[proc_GetDocEventReceivers]    Script Date: 5/15/2018 12:12:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_GetDocEventReceivers
    @DocSiteId uniqueidentifier,
    @DocWebId uniqueidentifier,
    @DocUrl nvarchar(260)
AS
    SET NOCOUNT ON
    DECLARE @DocDirName nvarchar(256)
    DECLARE @DocLeafName nvarchar(128)
    DECLARE @DocId uniqueidentifier
    EXEC proc_SplitUrl @DocUrl, @DocDirName OUTPUT, @DocLeafName OUTPUT
    SELECT
        @DocId = Id
    FROM
        Docs
    WHERE
        SiteId = @DocSiteId AND
        DirName = @DocDirName AND
        LeafName = @DocLeafName AND
        WebId = @DocWebId
    IF (@DocId IS NULL)
        RETURN 3
    EXEC proc_GetEventReceivers @DocSiteId, @DocWebId, @DocId, 3
    RETURN 0

GO
