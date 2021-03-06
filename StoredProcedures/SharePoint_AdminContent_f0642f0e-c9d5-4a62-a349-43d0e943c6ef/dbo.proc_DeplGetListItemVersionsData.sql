/****** Object:  StoredProcedure [dbo].[proc_DeplGetListItemVersionsData]    Script Date: 5/15/2018 12:12:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplGetListItemVersionsData(
    @LastOrdinal int,
    @VersionSetting int,
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @SelectSql nvarchar(4000)
    DECLARE @VersionTable nvarchar(20)
    IF (@VersionSetting = 4)
    BEGIN
       SET @VersionTable = N' UserDataVersioned '
    END
    ELSE
    BEGIN
       SET @VersionTable = N' UserData '
    END
    SET @SelectSql = N'
SELECT
    E.Id AS Id,
    E.FullUrl AS ExportObjectUrl,
    E.Ordinal,
    E.ParentId,
    E.DirName,
    E.LeafName,
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
    NULL, -- ThreadIndex
    UD.tp_UIVersionString,
    NULL, -- DocId
    NULL, -- DocType
    NULL, -- Perms
    NULL, -- Login Name
    NULL, -- Group Name
    UD.tp_Level
FROM ' + @VersionTable + N' UD
INNER JOIN
    (SELECT TOP 200
        E2.Id,
        E2.FullUrl,
        E2.Ordinal,
        E2.ParentId,
        E2.DirName,
        E2.LeafName
        FROM #ExportObjects E2
        WHERE
            E2.Ordinal > @LastOrdinal AND
            E2.Type = 4 AND
            E2.ParentId = @ListId AND
            E2.IsDeleted = 0
         ORDER BY E2.Ordinal ) AS E
ON
    E.DirName = UD.tp_DirName AND
    E.LeafName = UD.tp_LeafName AND
    UD.tp_ListId = @ListId
WHERE
    UD.tp_SiteId = @SiteId AND
    UD.tp_RowOrdinal = 0 AND
    UD.tp_Level <> 255
ORDER BY E.Ordinal, UD.tp_UIVersion ASC
'
    EXEC sp_executesql @SelectSql, N'@LastOrdinal int, @SiteId uniqueidentifier, @ListId uniqueidentifier, @VersionSetting int', @LastOrdinal, @SiteId, @ListId, @VersionSetting

GO
