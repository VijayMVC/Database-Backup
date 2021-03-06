/****** Object:  StoredProcedure [dbo].[proc_DeplExportGroupX]    Script Date: 5/15/2018 12:11:53 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplExportGroupX(
    @SiteId uniqueidentifier,
    @EventTime datetime,
    @ChangeLogId bigint)
AS
    SET NOCOUNT ON
    SELECT 
        EventCache.EventType,
        Groups.ID,
        Groups.Title,
        Groups.Description,
        U2.tp_Login,
        Groups.OwnerIsuser,
        UserInfo.tp_Id,
        UserInfo.tp_Login,
        Groups.RequestEmail,
        Groups.Flags
    FROM
        EventCache
    INNER JOIN
        Groups
    ON
        Groups.SiteId = EventCache.SiteId AND
        Groups.Id = EventCache.int0
    LEFT JOIN
        UserInfo AS U2
    ON
        Groups.SiteId = U2.tp_SiteId AND
        Groups.Owner = U2.tp_Id
    LEFT OUTER JOIN
        UserInfo
    ON
        UserInfo.tp_SiteId = EventCache.SiteId AND
        UserInfo.tp_Id = EventCache.ItemId
    WHERE
        EventCache.EventTime = @EventTime AND
        EventCache.Id = @ChangeLogId AND
        EventCache.ObjectType = 256 AND
        EventCache.SiteId = @SiteId
    UNION
    SELECT 
        EventCache.EventType,
        EventCache.Int0,
        EventCache.ItemName,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL
    FROM EventCache
    WHERE
        EventCache.EventTime = @EventTime AND
        EventCache.Id = @ChangeLogId AND
        EventCache.ObjectType = 256 AND
        EventCache.EventType = 16384 AND
        EventCache.SiteId = @SiteId

GO
