/****** Object:  StoredProcedure [dbo].[proc_DeplGetFileVersions]    Script Date: 5/15/2018 12:12:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplGetFileVersions(
    @LastOrdinal int,
    @VersionSetting int,
    @SiteId uniqueidentifier)
AS
    SET NOCOUNT ON
    SELECT
        d.Id,
        d.UIVersion,
        d.TimeCreated,
        d.TimeLastModified,
        d.DocFlags,
        d.MetaInfo,
        d.CheckinComment,
        d.Level,
        d.SetupPath,
        d.SetupPathUser,
        d.SetupPathVersion,
        d.HasStream,
        d.ListId,
        d.Size
    FROM Docs d
    INNER JOIN
        (SELECT TOP 200
            E.DirName,
            E.LeafName
         FROM #ExportObjects E
         WHERE
            E.Ordinal > @LastOrdinal AND
            E.IsDeleted = 0 AND
            (E.Type = 5 OR
             E.Type = 7)
         ORDER BY E.Ordinal) e
    ON
        d.SiteId = @SiteId AND
        d.DirName = e.DirName AND
        d.LeafName = e.LeafName AND
        d.Level <> 255
    WHERE
        ((@VersionSetting = 1 AND d.Level = 1) OR
         (@VersionSetting <> 1))
    IF (@VersionSetting <> 4)
    BEGIN
        SELECT TOP 0
            dv.Id,
            dv.Version,
            dv.TimeCreated,
            dv.DocFlags,
            dv.MetaInfo,
            dv.CheckinComment,
            0,
            dv.Size
        FROM DocVersions dv
    END
    ELSE
    BEGIN
        SELECT
            dv.Id,
            dv.Version,
            dv.TimeCreated,
            dv.DocFlags,
            dv.MetaInfo,
            dv.CheckinComment,
            CASE
                WHEN Content IS NULL THEN 0
                ELSE 1
            END as HasStream,
            dv.Size
        FROM DocVersions dv
        WHERE dv.Id IN (SELECT TOP 200
                     E.Id
                     FROM #ExportObjects E
                     WHERE
                         E.Ordinal > @LastOrdinal AND
                         E.IsDeleted = 0 AND
                         (E.Type = 5 OR
                          E.Type = 7)
                     ORDER BY E.Ordinal)
         ORDER BY dv.Version ASC
    END

GO
