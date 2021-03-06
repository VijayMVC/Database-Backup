/****** Object:  StoredProcedure [dbo].[proc_UpdateEventReceiver]    Script Date: 5/15/2018 12:12:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateEventReceiver(
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
    DECLARE @RC int
    SET @RC = 0
    UPDATE
        EventReceivers
    SET
        Name = @Name,
        SequenceNumber = @SequenceNumber,
        Assembly = @Assembly,
        Class = @Class,
        Data = @Data,
        Filter = @Filter,
        SourceId = @SourceId,
        Credential = @Credential
    WHERE
        SiteId = @SiteId AND
        Id = @Id AND
        Type != 32767
    IF @@ROWCOUNT <> 1
        SET @RC = 87
    RETURN @RC

GO
