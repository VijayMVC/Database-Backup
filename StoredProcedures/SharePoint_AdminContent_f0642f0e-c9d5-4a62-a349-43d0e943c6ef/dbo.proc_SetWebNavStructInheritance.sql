/****** Object:  StoredProcedure [dbo].[proc_SetWebNavStructInheritance]    Script Date: 5/15/2018 12:13:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SetWebNavStructInheritance(
    @WebId uniqueidentifier,
    @Inherits bit,
    @@NavParentWebId uniqueidentifier OUTPUT)
AS
    DECLARE @SiteId uniqueidentifier
    DECLARE @NavWebId uniqueidentifier
    DECLARE @NavParentForSubwebs uniqueidentifier
    DECLARE @NavWebIdFromParent uniqueidentifier
    DECLARE @WhenNavWebId uniqueidentifier
    DECLARE @AncestrySize int
    DECLARE @AncNavStart int
    DECLARE @AncNavState nvarchar(2)
    DECLARE @FullUrl nvarchar(260)
    DECLARE @FullUrlLike nvarchar(1024)
    DECLARE @ParentWebId uniqueidentifier
    SELECT
        @SiteId = Webs.SiteId,
        @FullUrl = Webs.FullUrl,
        @AncestrySize = ISNULL(DATALENGTH(Webs.Ancestry), 0),
        @NavWebId = Webs.NavParentWebId,
        @ParentWebId = Webs.ParentWebId
   From
        Webs
   WHERE
        Webs.Id = @WebId
    IF (@SiteId IS NULL)
        RETURN 1
    IF @ParentWebId IS NOT NULL
    BEGIN
        SELECT   
            @NavWebIdFromParent = 
                CASE
                    WHEN
                        NavParentWebId IS NOT NULL
                    THEN
                        NavParentWebId
                    ELSE
                        Id
                    END
        FROM
            Webs
        WHERE
            Webs.Id = @ParentWebId
    END
    IF @Inherits = 1
    BEGIN
        SET @@NavParentWebId = @NavWebIdFromParent
        SET @NavParentForSubwebs = @NavWebIdFromParent
        SET @WhenNavWebId = @WebId
        SET @AncNavState = N'I'
    END
    ELSE
    BEGIN
        SET @@NavParentWebId = NULL
        SET @NavParentForSubwebs = @WebId
        SET @WhenNavWebId = @NavWebId
        SET @AncNavState = N'U'
    END
    EXEC proc_EscapeForLike @FullUrl, @FullUrlLike OUTPUT
    SET @AncNavStart = 1 + @AncestrySize
                         + DATALENGTH(CONVERT(varbinary(8), N';#;#'))
                         + DATALENGTH(CONVERT(varbinary(16), @WebId))
                         + DATALENGTH(CONVERT(varbinary(4), N';#'))
    UPDATE
        Webs
    SET
        NavParentWebId =
            CASE
                WHEN
                    [Id]= @WebId
                THEN
                    @@NavParentWebId
                WHEN
                    NavParentWebId = @WhenNavWebId
                THEN
                    @NavParentForSubwebs
                ELSE
                    NavParentWebId
                END,
        CachedNavDirty =
            CASE
                WHEN
                    [Id] = @WebId OR NavParentWebId = @WhenNavWebId
                THEN
                    1
                ELSE
                    CachedNavDirty
                END,
        CachedNav =
            CASE
                WHEN
                    [Id] = @WebId OR NavParentWebId = @WhenNavWebId
                THEN
                    NULL
                ELSE
                    CachedNav
                END,
         Ancestry =
            CASE
                WHEN
                    [Id] = @WebId
                THEN
                    Ancestry
                ELSE
                    STUFF(SUBSTRING(Webs.Ancestry, 1, DATALENGTH(Webs.Ancestry)), @AncNavStart,
                          DATALENGTH(N'U'),
                          CONVERT(varbinary(2), @AncNavState))
                END
    WHERE
        [Id] = @WebId OR
        (SiteId = @SiteId AND FullUrl LIKE @FullUrlLike)
    EXEC proc_NavStructLogChangesAndUpdateSiteChangedTime @SiteId, @WebId, NULL
    RETURN 0        

GO
