/****** Object:  StoredProcedure [dbo].[proc_DeplGetListEventReceivers]    Script Date: 5/15/2018 12:11:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplGetListEventReceivers(
    @LastOrdinal int,
    @SiteId uniqueidentifier)
AS
    SET NOCOUNT ON
    SELECT
        er.Id,
        er.HostId,
        er.WebId,
        er.Name,
        er.HostType,
        er.ItemId,
        er.Type,
        er.SequenceNumber,
        er.Assembly,
        er.Class,
        er.Data,
        er.Filter,
        er.Credential
        FROM
            EventReceivers er
        INNER JOIN
             (SELECT TOP 50
                lists.Id, lists.ParentWebId
              FROM #ExportObjects lists
              WHERE
                  lists.Ordinal > @LastOrdinal AND
                  lists.Type = 3 AND
                  lists.IsDeleted = 0
              ORDER BY lists.Ordinal) as e
        ON
            e.Id = er.HostId AND
            e.ParentWebId = er.WebId AND
            er.SiteId = @SiteId AND
            er.HostType <> 5 AND
            er.Type <> 32767

GO
