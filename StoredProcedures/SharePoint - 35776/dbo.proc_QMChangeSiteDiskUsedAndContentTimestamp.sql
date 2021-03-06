/****** Object:  StoredProcedure [dbo].[proc_QMChangeSiteDiskUsedAndContentTimestamp]    Script Date: 5/15/2018 12:12:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_QMChangeSiteDiskUsedAndContentTimestamp
    @SiteId uniqueidentifier,
    @cbDelta bigint,
    @fIncrementTimestamp bit
AS
IF (@cbDelta IS NULL)
BEGIN
    SET @cbDelta = 0
END
IF ((@fIncrementTimestamp = 1) OR (@cbDelta <> 0))
BEGIN
UPDATE Sites SET
    LastContentChange = CASE
        WHEN @fIncrementTimestamp = 1
            THEN GETUTCDATE()
        ELSE
            LastContentChange
        END,
    DiskUsed = CASE
        WHEN DiskUsed + @cbDelta > 0
            THEN DiskUsed + @cbDelta
        ELSE
            0
        END,
    DiskWarned = CASE
        WHEN (DiskQuota > 0 AND DiskWarning > 0 AND @cbDelta > 0 AND
            DiskUsed + @cbDelta > DiskWarning AND
            (DiskWarned IS NULL OR DATEDIFF(Hour, DiskWarned, GetUTCDate()) >= 24))
            THEN GetUTCDate()
        WHEN (DiskWarned IS NOT NULL AND
            DiskQuota > 0 AND DiskWarning > 0 AND @cbDelta < 0 AND
            DiskUsed + @cbDelta < DiskWarning * 0.8)
            THEN NULL
        ELSE
            DiskWarned
        END           
WHERE Id = @SiteId
END

GO
