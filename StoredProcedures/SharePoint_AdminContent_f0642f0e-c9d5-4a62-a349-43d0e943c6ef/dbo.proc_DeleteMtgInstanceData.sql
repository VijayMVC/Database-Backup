/****** Object:  StoredProcedure [dbo].[proc_DeleteMtgInstanceData]    Script Date: 5/15/2018 12:12:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeleteMtgInstanceData
(
    @SiteId         uniqueidentifier,
    @WebId          uniqueidentifier,
    @MtgListID      uniqueidentifier,
    @MtgItemId      int,        
    @ForAttendees   bit = NULL, 
    @UserId         int,
    @UserTitle      nvarchar(255)
)
AS
    SET NOCOUNT ON
    DECLARE @DelInstanceID int
    IF @MtgItemId IS NULL
        SET @DelInstanceID = 1
    ELSE    
    BEGIN
        DECLARE @DelEventType int
        SELECT
            @DelEventType   = int1,
            @DelInstanceID  = tp_InstanceID
        FROM
            UserData
        WHERE
            tp_ListId = @MtgListID AND
            tp_Id = @MtgItemId AND
            tp_RowOrdinal = 0
        IF @DelEventType = 1
            RETURN 16
        IF @DelEventType = 3
            RETURN 0     
        IF @DelInstanceID IS NULL
            RETURN 13
    END
    IF (@ForAttendees IS NULL OR @ForAttendees = 0)
    BEGIN
        DECLARE @DocLibFolders_cursor CURSOR
        DECLARE @Error int
        EXEC @Error = proc_GetDoclibFoldersCursor
            @SiteId,
            @WebId,
            NULL,       
            @DocLibFolders_cursor OUTPUT
        IF @Error <> 0
            RETURN @Error
        DECLARE @DelInstanceName nvarchar(8)
        SET @DelInstanceName = CONVERT( nvarchar(8), @DelInstanceID )
        DECLARE @DocLibUrl nvarchar(256)
        DECLARE @DelInstanceFolderUrl nvarchar(256)
        FETCH NEXT 
        FROM 
            @DocLibFolders_cursor
        INTO
            @DocLibUrl
        WHILE @@FETCH_STATUS = 0
        BEGIN
            SET @DelInstanceFolderUrl = @DocLibUrl + N'/' + @DelInstanceName
            EXEC @Error = proc_DeleteUrl
                @SiteId,
                @WebId,
                @DelInstanceFolderUrl,
                @UserId,
                1,                      
                0,                      
                0,                      
                0   
            IF @Error <> 0
            BEGIN
                IF @Error <> 3
                    BREAK
                ELSE    
                    SET @Error = 0
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
            RETURN @Error
    END
    DECLARE DelInstanceData_cursor CURSOR
        LOCAL
        FAST_FORWARD
    FOR
    SELECT
        UserData.tp_ID,
        Lists.tp_ID,
        Lists.tp_ServerTemplate
    FROM
        UserData INNER JOIN Lists
    ON
        UserData.tp_ListId = Lists.tp_ID
    WHERE
        Lists.tp_WebId = @WebId AND
        (Lists.tp_Flags & 0x20) <> 0 AND
        (@ForAttendees IS NULL OR
            ((@ForAttendees = 1 AND Lists.tp_ServerTemplate  = 202) OR
                (@ForAttendees = 0 AND Lists.tp_ServerTemplate <> 202))) AND
        UserData.tp_InstanceID = @DelInstanceID AND
        UserData.tp_RowOrdinal = 0
    DECLARE @DelItemId int
    DECLARE @ListId uniqueidentifier
    DECLARE @ListServerTemplate int
    OPEN DelInstanceData_cursor
    FETCH NEXT 
    FROM 
        DelInstanceData_cursor
    INTO
        @DelItemId,
        @ListId,
        @ListServerTemplate
    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @ListServerTemplate = 202
        BEGIN
            EXEC proc_ProcessDelMtgAttendeeListItem
                @SiteId,
                @WebId,
                @ListId,
                @DelItemId
        END
        EXEC proc_DropListRecord
            @SiteId,
            @WebId,
            @ListId,
            @ListServerTemplate,
            @DelItemId,
            1,
            0,
            @UserTitle,
            NULL,       
            @UserId,
            0,          
            NULL        
        FETCH NEXT 
        FROM 
            DelInstanceData_cursor
        INTO
            @DelItemId,
            @ListId,
            @ListServerTemplate
    END
    CLOSE DelInstanceData_cursor
    DEALLOCATE DelInstanceData_cursor
    RETURN 0

GO
