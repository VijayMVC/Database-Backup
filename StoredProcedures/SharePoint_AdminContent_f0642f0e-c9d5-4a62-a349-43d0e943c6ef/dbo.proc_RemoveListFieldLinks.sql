/****** Object:  StoredProcedure [dbo].[proc_RemoveListFieldLinks]    Script Date: 5/15/2018 12:12:52 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_RemoveListFieldLinks(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @ListId uniqueidentifier,
    @FieldId uniqueidentifier
)
AS
    SET NOCOUNT ON
    DECLARE @ListRoot nvarchar(256)
    DECLARE @ListRootEscaped nvarchar(1024)
    SELECT
        @ListRoot = CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END
    FROM
        Lists
    INNER JOIN
        Docs
    ON
        Lists.tp_RootFolder = Docs.Id AND
        1 = Docs.Level
    WHERE
        Lists.tp_WebId = @WebId AND
        Lists.tp_ID = @ListId
    EXEC proc_EscapeForLike @ListRoot, @ListRootEscaped OUTPUT, 1
    DELETE FROM
        Links
    WHERE
        SiteId = @SiteId AND
        DirName = @ListRoot AND
        FieldId = @FieldId
    DELETE FROM
        Links
    WHERE
        SiteId = @SiteId AND
        DirName LIKE @ListRootEscaped AND
        FieldId = @FieldId
    RETURN 0

GO
