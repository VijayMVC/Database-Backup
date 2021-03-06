/****** Object:  StoredProcedure [dbo].[proc_AddContentTypeToScope]    Script Date: 5/15/2018 12:11:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_AddContentTypeToScope(
    @SiteId uniqueidentifier,
    @Class tinyint,
    @ContentTypeId tContentTypeId,
    @Scope nvarchar(256),
    @Definition ntext,
    @ParentContentTypeId tContentTypeId = NULL,
    @ParentScopeIn nvarchar(256) = NULL,
    @ResourceDir nvarchar(128) = NULL
    )
AS
    SET NOCOUNT ON
    DECLARE @QuotaStatus int,
        @WebId uniqueidentifier,
        @ParentWebId uniqueidentifier,
        @ScopeEscaped nvarchar(256),
        @ParentScope nvarchar(256),
        @ScopeDir nvarchar(256),
        @ScopeLeaf nvarchar(128),
        @cbDelta int
    SELECT @QuotaStatus = dbo.fn_IsOverQuotaOrWriteLocked(@SiteId)
    IF (@QuotaStatus = 1)
    BEGIN
        RETURN 1816
    END
    ELSE IF (@QuotaStatus > 1)
    BEGIN
        RETURN 212
    END
    SET @cbDelta = ISNULL(DATALENGTH(@Definition), 16)
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
    IF @WebId IS NULL
        RETURN 144
    SET @ParentWebId = @WebId
    WHILE @ParentWebId IS NOT NULL
    BEGIN
        SELECT
            @ParentWebId = Webs.ParentWebId,
            @ParentScope = Webs.FullUrl
        FROM
            Webs
        WHERE
            Webs.Id = @ParentWebId
        IF EXISTS(
            SELECT
                1
            FROM
                ContentTypes
            WHERE
                ContentTypes.SiteId = @SiteId AND
                ContentTypes.Class = @Class AND
                ContentTypes.Scope = @ParentScope AND
                ContentTypes.ContentTypeId = @ContentTypeId
            )
        BEGIN
            RETURN 85
        END
    END
    IF (DATALENGTH(@Scope) = 0)
    BEGIN
        SET @ScopeEscaped = N'%'
    END
    ELSE
    BEGIN
        EXEC proc_EscapeForLike @Scope, @ScopeEscaped OUTPUT, 1
    END
    DELETE FROM
        ContentTypes
    WHERE
        ContentTypes.SiteId = @SiteId AND
        ContentTypes.Class = @Class AND
        ContentTypes.Scope LIKE @ScopeEscaped AND
        ContentTypes.ContentTypeId = @ContentTypeId
    DECLARE @NextChildByte tinyint
    IF @ParentScopeIn IS NULL AND @ParentContentTypeId IS NULL
        SET @NextChildByte = 0
    ELSE
        SET @NextChildByte = 1
    INSERT INTO ContentTypes (
        SiteId,
        Class,
        Scope,
        ContentTypeId,
        Version,
        Definition,
        NextChildByte,
        Size,
        ResourceDir)
    VALUES (
        @SiteId,
        @Class,
        @Scope,
        @ContentTypeId,
        0,
        @Definition,
        @NextChildByte,
        @cbDelta,
        @ResourceDir)
    IF (@@ROWCOUNT = 0 OR @@ERROR <> 0)
    BEGIN
        RETURN 80
    END
    EXEC proc_LogContentTypeChange @SiteId, @WebId, @Class, @Scope,
        @ContentTypeId, 4096
    IF @ParentContentTypeId IS NOT NULL AND @ParentScopeIn IS NOT NULL
    BEGIN
        UPDATE
            ContentTypes
        SET
            NextChildByte =
            CASE
                WHEN NextChildByte = 255 THEN 0
                ELSE NextChildByte + 1
            END
        WHERE
            SiteId = @SiteId AND
            Class = @Class AND
            Scope = @ParentScopeIn AND
            ContentTypeId = @ParentContentTypeId AND
            NextChildByte <> 0
    END
    EXEC proc_UpdateDiskUsed @SiteId
    EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp @SiteId, @cbDelta, 0
    RETURN 0

GO
