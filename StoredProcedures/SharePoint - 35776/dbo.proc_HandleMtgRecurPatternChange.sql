/****** Object:  StoredProcedure [dbo].[proc_HandleMtgRecurPatternChange]    Script Date: 5/15/2018 12:12:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_HandleMtgRecurPatternChange
(
    @SiteId                 uniqueidentifier,
    @WebId                  uniqueidentifier,
    @MtgListID              uniqueidentifier,
    @InstanceIDStart        int,   
    @InstanceIDEndDel       int,   
    @InstanceIDEndSplit     int,   
    @DTStamp                datetime,   
    @UserId                 int,
    @UserTitle              nvarchar(255),
    @InstanceIDSplitMax     int = NULL OUTPUT   
)
AS
    SET NOCOUNT ON
    BEGIN TRANSACTION
DELETE_DELETE_EXCPS:
    IF (@InstanceIDStart >= @InstanceIDEndDel)
        GOTO FETCH_MAX_SPLIT_INSTANCEID
    DECLARE @Exceptions_cursor CURSOR
    SET @Exceptions_cursor = CURSOR
        LOCAL
        FAST_FORWARD
    FOR
    SELECT
        tp_ID
    FROM
        UserData
    WHERE
        tp_ListId = @MtgListID AND
        int1 = 3 AND
        tp_InstanceID >= @InstanceIDStart AND
        tp_InstanceID < @InstanceIDEndDel AND
        tp_RowOrdinal = 0
    DECLARE @ItemId int
    OPEN @Exceptions_cursor
    FETCH NEXT 
    FROM 
        @Exceptions_cursor
    INTO
        @ItemId
    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC proc_DropListRecord
            @SiteId,
            @WebId,
            @MtgListID,
            NULL,       
            @ItemId,
            1,
            0,
            @UserTitle,
            NULL,       
            @UserId,
            0,          
            NULL        
        FETCH NEXT 
        FROM 
            @Exceptions_cursor
        INTO
            @ItemId
    END
    CLOSE @Exceptions_cursor
    DEALLOCATE @Exceptions_cursor
SPLIT_MODIFY_EXCPS:
    IF (@InstanceIDStart >= @InstanceIDEndSplit)
        GOTO FETCH_MAX_SPLIT_INSTANCEID
    DECLARE @Now datetime
    SET @Now = GETUTCDATE()
    UPDATE
        UserData
    SET
        UserData.tp_Version  = UserData.tp_Version + 1,
        UserData.tp_Editor   = @UserId,
        UserData.tp_Modified = @Now
    FROM (SELECT tp_ID FROM UserData 
    		WHERE  tp_ListId = @MtgListID AND
        		int1 = 2 AND
        		tp_InstanceID >= @InstanceIDStart AND
        		tp_InstanceID < @InstanceIDEndSplit AND
        		tp_RowOrdinal = 0) as t
    WHERE
	 UserData.tp_ListId = @MtgListID AND
        UserData.tp_ID = t.tp_ID
    UPDATE
        UserData
    SET
        int1  = 0,
        bit1 = (CASE WHEN datetime1 < @DTStamp
            THEN    
                (CASE (int4 & (0x10 - 1))
                    WHEN 3 THEN 1
                    WHEN 8   THEN 1
                    ELSE 0
                    END)
            ELSE 1
            END),
        int4 = (CASE WHEN datetime1 < @DTStamp
            THEN    
                (CASE (int4 & (0x10 - 1))
                    WHEN 3 THEN 3
                    WHEN 8   THEN 3
                    ELSE 0
                    END)
            ELSE 3
            END),
        bit3 = 0, uniqueidentifier1 = NULL, datetime3 = NULL, bit2 = NULL
    WHERE
        tp_ListId = @MtgListID AND
        int1 = 2 AND
        tp_InstanceID >= @InstanceIDStart AND
        tp_InstanceID < @InstanceIDEndSplit AND
        tp_RowOrdinal = 0
FETCH_MAX_SPLIT_INSTANCEID:
    IF @InstanceIDSplitMax IS NULL  
        GOTO DONE
    SET @InstanceIDSplitMax = -3
    SELECT
        @InstanceIDSplitMax = MAX(tp_InstanceID)
    FROM
        UserData
    WHERE
        tp_ListId = @MtgListID AND
        int1 = 0 AND
        tp_InstanceID < @InstanceIDEndSplit AND
        tp_RowOrdinal = 0
DONE:
    COMMIT TRANSACTION
    RETURN 0

GO
