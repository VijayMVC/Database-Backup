/****** Object:  StoredProcedure [dbo].[proc_DirtyListData]    Script Date: 5/15/2018 12:12:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DirtyListData(
    @SiteId uniqueidentifier,
    @OldUrlDirName nvarchar(256),
    @OldUrlLeafName nvarchar(128),
    @Recurse bit)
AS
    DECLARE @ListDataDirty table(
        WebId uniqueidentifier,
        ListId uniqueidentifier,
        DirName nvarchar(256)
            COLLATE Latin1_General_CI_AS_KS_WS,
        LeafName nvarchar(128)
            COLLATE Latin1_General_CI_AS_KS_WS,
        Level tinyint
        )
    DECLARE @OldUrl nvarchar(260)
    DECLARE @OldUrlLike nvarchar(260)
    DECLARE @LastRowCount int
    DECLARE @LastError int
    IF @Recurse = 0
    BEGIN
        INSERT INTO @ListDataDirty
        SELECT DISTINCT
            Docs.WebId,
            Docs.ListId,
            Docs.DirName,
            Docs.LeafName,
            Docs.Level
        FROM
            Links INNER JOIN Docs
        ON
            Links.SiteId = Docs.SiteId AND
            Links.DirName = Docs.DirName AND
            Links.LeafName = Docs.LeafName AND
            Links.Level = Docs.Level
        WHERE
            Links.SiteId = @SiteId AND
            Links.TargetDirName = @OldUrlDirName AND
            (Links.TargetLeafName = @OldUrlLeafName OR
                Links.PointsToDir = 1) AND
            Links.FieldId IS NOT NULL
    END
    ELSE
    BEGIN
        SET @OldUrl = CASE WHEN (DATALENGTH(@OldUrlDirName) = 0) THEN @OldUrlLeafName WHEN (DATALENGTH(@OldUrlLeafName) = 0) THEN @OldUrlDirName ELSE @OldUrlDirName + N'/' + @OldUrlLeafName END
        EXEC proc_EscapeForLike @OldUrl, @OldUrlLike OUTPUT
        INSERT INTO @ListDataDirty
        SELECT DISTINCT
            Docs.WebId,
            Docs.ListId,
            Docs.DirName,
            Docs.LeafName,
            Docs.Level
        FROM
            Links INNER JOIN Docs
        ON
            Links.SiteId = Docs.SiteId AND
            Links.DirName = Docs.DirName AND
            Links.LeafName = Docs.LeafName AND
            Links.Level = Docs.Level
        WHERE
            Links.SiteId = @SiteId AND
            Links.TargetDirName = @OldUrlDirName AND
            (Links.TargetLeafName = @OldUrlLeafName OR
                Links.PointsToDir = 1) AND
            Links.FieldId IS NOT NULL
        UNION
        SELECT DISTINCT
            Docs.WebId,
            Docs.ListId,
            Docs.DirName,
            Docs.LeafName,
            Docs.Level
        FROM
            Links INNER JOIN Docs
        ON
            Links.SiteId = Docs.SiteId AND
            Links.DirName = Docs.DirName AND
            Links.LeafName = Docs.LeafName AND
            Links.Level = Docs.Level
        WHERE
            Links.SiteId = @SiteId AND
            Links.TargetDirName = @OldUrl AND
            Links.FieldId IS NOT NULL
        UNION
        SELECT DISTINCT
            Docs.WebId,
            Docs.ListId,
            Docs.DirName,
            Docs.LeafName,
            Docs.Level
        FROM
            Links INNER JOIN Docs
        ON
            Links.SiteId = Docs.SiteId AND
            Links.DirName = Docs.DirName AND
            Links.LeafName = Docs.LeafName AND
            Links.Level = Docs.Level
        WHERE
            Links.SiteId = @SiteId AND
            Links.TargetDirName LIKE @OldUrlLike AND
            Links.FieldId IS NOT NULL
    END
    SELECT @LastRowCount = @@ROWCOUNT, @LastError = @@ERROR
    IF @LastError <> 0
    BEGIN
        RETURN 1150
    END
    IF @LastRowCount > 0
    BEGIN
        UPDATE
            Lists
        SET
            tp_ListDataDirty = tp_ListDataDirty | 1,
            tp_CacheParseId = NULL
        FROM
            Lists INNER JOIN @ListDataDirty AS ListDataDirty
        ON
            Lists.tp_WebId = ListDataDirty.WebId AND
            Lists.tp_ID = ListDataDirty.ListId
        IF @@ERROR <> 0
        BEGIN
            RETURN 1150
        END
        UPDATE
            Docs
        SET
            ListDataDirty = 1
        FROM
            Docs INNER JOIN @ListDataDirty AS ListDataDirty
        ON
            Docs.SiteId = @SiteId AND
            Docs.DirName = ListDataDirty.DirName AND
            Docs.LeafName = ListDataDirty.LeafName AND
            Docs.Level = ListDataDirty.Level
        IF @@ERROR <> 0
        BEGIN
            RETURN 1150
        END
    END
    RETURN 0

GO
