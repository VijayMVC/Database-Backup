/****** Object:  StoredProcedure [dbo].[proc_GetContextObjectEventReceivers]    Script Date: 5/15/2018 12:12:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetContextObjectEventReceivers(
    @SiteId uniqueidentifier,
    @ContextObjectId uniqueidentifier,
    @DeleteHostLookupId uniqueidentifier = NULL,
    @HostType int = NULL)
AS
    SET NOCOUNT ON
    DECLARE @iRet int
    SET @iRet = 0
    DECLARE @IfEmptyDeleteId uniqueidentifier
    DECLARE @oldTranCount int
    SET @oldTranCount = @@TRANCOUNT
    BEGIN TRAN
    IF @DeleteHostLookupId IS NOT NULL
    BEGIN
        SELECT TOP 1
            @IfEmptyDeleteId = Id
        FROM
            EventReceivers WITH (UPDLOCK)
        WHERE
            SiteId = @SiteId AND
            Id = @DeleteHostLookupId AND
            Type = 32767
        IF @@ROWCOUNT <> 1
        BEGIN
            GOTO CLEANUP
        END
    END
    SELECT
        Id, Name, SiteId, WebId, HostId, HostType, ItemId, DirName, LeafName, Type, SequenceNumber, Assembly, Class, Data, Filter, SourceId, SourceType, Credential, ContextType, ContextEventType, ContextId, ContextObjectId, ContextCollectionId
    FROM
        EventReceivers
    WHERE
        SiteId = @SiteId AND
        ContextObjectId = @ContextObjectId AND
        (@HostType IS NULL OR
            HostType = @HostType)
    ORDER BY
        SiteId, WebId, HostId, Type, HostType, SequenceNumber, Assembly
    IF @@ROWCOUNT = 0
    BEGIN
        IF @DeleteHostLookupId IS NOT NULL
        BEGIN
            DELETE FROM
                EventReceivers
            WHERE
                SiteId = @SiteId AND
                Id = @DeleteHostLookupId AND
                Type = 32767
        END
    END
CLEANUP:
    IF @iRet <> 0
    BEGIN
        IF @@TRANCOUNT = @oldTranCount + 1
        BEGIN
            ROLLBACK TRAN
        END
    END
    ELSE
    BEGIN
        COMMIT TRAN
    END
    RETURN @iRet

GO
