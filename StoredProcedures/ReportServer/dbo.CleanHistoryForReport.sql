/****** Object:  StoredProcedure [dbo].[CleanHistoryForReport]    Script Date: 5/15/2018 12:11:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- delete snapshots exceeding # of snapshots. won't work if @SnapshotLimit = 0
CREATE PROCEDURE [dbo].[CleanHistoryForReport]
@SnapshotLimit int,
@ReportID uniqueidentifier
AS
SET NOCOUNT OFF
DELETE FROM History
WHERE ReportID = @ReportID and SnapshotDate < 
    (SELECT MIN(SnapshotDate)
     FROM 
        (SELECT TOP (@SnapshotLimit) SnapshotDate
         FROM History
         WHERE ReportID = @ReportID
         ORDER BY SnapshotDate DESC
        ) AS TopSnapshots
    )

GO
