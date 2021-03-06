/****** Object:  StoredProcedure [dbo].[proc_MergeWeb]    Script Date: 5/15/2018 12:12:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MergeWeb(
    @WebSiteId uniqueidentifier,
    @WebUrl nvarchar(260))
AS
    SET NOCOUNT ON
    DECLARE @WebId uniqueidentifier
    DECLARE @WebParentWebId uniqueidentifier
    DECLARE @WebDirName nvarchar(256)
    DECLARE @WebLeafName nvarchar(128)
    DECLARE @UrlLike nvarchar(1024)
    EXEC proc_EscapeForLike @WebUrl, @UrlLike OUTPUT
    EXEC proc_SplitUrl @WebUrl, @WebDirName OUTPUT, @WebLeafName OUTPUT
    EXEC proc_GetAuditMask 6, @WebSiteId, @WebDirName, 
                         @WebLeafName
    SELECT
        @WebId = Webs.Id,
        @WebParentWebId = Webs.ParentWebId
    FROM
        Webs INNER JOIN Docs
    ON
        Webs.Id = Docs.WebId
    WHERE
        Docs.SiteId = @WebSiteId AND
        Docs.DirName = @WebDirName AND
        Docs.LeafName = @WebLeafName AND
        Docs.Type = 2
    IF @WebId IS NULL
    BEGIN
        RETURN 3
    END
    IF @WebParentWebId IS NULL
    BEGIN
        RETURN 5
    END
    IF EXISTS (SELECT
        *
        FROM
            Docs INNER JOIN Lists
        ON
            Lists.tp_WebID = @WebId AND
            Lists.tp_RootFolder = Docs.Id
        WHERE
            Docs.SiteId = @WebSiteId AND
            Docs.DirName = @WebDirName AND
            Docs.LeafName = @WebLeafName AND
            Docs.Type = 1)
    BEGIN
        RETURN 133
    END
    ELSE IF EXISTS (SELECT
        *
        FROM
            Docs INNER JOIN Lists
        ON
            Lists.tp_WebID = @WebId AND
            Lists.tp_RootFolder = Docs.Id
        WHERE
            Docs.SiteId = @WebSiteId AND
            Docs.DirName = @WebUrl AND
            Docs.Type = 1)
    BEGIN
        RETURN 133
    END
    ELSE IF EXISTS (SELECT
        *
        FROM
            Docs INNER JOIN Lists
        ON
            Lists.tp_WebID = @WebId AND
            Lists.tp_RootFolder = Docs.Id
        WHERE
            Docs.SiteId = @WebSiteId AND
            (Docs.DirName = @WebUrl OR
            Docs.DirName LIKE @UrlLike) AND
            Docs.Type = 1)
    BEGIN
        RETURN 133
    END       
    BEGIN TRAN
    EXEC proc_ResetWebPermission @WebId
    UPDATE
        Webs
    SET
        ParentWebId = @WebParentWebId
    WHERE
        SiteId = @WebSiteId AND
        ParentWebId = @WebId
    UPDATE
        Docs
    SET
        WebId = @WebParentWebId
    WHERE
        SiteId = @WebSiteId AND
        (DirName = @WebUrl OR
            DirName LIKE @UrlLike) AND
        WebId = @WebId
    UPDATE
        Docs
    SET
        WebId = @WebParentWebId,
        Type = 1
    WHERE
        SiteId = @WebSiteId AND
        DirName = @WebDirName AND
        LeafName = @WebLeafName
    DELETE FROM
        Webs
    WHERE
        Id = @WebId
    EXEC proc_LogChange @WebSiteId, @WebId, NULL, NULL, NULL, NULL, NULL, NULL,
        16384,  4, NULL
    COMMIT TRAN
    RETURN 0

GO
