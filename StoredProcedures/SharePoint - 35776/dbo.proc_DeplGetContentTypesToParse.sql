/****** Object:  StoredProcedure [dbo].[proc_DeplGetContentTypesToParse]    Script Date: 5/15/2018 12:11:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplGetContentTypesToParse(
    @SiteId uniqueidentifier,
    @LinksOnly tinyint)
AS
    SET NOCOUNT ON
    SELECT
        e.ContentTypeId,
        e.ContentTypeListId,
        e.ParentWebId
    FROM #ExportObjects e
    WHERE
        e.Type = 8 AND
        e.ParseContentType = 1 AND
        e.IsLink = @LinksOnly

GO
