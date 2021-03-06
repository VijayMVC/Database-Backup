/****** Object:  StoredProcedure [dbo].[proc_GetRecycleBinItemEventReceivers]    Script Date: 5/15/2018 12:12:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetRecycleBinItemEventReceivers(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @UserId int,
    @DeleteTransactionId varbinary(16))
AS
    SET NOCOUNT ON
    DECLARE @Ret int
    SET @Ret = 0
    DECLARE @DeleteUserId int
    DECLARE @ItemType     tinyint
    DECLARE @ListId       uniqueidentifier
    DECLARE @DocId        uniqueidentifier
    DECLARE @DocVersionId int
    DECLARE @ListItemId   int
    DECLARE @Title        nvarchar(260)
    DECLARE @DirName      nvarchar(256)
    DECLARE @LeafName     nvarchar(128)
    DECLARE @ListDirName  nvarchar(256)
    DECLARE @ListTitle    nvarchar(255)
    DECLARE @WebUrl       nvarchar(256)
    SELECT
        @SiteId       = SiteId,
        @WebId        = WebId,
        @DeleteUserId = DeleteUserId,
        @ItemType     = ItemType,
        @ListId       = ListId,
        @DocId        = DocId,
        @DocVersionId = DocVersionId,
        @ListItemId   = ListItemId,
        @Title        = Title,
        @DirName      = DirName,
        @LeafName     = LeafName,
        @ListDirName  = ListDirName
    FROM
        RecycleBin
    WHERE
        DeleteTransactionId = @DeleteTransactionId AND
        SiteId = @SiteId AND
        (@UserId = 0 OR
         (DeleteUserId = @UserId AND WebId = @WebId))
    IF (@@ROWCOUNT <> 1)
    BEGIN
        SET @Ret = 1168
        GOTO cleanup
    END
    SELECT
        @WebUrl = FullUrl
    FROM
        Webs
    WHERE
        SiteId = @SiteId AND
        Id = @WebId
    SELECT
        @ListTitle = tp_Title
    FROM
        AllLists
    WHERE
        tp_WebId = @WebId AND
        tp_ID = @ListId
    SELECT
        @ItemType,
        @WebUrl,
        @ListId,
        @ListTitle,
        @ListItemId,
        @DocId
    SELECT
         Id, Name, SiteId, WebId, HostId, HostType, ItemId, DirName, LeafName, Type, SequenceNumber, Assembly, Class, Data, Filter, SourceId, SourceType, Credential, ContextType, ContextEventType, ContextId, ContextObjectId, ContextCollectionId
    FROM
        EventReceivers
    WHERE
        SiteId = @SiteId AND
        WebId = @WebId AND
        HostId = @ListId
    ORDER BY
        SiteId, WebId, HostId, Type, HostType, SequenceNumber, Assembly
    SELECT
         Id, Name, SiteId, WebId, HostId, HostType, ItemId, DirName, LeafName, Type, SequenceNumber, Assembly, Class, Data, Filter, SourceId, SourceType, Credential, ContextType, ContextEventType, ContextId, ContextObjectId, ContextCollectionId
    FROM
        EventReceivers
    WHERE
        SiteId = @SiteId AND
        WebId = @WebId AND
        HostId = @WebId
    ORDER BY
        SiteId, WebId, HostId, Type, HostType, SequenceNumber, Assembly
cleanup:
    RETURN @Ret

GO
