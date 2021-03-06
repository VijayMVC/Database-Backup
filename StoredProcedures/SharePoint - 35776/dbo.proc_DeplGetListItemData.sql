/****** Object:  StoredProcedure [dbo].[proc_DeplGetListItemData]    Script Date: 5/15/2018 12:11:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplGetListItemData(
    @SiteId         uniqueidentifier,
    @LastOrdinal    int,
    @VersionSetting int,
    @ListId         uniqueidentifier,
    @Columns        nvarchar(1700))
AS
    SET NOCOUNT ON
    DECLARE @IsMajorFileOnly int
    IF (@VersionSetting = 1)
    BEGIN
        SET @IsMajorFileOnly = 1
    END
    ELSE
    BEGIN
        SET @IsMajorFileOnly = 0
    END
    DECLARE @UserInfoListId uniqueidentifier
    SELECT
        @UserInfoListId = UserInfoListId
    FROM
        Sites
    WHERE
        Id = @SiteId
    SELECT
        UD.Id,
        UD.FullUrl AS ExportObjectUrl,
        UD.Ordinal,
        UD.ParentId,
        UD.DirName,
        UD.LeafName,
        UD.tp_ID AS IntId,
        UD.tp_RowOrdinal,
        UD.tp_UIVersion,
        UD.tp_Author,
        UD.tp_Editor,
        UD.tp_Modified,
        UD.tp_Created,
        UD.tp_Ordering,
        UD.tp_HasAttachment,
        UD.tp_ModerationStatus,
        UD.tp_IsCurrent,
        UD.tp_ItemOrder,
        UD.tp_InstanceID,
        UD.tp_CopySource,
        UD.tp_HasCopyDestinations,
        UD.tp_AuditFlags,
        UD.tp_InheritAuditFlags,
        UD.tp_ContentType,
        UD.tp_ContentTypeId,
        UD.tp_ThreadIndex,
        UD.tp_UIVersionString,
        Docs.Id,
        Docs.Type,
        Docs.ParentId as FolderId,
        Perms.Acl,
        CASE
            WHEN @ListId = @UserInfoListId THEN (SELECT tp_Login FROM UserInfo WHERE tp_SiteId = @SiteId AND tp_Id = UD.tp_Id)
            ELSE NULL
        END AS UserLoginName,
        CASE
            WHEN @ListId = @UserInfoListId THEN (SELECT title FROM groups WHERE groups.SiteId = @SiteId AND groups.Id = UD.tp_Id)
            ELSE NULL
        END AS GroupName,
        UD.tp_Level
        FROM (
        SELECT TOP 200
            E.Id,
            E.FullUrl,
            E.Ordinal,
            E.ParentId,
            E.DirName,
            E.LeafName,
            UD.tp_ID,
            UD.tp_RowOrdinal,
            UD.tp_UIVersion,
            UD.tp_Author,
            UD.tp_Editor,
            UD.tp_Modified,
            UD.tp_Created,
            UD.tp_Ordering,
            UD.tp_HasAttachment,
            UD.tp_ModerationStatus,
            UD.tp_IsCurrent,
            UD.tp_ItemOrder,
            UD.tp_InstanceID,
            UD.tp_CopySource,
            UD.tp_HasCopyDestinations,
            UD.tp_AuditFlags,
            UD.tp_InheritAuditFlags,
            UD.tp_ContentType,
            UD.tp_ContentTypeId,
            UD.tp_ThreadIndex,
            UD.tp_UIVersionString,
            UD.tp_Level,
            UD.tp_SiteId,
            UD.tp_DirName,
            UD.tp_LeafName
        FROM #ExportObjects E
        INNER JOIN
            UserData UD
        ON
            UD.tp_SiteId = @SiteId AND
            E.DirName = UD.tp_DirName AND
            E.LeafName = UD.tp_LeafName AND
            UD.tp_ListId = @ListId AND
            UD.tp_RowOrdinal = 0
        WHERE
            E.Ordinal > @LastOrdinal AND
            E.Type = 4 AND
            E.ParentId = @ListId AND
            E.IsDeleted = 0 AND
            ((@IsMajorFileOnly = 1 AND UD.tp_Level = 1 ) OR
             (@IsMajorFileOnly <> 1 AND UD.tp_Level IN
              (SELECT TOP 1
                   d2.tp_Level
               FROM UserData d2
               WHERE
                   d2.tp_SiteId = @SiteId AND
                   d2.tp_ListId = @ListId AND
                   d2.tp_DirName = UD.tp_DirName AND
                   d2.tp_LeafName = UD.tp_LeafName AND
                   d2.tp_RowOrdinal=0 AND
                   d2.tp_Level <> 255)))
        ORDER BY E.Ordinal) UD
    INNER JOIN
        Docs
    ON
        Docs.SiteId = UD.tp_SiteId AND
        Docs.DirName = UD.tp_DirName AND
        Docs.LeafName = UD.tp_LeafName AND
        Docs.Level = UD.tp_Level
    INNER JOIN
        Perms
    ON
        Docs.SiteId = Perms.SiteId AND
        Docs.ScopeId = Perms.ScopeId
    WHERE
        ((@IsMajorFileOnly = 1 AND UD.tp_Level = 1 ) OR
         (@IsMajorFileOnly <> 1 AND UD.tp_Level IN
          (SELECT TOP 1
                d2.tp_Level
            FROM UserData d2
            WHERE
                d2.tp_SiteId = @SiteId AND
                d2.tp_ListId = @ListId AND
                d2.tp_DirName = UD.tp_DirName AND
                d2.tp_LeafName = UD.tp_LeafName AND
                d2.tp_RowOrdinal=0 AND
                d2.tp_Level <> 255)))
    ORDER BY
        UD.Ordinal
    EXEC proc_DeplGetListItemFields @LastOrdinal, @IsMajorFileOnly, @SiteId, @ListId, @Columns
    EXEC proc_DeplGetListItemMvlFields @LastOrdinal, @IsMajorFileOnly, @SiteId, @ListId, @Columns
    -- If Version > 1 call these... ELSE don't call
    EXEC proc_DeplGetListItemVersionsData @LastOrdinal, @VersionSetting, @SiteId, @ListId
    EXEC proc_DeplGetListItemVersionsFields @LastOrdinal, @VersionSetting, @SiteId, @ListId, @Columns
    EXEC proc_DeplGetListItemMvlVersionsFields @LastOrdinal, @IsMajorFileOnly, @SiteId, @ListId, @Columns
    EXEC proc_DeplGetListItemLinks @LastOrdinal, @IsMajorFileOnly, @SiteId, @ListId
    EXEC proc_DeplGetListItemAttachments @LastOrdinal, @SiteId, @ListId
    EXEC proc_DeplGetListItemEventReceivers @LastOrdinal, @SiteId, @ListId

GO
