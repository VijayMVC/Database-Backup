/****** Object:  StoredProcedure [dbo].[proc_GetWebSubscriptionsUniqueUsers]    Script Date: 5/15/2018 12:12:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetWebSubscriptionsUniqueUsers(
    @SiteId     uniqueidentifier,
    @WebId      uniqueidentifier)
AS
    SET NOCOUNT ON
    SELECT DISTINCT
        UserInfo.tp_Login
    FROM
        ImmedSubscriptions
    INNER JOIN
        UserInfo
    ON
        UserInfo.tp_SiteID  = @SiteId   AND
        UserInfo.tp_ID      = ImmedSubscriptions.UserId
    WHERE
        SiteId              = @SiteId   AND
        WebId               = @WebId    AND
        Deleted             = 0
    UNION
    SELECT DISTINCT
        UserInfo.tp_Login
    FROM
        SchedSubscriptions
    INNER JOIN
        UserInfo
    ON
        UserInfo.tp_SiteID  = @SiteId   AND
        UserInfo.tp_ID      = SchedSubscriptions.UserId
    WHERE
        SiteId              = @SiteId   AND
        WebId               = @WebId    AND
        Deleted             = 0
    ORDER BY
        UserInfo.tp_Login

GO
