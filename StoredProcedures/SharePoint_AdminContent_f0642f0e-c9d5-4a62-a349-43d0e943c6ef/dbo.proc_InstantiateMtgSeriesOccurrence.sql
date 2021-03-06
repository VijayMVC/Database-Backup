/****** Object:  StoredProcedure [dbo].[proc_InstantiateMtgSeriesOccurrence]    Script Date: 5/15/2018 12:12:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_InstantiateMtgSeriesOccurrence
(
    @SiteId                 uniqueidentifier,
    @WebId                  uniqueidentifier,
    @InstanceID             int,
    @DTStartUTC             datetime,
    @CreateOrphaned         bit = 0,
    @ForAttendees           bit = NULL, 
    @AlreadyInstantiated    bit = NULL OUTPUT
)
AS
    SET NOCOUNT ON
    SET @AlreadyInstantiated = 0
    DECLARE @MeetingsListID uniqueidentifier
    EXEC proc_GetUniqueList @WebId, 200, @MeetingsListID OUTPUT
    IF @MeetingsListID IS NULL
        RETURN 13
    BEGIN TRANSACTION
    DECLARE @Error int
    EXEC @Error = proc_SplitMtgSeriesOccurrenceEntry
        @SiteId,
        @WebId,
        @MeetingsListID,
        @InstanceID,
        @DTStartUTC,
        @CreateOrphaned
    IF @Error <> 0
        GOTO CLEANUP
    EXEC @Error = proc_InstantiateMtgInstance
        @SiteId,
        @WebId,
        NULL,   
        @InstanceID,
        @ForAttendees
    IF @Error <> 0
        GOTO CLEANUP
    IF (
        SELECT
            Count(*)
        FROM
            UserData
        WHERE
            tp_ListId = @MeetingsListID AND
            tp_InstanceID = @InstanceID AND
            tp_RowOrdinal = 0
        ) > 1
    BEGIN
        SET @Error = 183
        IF NOT EXISTS (
            SELECT
                NULL
            FROM
                UserData
            WHERE
                tp_ListId = @MeetingsListID AND
                tp_InstanceID = @InstanceID AND
                int1 <> 2 AND
                tp_RowOrdinal = 0
            )
        BEGIN
            SET @Error = 80
            SET @AlreadyInstantiated = 1
        END
    END
CLEANUP:
    IF @Error <> 0 AND @@TRANCOUNT = 1
        ROLLBACK TRANSACTION
    ELSE
        COMMIT TRANSACTION  
    RETURN @Error

GO
