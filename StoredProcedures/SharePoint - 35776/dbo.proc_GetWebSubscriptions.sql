/****** Object:  StoredProcedure [dbo].[proc_GetWebSubscriptions]    Script Date: 5/15/2018 12:12:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetWebSubscriptions(
    @SiteId         uniqueidentifier,
    @WebId          uniqueidentifier,
    @UserId         int)
AS
    SET NOCOUNT ON
    SELECT
        ImmedSubscriptions.Id,
        ImmedSubscriptions.ListId,
        ImmedSubscriptions.ItemId,
        ImmedSubscriptions.EventType,
        0 AS NotifyFrequency,
        NULL AS NotifyTime,
        ImmedSubscriptions.Status,
        ImmedSubscriptions.UserId,
        ImmedSubscriptions.ListUrl,
        ImmedSubscriptions.ListTitle,
        CASE
            WHEN ImmedSubscriptions.ItemId IS NULL THEN NULL
            WHEN ImmedSubscriptions.ItemDocId IS NOT NULL THEN Docs.LeafName
            WHEN (ImmedSubscriptions.ListBaseType = 5 OR
                ImmedSubscriptions.ListServerTemplate = 103)
            THEN NULL
            ELSE UserData.nvarchar1
            END AS ItemName,
        ImmedSubscriptions.AlertTitle,
        ImmedSubscriptions.AlertType,
        ImmedSubscriptions.AlertTemplateName,
        ImmedSubscriptions.Filter,
        ImmedSubscriptions.BinaryFilter,
        ImmedSubscriptions.Properties
    FROM
        ImmedSubscriptions
    LEFT OUTER JOIN
        UserData
    ON
        UserData.tp_ListId  = ImmedSubscriptions.ListId     AND
        UserData.tp_ID      = ImmedSubscriptions.ItemId  AND
        UserData.tp_IsCurrent = 1 AND
        UserData.tp_RowOrdinal = 0
    LEFT OUTER JOIN
        Docs
    ON
        Docs.VersionCreatedSinceSTCheckout = 0 AND
        Docs.Id             = ImmedSubscriptions.ItemDocId
    WHERE
        ImmedSubscriptions.SiteId   = @SiteId   AND
        ImmedSubscriptions.WebId    = @WebId    AND
        (ImmedSubscriptions.UserId  = @UserId   OR
            @UserId IS NULL) AND
        ImmedSubscriptions.Deleted  = 0
    UNION ALL
    SELECT
        SchedSubscriptions.Id,
        SchedSubscriptions.ListId,
        SchedSubscriptions.ItemId,
        SchedSubscriptions.EventType,
        SchedSubscriptions.NotifyFreq AS NotifyFrequency,
        SchedSubscriptions.NotifyTime,
        SchedSubscriptions.Status,
        SchedSubscriptions.UserId,
        SchedSubscriptions.ListUrl,
        SchedSubscriptions.ListTitle,
        CASE
            WHEN SchedSubscriptions.ItemId IS NULL THEN NULL
            WHEN SchedSubscriptions.ItemDocId IS NOT NULL THEN Docs.LeafName
            WHEN SchedSubscriptions.ListBaseType = 5 OR
                SchedSubscriptions.ListServerTemplate = 103
            THEN NULL
            ELSE UserData.nvarchar1
            END AS ItemName,
        SchedSubscriptions.AlertTitle,
        SchedSubscriptions.AlertType,
        SchedSubscriptions.AlertTemplateName,
        SchedSubscriptions.Filter,
        SchedSubscriptions.BinaryFilter,
        SchedSubscriptions.Properties
    FROM
        SchedSubscriptions
    LEFT OUTER JOIN
        UserData
    ON
        UserData.tp_ListId  = SchedSubscriptions.ListId     AND
        UserData.tp_ID      = SchedSubscriptions.ItemId AND
        UserData.tp_IsCurrent = 1 AND
        UserData.tp_RowOrdinal = 0
    LEFT OUTER JOIN
        Docs
    ON
        Docs.VersionCreatedSinceSTCheckout = 0 AND
        Docs.Id             = SchedSubscriptions.ItemDocId
    WHERE
        SchedSubscriptions.SiteId   = @SiteId   AND
        SchedSubscriptions.WebId    = @WebId    AND
        (SchedSubscriptions.UserId  = @UserId   OR
            @UserId IS NULL) AND
        SchedSubscriptions.Deleted  = 0
    ORDER BY
        NotifyFrequency

GO
