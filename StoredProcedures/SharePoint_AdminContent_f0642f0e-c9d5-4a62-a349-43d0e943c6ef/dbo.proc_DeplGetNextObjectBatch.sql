/****** Object:  StoredProcedure [dbo].[proc_DeplGetNextObjectBatch]    Script Date: 5/15/2018 12:12:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplGetNextObjectBatch(
    @LastOrdinal int)
AS
    SET NOCOUNT ON
    SELECT
        Id,
        Type,
        ParentId,
        ParentWebId,
        '/' + FullUrl,
        Ordinal,
        IsDeleted,
        ContentTypeId,
        '/' + ParentWebUrl,
        EventTime,
        ChangeLogId
    FROM #ExportObjects
    WHERE Ordinal > @LastOrdinal AND
          Ordinal <= @LastOrdinal + 100
    ORDER BY Ordinal

GO
