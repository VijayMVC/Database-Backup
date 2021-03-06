/****** Object:  StoredProcedure [dbo].[proc_DeplGetRootObjects]    Script Date: 5/15/2018 12:12:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplGetRootObjects
AS
    SET NOCOUNT ON
    SELECT
        e.Id,
        e.Type,
        e.ParentId,
        Webs.FullUrl,
        e.FullUrl,
        e.IsDependency,
        e.IsSelected
    FROM #ExportObjects e
    INNER JOIN Webs
    ON e.ParentWebId = Webs.Id
    WHERE
        NOT EXISTS
        (SELECT Id
         FROM #ExportObjects parent
         WHERE e.ParentId = parent.Id) AND
       NOT EXISTS
        (SELECT Id
         FROM #ExportObjects listitems
         WHERE
            listitems.IsDependency = 1 AND
            e.IsDependency = 1 AND
            listitems.Type = 4 AND
            e.Type = 7 AND
            listitems.FullUrl = e.FullUrl)

GO
