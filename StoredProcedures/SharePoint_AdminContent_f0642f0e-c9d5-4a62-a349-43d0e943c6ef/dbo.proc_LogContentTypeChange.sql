/****** Object:  StoredProcedure [dbo].[proc_LogContentTypeChange]    Script Date: 5/15/2018 12:12:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_LogContentTypeChange(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @Class tinyint,
    @Scope nvarchar(256),
    @ContentTypeId tContentTypeId,
    @EventType int)
AS
    SET NOCOUNT ON
    DECLARE @Now datetime
    DECLARE @ObjectType int
    SET @Now = GETUTCDATE()
    IF (@WebId IS NULL)
    BEGIN
        DECLARE @ScopeDir nvarchar(256)
        DECLARE @ScopeLeaf nvarchar(128)
        EXEC proc_SplitUrl @Scope, @ScopeDir OUTPUT, @ScopeLeaf OUTPUT
        SELECT
            @WebId = Docs.WebId
        FROM
            Docs
        WHERE
            Docs.SiteId = @SiteId AND
            Docs.DirName = @ScopeDir AND
            Docs.LeafName = @ScopeLeaf AND
            Docs.Type = 2
        IF (@WebId IS NULL)
            RETURN 144
    END
    IF (@CLASS = 0)
        SET @ObjectType = 1024
    ELSE
        SET @ObjectType = 512
    INSERT INTO EventCache( 
        EventTime,
        SiteId,
        WebId,
        ContentTypeId,
        EventType,
        ObjectType,
        TimeLastModified)
    VALUES( 
        @Now,
        @SiteId,
        @WebId,
        @ContentTypeId,
        @EventType,
        @ObjectType,
        @Now) 

GO
