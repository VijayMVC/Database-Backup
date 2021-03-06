/****** Object:  StoredProcedure [dbo].[proc_DeplGetListWebParts]    Script Date: 5/15/2018 12:11:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplGetListWebParts(
    @LastOrdinal int,
    @SiteId uniqueidentifier)
AS
    SET NOCOUNT ON
    SELECT
        wp.tp_ID,
        wp.tp_ListID,
        wp.tp_Type,
        wp.tp_Flags,
        CASE
            WHEN tp_Flags & 8 <> 0 THEN 1
            ELSE 0
        END as tp_Hidden,
        CASE
            WHEN tp_Flags & 65536 <> 0 THEN 1
            ELSE 0
        END as tp_Threaded,
        CASE
            WHEN tp_Flags & 2 <> 0 THEN 1
            ELSE 0
        END as tp_FPModified,
        CASE
            WHEN tp_Flags & 32 <> 0 THEN 1
            ELSE 0
        END as tp_ReadOnly,
        CASE
            WHEN tp_Flags & 4096 <> 0 AND
                tp_Flags & 2097152 <> 0
                THEN 'Recursive'
            WHEN tp_Flags & 4096 <> 0 AND
                tp_Flags & 2097152 = 0
                THEN 'RecursiveAll'
             WHEN tp_Flags & 4096 = 0 AND
                tp_Flags & 2097152 <> 0
                THEN 'FilesOnly'
            ELSE ''
        END as tp_Scope,
        CASE
            WHEN tp_Flags & 8192 <> 0 THEN 1
            ELSE 0
        END as tp_RecurrenceRowset,
        CASE
            WHEN tp_Flags & 16384 <> 0
                THEN 'Contributor'
            WHEN tp_Flags & 32768 <> 0
                THEN 'Moderator'
            ELSE ''
        END as tp_ModerationType,
        CASE
            WHEN tp_Flags & 262144 <> 0 THEN 1
            ELSE 0
        END as tp_Personal,
        CASE
            WHEN tp_Flags & 4194304 <> 0 THEN 1
            ELSE 0
        END as tp_Ordered,
        wp.tp_DisplayName,
        wp.tp_ContentTypeId,
        '/' + CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END as tp_PageUrl,
        wp.tp_BaseViewId,
        wp.tp_View,
        wp.tp_Level,
        CASE
            WHEN (tp_Flags & 1048576) <> 0 THEN 1
            ELSE 0
        END as tp_IsDefault,
        wp.tp_ZoneID,
        wp.tp_IsIncluded,
        wp.tp_PartOrder,
        wp.tp_FrameState,
        Docs.Id,
        CASE
            WHEN NavNodes.DocId IS NOT NULL THEN 1
            ELSE 0
        END as OnQuickLaunch,
        CASE
            WHEN tp_Flags & 8388608 <> 0 THEN 1
            ELSE 0
        END as tp_MobileView,
        CASE
            WHEN tp_Flags & 16777216 <> 0 THEN 1
            ELSE 0
        END as tp_MobileDefaultView,
        CASE
            WHEN tp_Flags & 268435456 <> 0 THEN 1
            ELSE 0
        END as tp_ContentTypeDefault,
        CASE
            WHEN tp_Flags & 16 <> 0 THEN 1
            ELSE 0
        END as tp_LockWeb,
        CASE
            WHEN tp_Flags & 64 <> 0 THEN 1
            ELSE 0
        END as tp_FailIfEmpty,
        CASE
            WHEN tp_Flags & 128 <> 0 THEN 1
            ELSE 0
        END as tp_FreeForm,
        CASE
            WHEN tp_Flags & 256 <> 0 THEN 1
            ELSE 0
        END as tp_FileDialog,
        CASE
            WHEN tp_Flags & 1024 <> 0 THEN 1
            ELSE 0
        END as tp_AggregationView,
        CASE
            WHEN tp_Flags & 134217728 <> 0 THEN 1
            ELSE 0
        END as tp_IncludeRootFolder,
        CASE
            WHEN tp_Flags & 33554432 <> 0 THEN 1
            ELSE 0
        END as tp_IncludeVersions
        FROM
            WebParts wp
        INNER JOIN
            Docs
        ON
            Docs.SiteId = wp.tp_SiteID AND
            Docs.Id = wp.tp_PageUrlID AND
            Docs.ListId = wp.tp_ListId AND 
            Docs.Level = wp.tp_Level AND
            Docs.Level = 1
        LEFT JOIN
            NavNodes
        ON
            NavNodes.SiteId = @SiteId AND
            NavNodes.WebId = Docs.WebId AND
            NavNodes.DocId = Docs.Id
        WHERE wp.tp_ListId IN
            (SELECT TOP 50
                e.Id
             FROM #ExportObjects e
             WHERE
                 e.Ordinal > @LastOrdinal AND
                 e.Type = 3 AND
                 e.IsDeleted = 0
             ORDER BY e.Ordinal) AND
            wp.tp_SiteId = @SiteId AND
            NOT (ISNULL(tp_BaseViewId, 0) = 0 AND tp_Type <= 1) and
            wp.tp_Flags & 262144 = 0
        ORDER BY wp.tp_CreationTime

GO
