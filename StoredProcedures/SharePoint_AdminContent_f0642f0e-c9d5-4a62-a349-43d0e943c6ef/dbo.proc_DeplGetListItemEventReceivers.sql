/****** Object:  StoredProcedure [dbo].[proc_DeplGetListItemEventReceivers]    Script Date: 5/15/2018 12:12:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplGetListItemEventReceivers(
    @LastOrdinal int,
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier)
AS
    SET NOCOUNT ON
    SELECT
        ER.Id,
        ER.HostId,
        ER.WebId,
        ER.Name,
        ER.HostType,
        ER.ItemId,
        ER.Type,
        ER.SequenceNumber,
        ER.Assembly,
        ER.Class,
        ER.Data,
        ER.Filter,
        ER.Credential,
        E.Id as ListItemId
    FROM
        (SELECT TOP 200
            E2.Id,
            E2.ParentWebId,
            E2.DirName,
            E2.LeafName
        FROM #ExportObjects E2
        WHERE
            E2.Ordinal > @LastOrdinal AND
            E2.Type = 4 AND
            E2.ParentId = @ListId AND
            E2.IsDeleted = 0
        ORDER BY E2.Ordinal ) AS E
    INNER JOIN 
        Docs TargetDocs
    ON
        TargetDocs.SiteId = @SiteId AND
        TargetDocs.WebId = E.ParentWebId AND
        TargetDocs.ListId = @ListID AND
        TargetDocs.DirName = E.DirName AND
        TargetDocs.LeafName = E.LeafName
    INNER JOIN
        EventReceivers ER
    ON
        ER.SiteId = @SiteId AND
        ER.WebId = E.ParentWebId AND
        ER.HostId = TargetDocs.Id AND
        ER.HostType <> 5 AND
        ER.Type <> 32767

GO
