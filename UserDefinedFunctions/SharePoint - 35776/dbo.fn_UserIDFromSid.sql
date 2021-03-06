/****** Object:  UserDefinedFunction [dbo].[fn_UserIDFromSid]    Script Date: 5/15/2018 12:15:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.fn_UserIDFromSid(
    @SiteId uniqueidentifier,
    @SystemID tSystemID)
RETURNS int
    BEGIN
        IF (@SystemID IS NULL)
            RETURN NULL
        RETURN
        (
            SELECT
                tp_ID
            FROM
                UserInfo
            WHERE
                tp_SiteId = @SiteId AND
                tp_SystemID = @SystemID
        )
    END

GO
