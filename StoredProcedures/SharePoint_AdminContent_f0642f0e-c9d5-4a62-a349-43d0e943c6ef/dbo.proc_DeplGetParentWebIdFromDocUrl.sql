/****** Object:  StoredProcedure [dbo].[proc_DeplGetParentWebIdFromDocUrl]    Script Date: 5/15/2018 12:12:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplGetParentWebIdFromDocUrl(
    @SiteId uniqueidentifier,
    @DocUrl nvarchar(260))
AS
    SET NOCOUNT ON
    IF @SiteId IS NULL OR @DocUrl IS NULL
        RETURN 87
    DECLARE @DirName nvarchar(256)
    DECLARE @LeafName nvarchar(128)
    EXEC proc_SplitUrl @DocUrl, @DirName OUTPUT, @LeafName OUTPUT
    SELECT
        Docs.WebId, Docs.ListId
    FROM
        Docs
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @DirName AND
        Docs.LeafName = @LeafName

GO
