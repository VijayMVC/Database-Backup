/****** Object:  StoredProcedure [dbo].[proc_UpdateListNavNode]    Script Date: 5/15/2018 12:12:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateListNavNode(
    @WebId uniqueidentifier,
    @ListId uniqueidentifier,
    @ViewId uniqueidentifier,
    @Name nvarchar(256),
    @NavBarEid int,
    @AddIfNotThere bit,
    @UseRootFolderForNav bit)
AS
    DECLARE @Eid int
    DECLARE @EidParent int
    DECLARE @SiteId uniqueidentifier
    DECLARE @OldDocId uniqueidentifier
    DECLARE @OldName nvarchar(256)
    DECLARE @NewDocId uniqueidentifier
    IF @UseRootFolderForNav = 0
    BEGIN
        SELECT
            @Eid = NavNodes.Eid,
            @EidParent = NavNodes.EidParent,
            @SiteId = NavNodes.SiteId,
            @OldDocId = WebParts.tp_PageUrlID,
            @OldName = NavNodes.Name
        FROM
            NavNodes
        RIGHT OUTER JOIN
            WebParts
        ON
            NavNodes.SiteId = WebParts.tp_SiteID AND
            NavNodes.DocId = WebParts.tp_PageUrlID AND
            NavNodes.WebId = @WebId
        WHERE
            WebParts.tp_ListId = @ListId AND
            WebParts.tp_UserID IS NULL AND
            WebParts.tp_Type = 0 AND
            WebParts.tp_Level = 1
        IF @ViewId IS NOT NULL
        BEGIN
            SELECT
                @NewDocId = tp_PageUrlID
            FROM
                WebParts
            WHERE
                WebParts.tp_ListId = @ListId AND
                WebParts.tp_UserID IS NULL AND
                WebParts.tp_ID = @ViewId AND
                WebParts.tp_Level = 1
        END
        ELSE
        BEGIN
            SET @NewDocId = NULL
        END
    END
    ELSE
    BEGIN
        SELECT
            @OldDocId = tp_RootFolder
        FROM
            Lists
        WHERE
            tp_Id = @ListId
        SELECT
            @Eid = NavNodes.Eid,
            @EidParent = NavNodes.EidParent,
            @SiteId = NavNodes.SiteId,
            @OldName = NavNodes.Name
        FROM
            NavNodes
        WHERE
            NavNodes.WebId = @WebId AND
            NavNodes.DocId = @OldDocId
        SET @NewDocId = @OldDocId
    END
    IF @Eid IS NOT NULL
    BEGIN
        IF NOT (@OldDocId = ISNULL(@NewDocId, @OldDocId) AND
            @OldName = ISNULL(@Name, @OldName))
        BEGIN
            EXEC proc_NavStructLockWebsDirtyPageDependents @SiteId, @WebId
            UPDATE
                NavNodes
            SET
                DocId = ISNULL(@NewDocId, DocId),
                Name = ISNULL(@Name, Name)
            WHERE
                Eid = @Eid AND
                SiteId = @SiteId AND
                WebId = @WebId
            EXEC proc_NavStructLogChangesAndUpdateSiteChangedTime @SiteId, @WebId, NULL
            EXEC proc_NavStructDirtyPageDependents @SiteId, @WebId,
                @EidParent
        END
    END
    ELSE IF @AddIfNotThere = 1 
    BEGIN
        SET @NewDocId = ISNULL(@NewDocId, @OldDocId)
        IF @NewDocId IS NOT NULL
        BEGIN
            DECLARE @EidBase int
            SELECT
                @SiteId = SiteId
            FROM
                Webs
            WHERE
                Id = @WebId
            EXEC proc_NavStructAllocateEidBlockWebId
                @WebId,
                1, 
                0,  
                @EidBase OUTPUT
            IF @Name IS NULL
            BEGIN
                SELECT
                    @Name = tp_Title
                FROM
                    Lists
                WHERE
                    tp_WebId = @WebId AND
                    tp_ID = @ListId
            END
            EXEC proc_NavStructAddNewNode
                @SiteId,
                @WebId,
                1, 
                @NavBarEid, 
                -2, 
                0, 
                NULL, 
                @NewDocId,
                @Name,
                NULL, 
                0, 
                0, 
                NULL, 
                @EidBase,
                NULL, 
                0 
        END
    END
    RETURN 0

GO
