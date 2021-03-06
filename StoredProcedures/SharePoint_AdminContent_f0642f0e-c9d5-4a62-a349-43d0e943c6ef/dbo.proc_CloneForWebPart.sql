/****** Object:  StoredProcedure [dbo].[proc_CloneForWebPart]    Script Date: 5/15/2018 12:12:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_CloneForWebPart
(
    @SiteId          uniqueidentifier,
    @OldDocId        uniqueidentifier,
    @NewDocId        uniqueidentifier,
    @OldLevel        tinyint,
    @NewLevel        tinyint
)
AS
    SET NOCOUNT ON
    DECLARE @cbDelta bigint
    INSERT INTO WebPartLists(
        tp_SiteId,
        tp_ListId,
        tp_WebId,
        tp_PageUrlID,
        tp_WebPartID,
        tp_UserID,
        tp_Level)
    SELECT
        tp_SiteId,
        tp_ListId,
        tp_WebId,
        @NewDocId,
        tp_WebPartID,
        tp_UserID,
        @NewLevel
    FROM
        WebPartLists
    WHERE
        tp_SiteId = @SiteId AND
        tp_PageUrlID = @OldDocId AND
        tp_Level = @OldLevel AND
        (tp_UserID is NULL OR
         @NewLevel <> 255)
    INSERT INTO WebParts(
        tp_SiteId,
        tp_ID,
        tp_ListId,
        tp_Type,
        tp_Flags,
        tp_BaseViewID,
        tp_DisplayName,
        tp_ContentTypeId,
        tp_Version,
        tp_PageUrlID,
        tp_PartOrder,
        tp_ZoneID,
        tp_IsIncluded,
        tp_FrameState,
        tp_View,
        tp_WebPartTypeId,
        tp_AllUsersProperties,
        tp_PerUserProperties,
        tp_Cache,
        tp_UserID,
        tp_Source,
        tp_CreationTime,
        tp_Size,
        tp_Level,
        tp_HasFGP)
    SELECT
        tp_SiteId,
        tp_ID,
        tp_ListId,
        tp_Type,
        tp_Flags,
        tp_BaseViewID,
        tp_DisplayName,
        tp_ContentTypeId,
        tp_Version,
        @NewDocId,
        tp_PartOrder,
        tp_ZoneID,
        tp_IsIncluded,
        tp_FrameState,
        tp_View,
        tp_WebPartTypeId,
        tp_AllUsersProperties,
        tp_PerUserProperties,
        tp_Cache,
        tp_UserID,
        tp_Source,
        tp_CreationTime,
        tp_Size,
        @NewLevel,
        tp_HasFGP
    FROM
        WebParts
    WHERE
        tp_SiteId = @SiteId AND
        tp_PageUrlID = @OldDocId AND
        tp_Level = @OldLevel AND
        (tp_UserID is NULL OR
         @NewLevel <> 255)
    SELECT
        @cbDelta = ISNULL((SUM(CAST((tp_Size) AS BIGINT))), 0)
    FROM
        WebParts
    WHERE
        WebParts.tp_SiteID = @SiteId AND
        WebParts.tp_PageUrlID = @NewDocId AND
        WebParts.tp_Level = @NewLevel AND
        (WebParts.tp_UserID is NULL OR
        @NewLevel <> 255)
    EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp @SiteId, @cbDelta, 0

GO
