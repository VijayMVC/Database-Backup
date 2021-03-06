/****** Object:  StoredProcedure [dbo].[proc_MtgInstancesCursor]    Script Date: 5/15/2018 12:12:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MtgInstancesCursor
(
    @WebId              uniqueidentifier,
    @ExcludeExceptions  bit = NULL,     
    @PreservePast       bit = 1,
    @@NoMeetings        bit OUTPUT,
    @@Instances_cursor  CURSOR VARYING OUTPUT
)
AS
    SET NOCOUNT ON
    DECLARE @MeetingsListID uniqueidentifier
    EXEC proc_GetUniqueList @WebId, 200, @MeetingsListID OUTPUT
    IF @MeetingsListID IS NULL
    BEGIN
        SET @@NoMeetings = 1
        RETURN 0
    END
    SET @@NoMeetings =
        CASE WHEN EXISTS (
            SELECT
                NULL
            FROM
                UserData
            WHERE
                tp_ListId = @MeetingsListID
            )
            THEN 0
            ELSE 1
        END
    IF @@NoMeetings = 1
        RETURN 0
    DECLARE @Now datetime
    IF @PreservePast = 1
        SET @Now = GETUTCDATE()
    SET @@Instances_cursor = CURSOR
        LOCAL
        FAST_FORWARD
    FOR
    SELECT
        tp_InstanceID
    FROM
        UserData
    WHERE
        tp_ListId = @MeetingsListID AND
        tp_RowOrdinal = 0  AND 
        (int1 = 0 OR
            int1 = 2) AND
        (@ExcludeExceptions IS NULL OR
            @ExcludeExceptions = 0 OR bit2 = 0) AND
        (@PreservePast      = 0 OR datetime1 > @Now)
    OPEN @@Instances_cursor
    RETURN 0

GO
