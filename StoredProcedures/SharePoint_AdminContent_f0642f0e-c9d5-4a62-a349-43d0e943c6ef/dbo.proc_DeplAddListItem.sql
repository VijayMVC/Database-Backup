/****** Object:  StoredProcedure [dbo].[proc_DeplAddListItem]    Script Date: 5/15/2018 12:12:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplAddListItem(
    @SiteId uniqueidentifier,
    @Id uniqueidentifier,
    @Url nvarchar(260),
    @IncludeDescendants tinyint,
    @IsMajorFileOnly int,
    @IsLink tinyint,
    @IsSelected tinyint)
AS
    SET NOCOUNT ON
    DECLARE @DirName nvarchar(256)
    DECLARE @LeafName nvarchar(128)
    IF (@Id IS NULL OR @Id = '00000000-0000-0000-0000-000000000000') AND
        (@Url IS NULL OR DATALENGTH(@Url) = 0)
        RETURN 87
    IF @Url IS NULL OR DATALENGTH(@Url) = 0
    BEGIN
        SELECT
            @DirName = Docs.DirName,
            @LeafName = Docs.LeafName
        FROM
            Docs
        WHERE
            SiteId = @SiteId AND
            Id = @Id AND
            Type = 0
        IF @@ROWCOUNT  = 0
            RETURN 2
    END
    ELSE
        EXEC proc_SplitUrl @Url,
                           @DirName OUTPUT,
                           @LeafName OUTPUT
    IF EXISTS (
            SELECT 1 FROM #ExportObjects
            WHERE
                DirName = @DirName AND
                LeafName = @LeafName AND
                Type = 4)
        RETURN 0
    INSERT INTO #ExportObjects(
        Id,
        Type,
        Level,
        DirName,
        LeafName,
        ParentId,
        ParentWebId,
        IncludeDescendants,
        IsLink,
        FullUrl,
        IsSelected)
    SELECT DISTINCT
        NEWID(),
        4,
        0,
        ud.tp_DirName,
        ud.tp_LeafName,
        ud.tp_ListId,
        ud.WebId,
        @IncludeDescendants,
        @IsLink,
        CASE
            WHEN (DATALENGTH(ud.tp_DirName) = 0) THEN ud.tp_LeafName
            WHEN (DATALENGTH(ud.tp_LeafName) = 0) THEN ud.tp_DirName
            ELSE ud.tp_DirName + N'/' + ud.tp_LeafName
        END,
        @IsSelected
    FROM
    (
        SELECT DISTINCT
            UserData.tp_DirName,
            UserData.tp_LeafName,
            UserData.tp_ListId,
            Docs.WebId
        FROM
            UserData
        INNER JOIN
            Docs
        ON
            Docs.SiteId = @SiteId AND
            UserData.tp_DirName = Docs.DirName AND
            UserData.tp_LeafName = Docs.LeafName
        WHERE
            Docs.SiteId = @SiteId AND
            UserData.tp_DirName = @DirName AND
            UserData.tp_LeafName = @LeafName AND
            UserData.tp_RowOrdinal = 0 AND
            ((@IsMajorFileOnly = 1 AND UserData.tp_Level=1) OR
            (@IsMajorFileOnly = 0 AND UserData.tp_Level IN
                (SELECT TOP 1 d2.tp_Level FROM UserData d2
                WHERE
                d2.tp_Id = UserData.tp_Id AND
                d2.tp_ListId = UserData.tp_ListId AND
                d2.tp_Level <> 255)))
     ) ud
    IF @@ROWCOUNT = 0
        RETURN 2
    ELSE
        RETURN 0

GO
