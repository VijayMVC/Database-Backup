/****** Object:  StoredProcedure [dbo].[proc_MoveDataToOccurrence]    Script Date: 5/15/2018 12:12:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MoveDataToOccurrence
(
    @UserId                 int,
    @UserTitle              nvarchar(255),
    @SiteId                 uniqueidentifier,
    @WebId                  uniqueidentifier,
    @FromInstanceID         int,
    @ToInstanceID           int,    
    @CheckFromInstanceID    bit,
    @OverwriteToInstance    bit,
    @CreateMeetingEntry     bit,
    @ToDTStartUTC           datetime,
    @CreateOrphaned         bit
)
AS
    SET NOCOUNT ON
    IF (@FromInstanceID = @ToInstanceID AND
        (@FromInstanceID <> 1 OR  
            @CheckFromInstanceID = 1 OR            
            @OverwriteToInstance = 1 OR      
            @CreateMeetingEntry = 1))  
        RETURN 13
    IF (@OverwriteToInstance = 1 AND
        (@CreateMeetingEntry = 1 OR
            @ToInstanceID = -3))
        RETURN 13
    DECLARE @MeetingsListID uniqueidentifier
    EXEC proc_GetUniqueList @WebId, 200, @MeetingsListID OUTPUT
    IF @MeetingsListID IS NULL
        RETURN 13
    DECLARE @FromItemId int
    DECLARE @FromEventType int
    DECLARE @FromException bit
    DECLARE @FromOrphaned bit
    DECLARE @FromDetached int
    IF @FromInstanceID <> @ToInstanceID
    BEGIN
        SELECT TOP 1
            @FromItemId     = tp_ID,
            @FromEventType  = int1,
            @FromException  = bit2,
            @FromOrphaned   = bit1,
            @FromDetached   = int4
        FROM
            UserData
        WHERE
            tp_ListId = @MeetingsListID AND
            tp_InstanceID = @FromInstanceID AND
            tp_RowOrdinal = 0
        IF @CheckFromInstanceID = 1
        BEGIN
            IF (@FromItemId IS NULL OR
                @FromEventType = 1 OR
                @FromEventType = 3 OR
                (@FromEventType = 2 AND @FromException = 0) OR
                @FromOrphaned = 0)
                RETURN 2
        END
    END
    IF @ToInstanceID <> -3
    BEGIN
        DECLARE @ToItemId int
        DECLARE @ToEventType int
        DECLARE @ToOrphaned bit
        SELECT TOP 1
            @ToItemId       = tp_ID,
            @ToEventType    = int1,
            @ToOrphaned     = bit1
        FROM
            UserData
        WHERE
            tp_ListId = @MeetingsListID AND
            tp_InstanceID = @ToInstanceID AND
            tp_RowOrdinal = 0
        IF ((@CreateMeetingEntry = 1 AND
            @ToItemId IS NOT NULL) OR
            ((@OverwriteToInstance = 1 OR @CreateMeetingEntry <> 1) AND
                (@ToItemId IS NULL OR
                    @ToEventType = 1 OR
                    @ToEventType = 3 OR
                    @ToOrphaned = 1)))
            RETURN 2
    END
    BEGIN TRANSACTION
    DECLARE @Error int
    SET @Error = 0
    IF @ToInstanceID = -3   
        GOTO DELETE_FROM_OCCURRENCE
    IF @CreateMeetingEntry = 1
    BEGIN
        EXEC @Error = proc_InstantiateMtgSeriesOccurrence
            @SiteId,
            @WebId,
            @ToInstanceID,
            @ToDTStartUTC,
            @CreateOrphaned,
            1,      
            NULL    
        IF @Error <> 0
            GOTO CLEANUP
    END
    ELSE
    IF @OverwriteToInstance = 1
    BEGIN
        EXEC @Error = proc_DeleteMtgInstanceData
            @SiteId,
            @WebId,
            @MeetingsListID,
            @ToItemId,
            0,          
            @UserId,
            @UserTitle
        IF @Error <> 0
            GOTO CLEANUP
    END
    IF @FromInstanceID = @ToInstanceID
    BEGIN
        GOTO DELETE_FROM_OCCURRENCE
    END
    DECLARE @DocLibFolders_cursor CURSOR
    EXEC @Error = proc_GetDoclibFoldersCursor
        @SiteId,
        @WebId,
        NULL,       
        @DocLibFolders_cursor OUTPUT
    IF @Error <> 0
        GOTO CLEANUP
    DECLARE @FromInstanceName nvarchar(8)
    DECLARE @ToInstanceName   nvarchar(8)
    SET @FromInstanceName = CONVERT( nvarchar(8), @FromInstanceID )
    SET @ToInstanceName   = CONVERT( nvarchar(8), @ToInstanceID   )
    DECLARE @DocLibUrl nvarchar(256)
    DECLARE @FromInstanceFolderUrl nvarchar(256)
    DECLARE @ToInstanceFolderUrl   nvarchar(256)
    FETCH NEXT 
    FROM 
        @DocLibFolders_cursor
    INTO
        @DocLibUrl
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @FromInstanceFolderUrl = @DocLibUrl + N'/' + @FromInstanceName
        SET @ToInstanceFolderUrl   = @DocLibUrl + N'/' + @ToInstanceName
        EXEC @Error = proc_RenameUrl
            @SiteId,         
            @WebId,
            @FromInstanceFolderUrl,
            @ToInstanceFolderUrl,
            @UserId,
            4,      
            0,      
            0,      
            0, 
            0, 
            NULL,   
            NULL    
        IF @Error <> 0
        BEGIN
            IF @Error = 3
            BEGIN
                EXEC proc_CreateDir
                    @SiteId,
                    @WebId,
                    @DocLibUrl,             
                    @ToInstanceName,        
                    1,
                    0,
                    0,                
                    0,                      
                    NULL,                   
                    NULL,                   
                    NULL                    
                SET @Error = 0
            END
            ELSE
                BREAK   
        END
        FETCH NEXT 
        FROM 
            @DocLibFolders_cursor
        INTO
            @DocLibUrl
    END
    CLOSE @DocLibFolders_cursor
    DEALLOCATE @DocLibFolders_cursor
    IF @Error <> 0
        GOTO CLEANUP
    UPDATE
        UserData
    SET
        UserData.tp_InstanceID = @ToInstanceID,
        UserData.tp_Version = UserData.tp_Version + 1
    FROM
        UserData INNER JOIN Lists
    ON
        UserData.tp_ListId = Lists.tp_ID
    WHERE
        Lists.tp_WebId = @WebId AND
        Lists.tp_ID <> @MeetingsListID AND
        Lists.tp_ServerTemplate <> 202 AND
        UserData.tp_InstanceID = @FromInstanceID
    SET @Error = @@ERROR
    IF @Error <> 0
        GOTO CLEANUP
DELETE_FROM_OCCURRENCE:
    DECLARE @ForAttendees bit
    SET @ForAttendees = 1
    IF @ToInstanceID = -3
        SET @ForAttendees = NULL
    EXEC @Error = proc_DeleteMtgInstanceData
        @SiteId,
        @WebId,
        @MeetingsListID,
        @FromItemId,
        @ForAttendees,
        @UserId,
        @UserTitle
    IF @Error <> 0
        GOTO CLEANUP
    IF @FromItemId IS NOT NULL
    BEGIN
        IF (@FromEventType = 2 AND
            (@FromDetached & 8) = 0)
        BEGIN
            UPDATE
                UserData
            SET
                int1 = 3,
                datetime1 = datetime3, datetime2 = NULL, bit1 = NULL, int4 = NULL
            WHERE
                tp_ListId = @MeetingsListID AND
                tp_ID = @FromItemId AND
                tp_RowOrdinal = 0
        END
        ELSE    
        BEGIN
            EXEC @Error = proc_DropListRecord
                @SiteId,
                @WebId,
                @MeetingsListID,
                200,
                @FromItemId,
                1,
                0, 
                @UserTitle,
                NULL,       
                @UserId,
                0,          
                NULL        
        END
    END
CLEANUP:
    IF @Error <> 0 AND @@TRANCOUNT = 1
        ROLLBACK TRANSACTION
    ELSE
        COMMIT TRANSACTION
    RETURN @Error

GO
