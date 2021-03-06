/****** Object:  StoredProcedure [dbo].[proc_RemoveListNavNode]    Script Date: 5/15/2018 12:12:52 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_RemoveListNavNode(
    @WebId uniqueidentifier,
    @ListId uniqueidentifier,
    @UseRootFolderForNav bit)
AS
    DECLARE @SiteId uniqueidentifier
    DECLARE @Eid int
    DECLARE @@DateModifiedReally datetime
    IF @UseRootFolderForNav = 0
    BEGIN
        SELECT
            @SiteId = NavNodes.SiteId,
            @Eid = NavNodes.Eid
        FROM
            NavNodes
        RIGHT OUTER JOIN
            WebParts
        ON
            NavNodes.DocId = WebParts.tp_PageUrlID AND
            NavNodes.WebId = @WebId AND
            NavNodes.SiteId = WebParts.tp_SiteID
        WHERE
            WebParts.tp_ListId = @ListId AND
            WebParts.tp_UserID IS NULL AND
            WebParts.tp_Type = 0 AND
            WebParts.tp_Level = 1
    END
    ELSE
    BEGIN
        SELECT
            @SiteId = NavNodes.SiteId,
            @Eid = NavNodes.Eid
        FROM
            NavNodes
        RIGHT OUTER JOIN
            Lists
        ON
            NavNodes.DocId = Lists.tp_RootFolder
        WHERE
            NavNodes.WebId = @WebId AND
            Lists.tp_Id = @ListId
    END
    IF @Eid IS NOT NULL
    BEGIN
        EXEC proc_NavStructDeleteNodeByIds
            @SiteId,
            @WebId,
            @Eid,
            NULL,
            @@DateModifiedReally OUTPUT
    END

GO
