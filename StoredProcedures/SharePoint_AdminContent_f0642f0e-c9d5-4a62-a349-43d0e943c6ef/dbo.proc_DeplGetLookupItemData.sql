/****** Object:  StoredProcedure [dbo].[proc_DeplGetLookupItemData]    Script Date: 5/15/2018 12:12:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE Procedure dbo.proc_DeplGetLookupItemData(
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier)
AS
    SET NOCOUNT ON
    IF @SiteId IS NULL
        RETURN 87
    SELECT DISTINCT items.Id,
                    Docs.Id,
                    '/' + CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END,
                    CASE
                        WHEN e.Id IS NOT NULL THEN 1
                        ELSE 0
                    END as Included
    FROM #LookupItems items
    INNER JOIN UserData
    ON
        UserData.tp_SiteId = @SiteId AND
        UserData.tp_ListId = items.ListId AND
        UserData.tp_Id = items.Id AND
        items.ListId = @ListId
    INNER JOIN Docs
    ON
        Docs.SiteId = @SiteId AND
        UserData.tp_DirName = Docs.DirName AND
        UserData.tp_LeafName = Docs.LeafName
    LEFT JOIN #ExportObjects e
    ON
        Docs.Id = e.Id

GO
