/****** Object:  StoredProcedure [dbo].[proc_DeplGetLookupListUrl]    Script Date: 5/15/2018 12:12:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE Procedure dbo.proc_DeplGetLookupListUrl(
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier,
    @Url nvarchar(260) output)
AS
    SET NOCOUNT ON
    IF @SiteId IS NULL OR @ListId IS NULL
        RETURN 87
    SELECT @Url = '/' + CASE WHEN (DATALENGTH(DirName) = 0) THEN LeafName WHEN (DATALENGTH(LeafName) = 0) THEN DirName ELSE DirName + N'/' + LeafName END
    FROM Docs
    INNER JOIN Lists
    ON
        Lists.tp_Id = @ListId AND
        Docs.SiteId = @SiteId AND
        Docs.Id = Lists.tp_RootFolder

GO
