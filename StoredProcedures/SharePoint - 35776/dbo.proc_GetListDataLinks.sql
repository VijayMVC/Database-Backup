/****** Object:  StoredProcedure [dbo].[proc_GetListDataLinks]    Script Date: 5/15/2018 12:12:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetListDataLinks(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @FirstDirName nvarchar(256),
    @FirstLeafName nvarchar(128),
    @FirstLevel tinyint,
    @LastDirName nvarchar(256),
    @LastLeafName nvarchar(128),
    @LastLevel tinyint,
    @GetWebListForNormalization bit)
AS
    SET NOCOUNT ON
    IF @GetWebListForNormalization = 1
    BEGIN
        SELECT
            FullUrl
        FROM
            Webs
        WHERE
            SiteId = @SiteId AND
            ParentWebId = @WebId 
    END
    SELECT
        Links.DirName,
        Links.LeafName,
        Links.Level,
        Links.FieldId,
        Links.TargetDirName,
        Links.TargetLeafName,
        Links.Type,
        Links.Security,
        Links.Dynamic,
        Links.ServerRel,
        Docs2.Type,
        Links.PointsToDir
    FROM
        Links
    INNER JOIN
        Docs AS Docs
    ON
        Links.SiteId = Docs.SiteId AND
        Links.DirName = Docs.DirName AND
        Links.LeafName = Docs.LeafName AND
        Links.Level = Docs.Level
    LEFT OUTER JOIN
        Docs AS Docs2
    ON
        Links.SiteId = Docs2.SiteId AND
        Links.TargetDirName = Docs2.DirName AND
        Links.TargetLeafName = Docs2.LeafName AND
        1 = Docs2.Level
    WHERE
        Links.SiteId = @SiteId AND
        ((Links.DirName = @FirstDirName AND
                Links.LeafName = @FirstLeafName AND
                Links.Level = @FirstLevel) OR
            (Links.DirName = @FirstDirName AND
                Links.LeafName = @FirstLeafName AND
                Links.Level > @FirstLevel) OR
            (Links.DirName = @FirstDirName AND
                Links.LeafName > @FirstLeafName) OR
            (Links.DirName > @FirstDirName)) AND
        ((Links.DirName = @LastDirName AND
                Links.LeafName = @LastLeafName AND
                Links.Level = @LastLevel) OR
            (Links.DirName = @LastDirName AND
                Links.LeafName = @LastLeafName AND
                Links.Level < @LastLevel) OR
            (Links.DirName = @LastDirName AND
                Links.LeafName < @LastLeafName) OR
            (Links.DirName < @LastDirName)) AND
        Links.FieldId IS NOT NULL AND
        Docs.ListDataDirty = 1
    ORDER BY
        Links.DirName Asc, Links.LeafName Asc, Links.Level Asc,
        Links.FieldId Asc, Links.LinkNumber Asc

GO
