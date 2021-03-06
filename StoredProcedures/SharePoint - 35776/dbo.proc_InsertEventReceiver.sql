/****** Object:  StoredProcedure [dbo].[proc_InsertEventReceiver]    Script Date: 5/15/2018 12:12:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_InsertEventReceiver(
    @Id uniqueidentifier,
    @Name nvarchar(256),
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @HostId uniqueidentifier,
    @HostType int,
    @ItemId int,                                
    @DirName nvarchar(256),     
    @LeafName nvarchar(128),   
    @Type int,
    @SequenceNumber int,
    @Assembly nvarchar(256),
    @Class nvarchar(256),
    @Data nvarchar(256),
    @Filter nvarchar(256),
    @SourceId tContentTypeId,
    @SourceType int,
    @Credential int,
    @ContextType uniqueidentifier,
    @ContextEventType uniqueidentifier,
    @ContextId uniqueidentifier,
    @ContextObjectId uniqueidentifier,
    @ContextCollectionId uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @RC int
    SET @RC = 0
    DECLARE @Increment int
    IF NOT EXISTS (
        SELECT * FROM EventReceivers WITH (NOLOCK)
        WHERE
            SiteId = @SiteId AND
            WebId = @WebId AND
            HostId = @HostId AND
            HostType = @HostType AND
            Type = @Type AND
            (ContextCollectionId IS NULL AND @ContextCollectionId IS NULL OR ContextCollectionId = @ContextCollectionId) AND
            (ContextObjectId IS NULL AND @ContextObjectId IS NULL OR ContextObjectId = @ContextObjectId) AND
            (ContextId IS NULL AND @ContextId IS NULL OR ContextId = @ContextId) AND
            (ContextType IS NULL AND @ContextType IS NULL OR ContextType = @ContextType) AND
            (ContextEventType IS NULL AND @ContextEventType IS NULL OR ContextEventType = @ContextEventType) AND
            (SourceId IS NULL AND @SourceId IS NULL OR SourceId = @SourceId) AND
            (SourceType = @SourceType) AND
            Assembly = @Assembly AND
            Class = @Class)
    BEGIN
        SET @Increment = 0
        WHILE (@Increment < 100)
        BEGIN
            IF NOT EXISTS (
                SELECT * FROM EventReceivers WITH (NOLOCK)
                WHERE
                    SiteId = @SiteId AND
                    WebId = @WebId AND
                    HostId = @HostId AND
                    HostType = @HostType AND
                    Type = @Type AND
                    (ContextCollectionId IS NULL AND @ContextCollectionId IS NULL OR ContextCollectionId = @ContextCollectionId) AND
                    (ContextObjectId IS NULL AND @ContextObjectId IS NULL OR ContextObjectId = @ContextObjectId) AND
                    (ContextId IS NULL AND @ContextId IS NULL OR ContextId = @ContextId) AND
                    (ContextType IS NULL AND @ContextType IS NULL OR ContextType = @ContextType) AND
                    (ContextEventType IS NULL AND @ContextEventType IS NULL OR ContextEventType = @ContextEventType) AND
                    SequenceNumber = @SequenceNumber AND
                    Assembly = @Assembly AND
                    Class = @Class)
            BEGIN
                INSERT INTO
                    EventReceivers (Id, Name, SiteId, WebId, HostId, HostType, ItemId, DirName, LeafName, Type, SequenceNumber, Assembly, Class, Data, Filter, SourceId, SourceType, Credential, ContextType, ContextEventType, ContextId, ContextObjectId, ContextCollectionId)
                VALUES (
                    @Id,
                    @Name,
                    @SiteId,
                    @WebId,
                    @HostId,
                    @HostType,
                    @ItemId,
                    @DirName,
                    @LeafName,
                    @Type,
                    @SequenceNumber,
                    @Assembly,
                    @Class,
                    @Data,
                    @Filter,
                    @SourceId,
                    @SourceType,
                    @Credential,
                    @ContextType,
                    @ContextEventType,
                    @ContextId,
                    @ContextObjectId,
                    @ContextCollectionId)
                IF @@ROWCOUNT <> 1
                    SET @RC = 87
                BREAK 
            END
            SET @Increment = @Increment + 1
            SET @SequenceNumber = @SequenceNumber + 1
        END 
    END
    RETURN @RC

GO
