/****** Object:  StoredProcedure [dbo].[proc_EnsureMobileDefaultViewForList]    Script Date: 5/15/2018 12:12:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_EnsureMobileDefaultViewForList(
    @ListId uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @SiteId uniqueidentifier
    DECLARE @ViewId uniqueidentifier
    SELECT 
        @SiteId = tp_SiteId,
        @ViewId = tp_ID
    FROM 
        WebParts
    WHERE
        tp_ListId = @ListId AND
        tp_UserID IS NULL AND
        tp_Flags & 8388608 = 8388608
    IF @ViewId IS NOT NULL
    BEGIN
        IF NOT EXISTS (
            SELECT 
                *
            FROM 
                WebParts
            WHERE
                tp_ListId = @ListId AND
                tp_UserID IS NULL AND
                tp_Flags & 16777216 = 16777216
            )
        BEGIN
            UPDATE 
                WebParts
            SET
                tp_Flags = tp_Flags | 16777216
            WHERE
                tp_SiteId = @SiteId AND
                tp_ID = @ViewId
        END
    END
    RETURN 0

GO
