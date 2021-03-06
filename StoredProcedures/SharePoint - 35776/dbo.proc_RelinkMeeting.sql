/****** Object:  StoredProcedure [dbo].[proc_RelinkMeeting]    Script Date: 5/15/2018 12:12:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_RelinkMeeting
(
    @MeetingsListID uniqueidentifier,
    @InstanceID     int,
    @UserId         int
)
AS
    SET NOCOUNT ON
    DECLARE @Now datetime
    SET @Now = GETUTCDATE()
    UPDATE
        UserData
    SET
        bit1 = 0, int4 = int4 & ~(0x10 - 1)
    WHERE
        tp_ListId = @MeetingsListID AND
        tp_RowOrdinal = 0 AND
        (@InstanceID = 0 OR             
            tp_InstanceID = @InstanceID)   
    UPDATE
        UserData
    SET
        tp_Version  = tp_Version + 1,
        tp_Editor   = @UserId,
        tp_Modified = @Now
    WHERE
        tp_ListId = @MeetingsListID AND
        (@InstanceID = 0 OR             
            tp_InstanceID = @InstanceID)   
    IF @@ROWCOUNT > 0
        RETURN 0
    ELSE
        RETURN 2

GO
