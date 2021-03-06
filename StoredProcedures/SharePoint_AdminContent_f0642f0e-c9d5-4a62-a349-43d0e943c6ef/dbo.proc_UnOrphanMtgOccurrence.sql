/****** Object:  StoredProcedure [dbo].[proc_UnOrphanMtgOccurrence]    Script Date: 5/15/2018 12:13:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UnOrphanMtgOccurrence
(
    @WebId          uniqueidentifier,
    @InstanceID     int,
    @UserId         int
)
AS
    SET NOCOUNT ON
    DECLARE @MeetingsListID uniqueidentifier
    EXEC proc_GetUniqueList @WebId, 200, @MeetingsListID OUTPUT
    IF @MeetingsListID IS NULL
        RETURN 13
    DECLARE @Now datetime
    SET @Now = GETUTCDATE()
    UPDATE
        UserData
    SET
        bit1 = 0, int4 = int4 & ~(0x10 - 1)
    WHERE
        tp_ListId = @MeetingsListID AND
        tp_InstanceID = @InstanceID AND
        tp_RowOrdinal = 0
    UPDATE
        UserData
    SET
        tp_Version  = tp_Version + 1,
        tp_Editor   = @UserId,
        tp_Modified = @Now
    WHERE
        tp_ListId = @MeetingsListID AND
        tp_InstanceID = @InstanceID
    IF @@ROWCOUNT = 1
        RETURN 0
    ELSE
        RETURN 2

GO
