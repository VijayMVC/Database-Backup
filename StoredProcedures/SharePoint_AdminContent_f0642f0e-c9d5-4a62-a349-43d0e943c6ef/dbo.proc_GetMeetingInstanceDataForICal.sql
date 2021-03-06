/****** Object:  StoredProcedure [dbo].[proc_GetMeetingInstanceDataForICal]    Script Date: 5/15/2018 12:12:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetMeetingInstanceDataForICal
(
    @WebId              uniqueidentifier,
    @InstanceID         int,
    @@OrganizerID       int OUTPUT,
    @@UID               nvarchar(255) OUTPUT,
    @@DTStartUTC        datetime OUTPUT,
    @@DTEndUTC          datetime OUTPUT,
    @@DTStampUTC        datetime OUTPUT,
    @@Sequence          int OUTPUT
)
AS
    SET NOCOUNT ON
    DECLARE @MeetingsListID uniqueidentifier
    EXEC proc_GetUniqueList @WebId, 200, @MeetingsListID OUTPUT
    IF @MeetingsListID IS NULL
        RETURN 13
    SELECT TOP 1
        @@OrganizerID   = int6,
        @@UID           = nvarchar1,
        @@DTStartUTC    = datetime1,
        @@DTEndUTC      = datetime2,
        @@DTStampUTC    = datetime4,
        @@Sequence      = int5
    FROM
        UserData
    WHERE
        tp_ListId = @MeetingsListID AND
        tp_InstanceID = @InstanceID AND
        tp_RowOrdinal = 0
    IF @@ROWCOUNT = 0
        RETURN 2
    IF @@OrganizerID IS NULL OR @@UID IS NULL
    BEGIN
        SELECT TOP 1
            @@OrganizerID   = int6,
            @@UID           = nvarchar1
        FROM
            UserData
        WHERE
            tp_ListId = @MeetingsListID AND
            int1 = 1 AND
            tp_RowOrdinal = 0
        IF @@OrganizerID IS NULL OR @@UID IS NULL
            RETURN 13
    END
    RETURN 0

GO
