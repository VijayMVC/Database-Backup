/****** Object:  StoredProcedure [dbo].[proc_PostProcessAddMtgListItem]    Script Date: 5/15/2018 12:12:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_PostProcessAddMtgListItem
(
    @SiteId         uniqueidentifier,
    @WebId          uniqueidentifier,
    @ListID         uniqueidentifier,
    @ItemId         int,
    @EventType      int,
    @EventUID       nvarchar(255),
    @RecurrenceID   datetime,
    @InstanceID     int,
    @OnRestore      bit,
    @UserID         int,
    @UserTitle      nvarchar(255)
)
AS
    SET NOCOUNT ON
    DECLARE @Error int
    SET @Error = 0
    DECLARE @MeetingCountCurrent smallint
    IF @OnRestore = 1
    BEGIN
        SELECT
            @MeetingCountCurrent = MeetingCount
        FROM
            Webs
        WHERE
            Id = @WebId
        GOTO FIXUP_WEB_MEETINGCOUNT 
    END
    IF (@EventType IS NULL OR
        (@EventUID IS NULL AND
            (@EventType = 0 OR @EventType = 1)) OR
        (@RecurrenceID IS NULL AND
            (@EventType <> 0 AND @EventType <> 1)) OR
        (@RecurrenceID IS NOT NULL AND
            ((@EventType <> 3 AND @EventType <> 2) OR
                @InstanceID IS NULL)))
        RETURN 13
    IF (
        SELECT
            Count(*)
        FROM
            UserData
        WHERE
            tp_ListId = @ListID AND
            tp_RowOrdinal = 0 AND 
            (
                (@EventType = 1 AND              
                    int1 = 1) OR  
                (@EventType = 0 AND                 
                    int1 = 0 AND     
                    nvarchar1 LIKE @EventUID) OR      
                (@EventType <> 0 AND    
                    (@InstanceID = tp_InstanceID OR   
                        ((@EventType = 2 OR @EventType = 3) AND
                            @RecurrenceID = datetime3))))
        ) > 1
            RETURN 183
    DECLARE @WebUrl nvarchar(260)
    IF (@EventType = 0 OR @EventType = 1)
    BEGIN
        SELECT
            @MeetingCountCurrent = MeetingCount,
            @WebUrl = FullUrl
        FROM
            Webs WITH (UPDLOCK)
        WHERE
            Id = @WebId
        IF (@MeetingCountCurrent = -1 OR
            (@MeetingCountCurrent > 1 AND @EventType = 1))
            RETURN 13
    END
    IF @EventType = 0
    BEGIN
        SET @InstanceID = @ItemId
        UPDATE
            UserData
        SET
            tp_InstanceID = @InstanceID
        WHERE
            tp_ListId = @ListID AND
            tp_ID = @ItemId
        IF @@ROWCOUNT = 0
            RETURN 1150
    END
    IF (@EventType = 0 OR @EventType = 2)
    BEGIN
        IF (@EventType = 0 AND @MeetingCountCurrent = 0)
            EXEC @Error = proc_MoveDataToOccurrence
                @UserID,
                @UserTitle,
                @SiteId,
                @WebId,
                1,    
                @InstanceID,                
                0,                          
                0,                          
                0,                          
                NULL,                       
                NULL                        
        ELSE
            EXEC @Error = proc_InstantiateMtgInstance
                @SiteId,
                @WebId,
                @WebUrl,
                @InstanceID,
                NULL    
        IF @Error <> 0
            RETURN @Error
    END
FIXUP_WEB_MEETINGCOUNT:
    IF ((@EventType = 0 OR @EventType = 1) AND
        (@MeetingCountCurrent <> -1))
    BEGIN
        UPDATE
            Webs
        SET
            MeetingCount = CASE WHEN @EventType = 1
                THEN -1
                ELSE MeetingCount + 1
                END
        WHERE
            Id = @WebId
        IF @@ROWCOUNT = 0
        BEGIN
            SET @Error = 1150
            GOTO CLEANUP
        END
    END
CLEANUP:
    RETURN @Error

GO
