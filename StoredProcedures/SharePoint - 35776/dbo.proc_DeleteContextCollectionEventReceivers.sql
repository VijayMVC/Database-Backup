/****** Object:  StoredProcedure [dbo].[proc_DeleteContextCollectionEventReceivers]    Script Date: 5/15/2018 12:11:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeleteContextCollectionEventReceivers (
    @SiteId uniqueidentifier,
    @ContextCollectionId uniqueidentifier)
AS
    DECLARE @iRet int
    SET @iRet = 0
    DECLARE @ContextObjectId uniqueidentifier
    DECLARE @ContextObjects table (
        ContextObjectId uniqueidentifier)
    DECLARE @ContextObject CURSOR
    SET @ContextObject = CURSOR LOCAL FAST_FORWARD FOR
    (
        SELECT ContextObjectId
        FROM @ContextObjects
    )
    DECLARE @oldTranCount int
    SET @oldTranCount = @@TRANCOUNT
    INSERT INTO @ContextObjects
                SELECT DISTINCT 
                    ContextObjectId
                FROM
                    EventReceivers WITH (NOLOCK)
                WHERE
                    SiteId = @SiteId AND
                    ContextCollectionId = @ContextCollectionId
    DELETE FROM
        EventReceivers
    WHERE
        SiteId = @SiteId AND
        ContextCollectionId = @ContextCollectionId
    OPEN @ContextObject
    IF @@CURSOR_ROWS <> 0
    BEGIN
        FETCH NEXT FROM @ContextObject INTO @ContextObjectId
        WHILE @@FETCH_STATUS = 0
        BEGIN
			IF @ContextObjectId IS NOT NULL
                AND EXISTS (SELECT TOP 1
                            *
                        FROM
                            EventReceivers WITH (XLOCK)
                        WHERE
                            SiteId = @SiteId AND
                            ContextCollectionId = @ContextObjectId AND
                            Type = 32767)
                AND NOT EXISTS (SELECT TOP 1
                            *
                        FROM
                            EventReceivers WITH (NOLOCK)
                        WHERE
                            SiteId = @SiteId AND
                            ContextObjectId = @ContextObjectId)
            BEGIN
                DELETE FROM
                    EventReceivers
                WHERE
                    SiteId = @SiteId AND
                    ContextCollectionId = @ContextObjectId AND
                    Type = 32767
            END
            FETCH NEXT FROM @ContextObject INTO @ContextObjectId
        END
    END
CLEANUP:
    RETURN @iRet;

GO
