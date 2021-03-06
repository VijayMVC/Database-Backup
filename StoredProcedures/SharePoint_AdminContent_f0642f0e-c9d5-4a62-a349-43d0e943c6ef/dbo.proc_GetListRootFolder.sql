/****** Object:  StoredProcedure [dbo].[proc_GetListRootFolder]    Script Date: 5/15/2018 12:12:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_GetListRootFolder(
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier,
    @DirName nvarchar(256) OUTPUT
    )
AS
    SET NOCOUNT ON
    SELECT
        @DirName = CASE WHEN (DATALENGTH(DirName) = 0) THEN LeafName WHEN (DATALENGTH(LeafName) = 0) THEN DirName ELSE DirName + N'/' + LeafName END
    FROM
        Docs WITH (NOLOCK)
    JOIN
        Lists
    ON
        Lists.tp_RootFolder = Docs.Id AND
        Lists.tp_ID = @ListId
    WHERE
        Docs.SiteId = @SiteId

GO
