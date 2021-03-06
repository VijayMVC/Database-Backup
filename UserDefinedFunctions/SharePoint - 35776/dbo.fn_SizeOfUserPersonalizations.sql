/****** Object:  UserDefinedFunction [dbo].[fn_SizeOfUserPersonalizations]    Script Date: 5/15/2018 12:15:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.fn_SizeOfUserPersonalizations(
    @SiteId uniqueidentifier,
    @DocId uniqueidentifier,
    @UserId int)
RETURNS bigint
    BEGIN
        DECLARE @cbDelta bigint
        SELECT @cbDelta =
            66 + ISNULL(DATALENGTH(tp_PerUserProperties), 0) + ISNULL(DATALENGTH(tp_Cache), 0)
        FROM
            dbo.Personalization
        WHERE
            Personalization.tp_SiteID = @SiteId AND
            Personalization.tp_PageUrlID = @DocId AND
            Personalization.tp_UserID = @UserId
        RETURN @cbDelta
    END

GO
