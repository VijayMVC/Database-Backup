/****** Object:  StoredProcedure [dbo].[proc_DeleteView]    Script Date: 5/15/2018 12:12:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeleteView(
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier,
    @ViewId uniqueidentifier,
    @CanManagePersonalViews bit,
    @CanManageLists bit,
    @UserId int)
AS
    SET NOCOUNT ON
    DECLARE @Url nvarchar(260)
    DECLARE @ListIdDoc uniqueidentifier
    DECLARE @ListIdView uniqueidentifier
    DECLARE @DocId uniqueidentifier
    DECLARE @WebId uniqueidentifier
    DECLARE @ViewFlags int
    DECLARE @ViewUserId int
    DECLARE @DocLibRowId int
    SELECT
        @DocId = Docs.Id,
        @WebId = Docs.WebId,
        @Url = CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END,
        @ListIdDoc = Docs.ListId,
        @ListIdView = WebParts.tp_ListId,
        @ViewFlags = WebParts.tp_Flags,
        @ViewUserId = WebParts.tp_UserID,
        @DocLibRowId = Docs.DocLibRowId
    FROM
        WebParts INNER JOIN Docs
    ON
        Docs.SiteId = WebParts.tp_SiteID AND
        Docs.Id = WebParts.tp_PageUrlID AND
        Docs.Level = WebParts.tp_Level AND
        Docs.IsCurrentVersion = 1
    WHERE
        WebParts.tp_ID = @ViewId
    IF @@ROWCOUNT = 0
    BEGIN
        RETURN 3
    END
    IF (@ListIdDoc <> @ListId 
        AND ((@ListIdDoc IS NOT NULL) AND (@DocLibRowId IS NULL))) 
        OR @ListIdView <> @ListId
        OR @ListIdView IS NULL
    BEGIN
        RETURN 5
    END
    IF ((@ViewFlags & 262144) <> 0)
    BEGIN
        IF @CanManagePersonalViews <> 1 OR @ViewUserId <> @UserId
        BEGIN
            RETURN 5
        END
    END
    ELSE IF ((@ListIdDoc IS NOT NULL) AND (@DocLibRowId IS NULL))
    BEGIN
        IF @CanManageLists <> 1
        BEGIN
            RETURN 5
        END
        IF @Url IS NOT NULL
        BEGIN
            EXEC proc_DeleteUrl @SiteId, @WebId, @Url, @UserId, 0, 0, 0,
                0, 1
        END
    END
    DELETE FROM
        WebPartLists
    WHERE
        tp_SiteID = @SiteId AND
        tp_PageUrlID = @DocId
    DELETE FROM
        WebParts
    WHERE
        tp_SiteID = @SiteId AND
        tp_ID = @ViewId
    IF ((@ViewFlags & 8388608) <> 0)
    BEGIN
        EXEC proc_EnsureMobileDefaultViewForList @ListId
    END
    EXEC proc_LogChange @SiteId, @WebId, @ListId, NULL, NULL,
        @ViewId, NULL, NULL, 16384, 4096, NULL
    RETURN 0

GO
