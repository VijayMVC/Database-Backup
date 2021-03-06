/****** Object:  StoredProcedure [dbo].[proc_UserHasDataItems]    Script Date: 5/15/2018 12:12:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UserHasDataItems(
    @ListID uniqueidentifier,
    @UserID int,
    @InstanceID int)
AS
    SET NOCOUNT ON
    IF EXISTS(
        SELECT
            *
        FROM
            UserData
        WHERE
            tp_ListID = @ListID AND
            tp_Author = @UserID AND
            (@InstanceID IS NULL OR tp_InstanceID IS NULL OR
                tp_InstanceID = @InstanceID))
        BEGIN
            RETURN 1
        END
        ELSE
        BEGIN
            RETURN 0
        END

GO
