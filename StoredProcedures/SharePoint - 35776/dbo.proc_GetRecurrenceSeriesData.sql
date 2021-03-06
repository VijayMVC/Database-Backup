/****** Object:  StoredProcedure [dbo].[proc_GetRecurrenceSeriesData]    Script Date: 5/15/2018 12:12:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetRecurrenceSeriesData
(
    @ListID             uniqueidentifier,
    @ItemID             int,
    @EventType          int,
    @EventTypeColName   nvarchar(64),
    @EventTypeRowOrd int = 0,
    @UIDColName         nvarchar(64),
    @UIDRowOrd int = 0,
    @StartDateColName   nvarchar(64),
    @StartDateRowOrd int = 0,
    @MasterIDColName    nvarchar(64),
    @MasterIDRowOrd int = 0,
    @SeriesUID          uniqueidentifier OUTPUT,
    @StartDate          datetime OUTPUT,
    @MasterSeriesID     int OUTPUT
)
AS
    SET NOCOUNT ON
    DECLARE @ExecStr nvarchar(2000)
    DECLARE @ReturnCode int
    SET @ReturnCode = 0
    DECLARE @UIDRowOrdinal NVARCHAR(10)
    SET @UIDRowOrdinal  = CONVERT(NVARCHAR(10), @UIDRowOrd)
    DECLARE @EventTypeRowOrdinal NVARCHAR(10)
    SET @EventTypeRowOrdinal  = CONVERT(NVARCHAR(10), @EventTypeRowOrd)
    DECLARE @StartDateRowOrdinal NVARCHAR(10)
    SET @StartDateRowOrdinal  = CONVERT(NVARCHAR(10), @StartDateRowOrd)
    DECLARE @MasterIDRowOrdinal NVARCHAR(10)
    SET @MasterIDRowOrdinal  = CONVERT(NVARCHAR(10), @MasterIDRowOrd)
    SELECT @ExecStr = N'
        SELECT TOP 1
            @SeriesUID = t' + @UIDRowOrdinal + N'.' + @UIDColName + N', @StartDate = t' + @StartDateRowOrdinal+ N'.' + @StartDateColName +  N',
            @MasterSeriesID = t' + @MasterIDRowOrdinal+N'.' + @MasterIDColName + N' FROM DBO.UserData as t0'
    IF @UIDRowOrdinal <> 0
        SELECT @ExecStr = @ExecStr + N' LEFT OUTER JOIN UserData as t'+ @UIDRowOrdinal + N' ON (t0.tp_ListID = t'+@UIDRowOrdinal+N'.tp_ListID 
        AND t0.tp_ItemID = t'+@UIDRowOrdinal+N'.tp_ItemID AND t0.tp_RowOrdinal = 0 AND t'+@UIDRowOrdinal+N'.tp_RowOrdinal = @UIDRowOrdinal)'
    IF @StartDateRowOrdinal <> 0 AND @StartDateRowOrdinal <> @UIDRowOrdinal
        SELECT @ExecStr = @ExecStr +  N' LEFT OUTER JOIN UserData as t'+@StartDateRowOrdinal +N' ON (t0.tp_ListID = t'+@StartDateRowOrdinal 
        + N'.tp_ListID AND t0.tp_ItemID = t'+@StartDateRowOrdinal+N'.tp_ItemID AND t0.tp_RowOrdinal = V_DEFAULT_ROWORDINAL  
        AND t' + @StartDateRowOrdinal +N'.tp_RowOrdinal = '+ @StartDateRowOrdinal +N')'
    IF @MasterIDRowOrdinal <> 0 AND @MasterIDRowOrdinal <> @UIDRowOrdinal AND @MasterIDRowOrdinal <> @StartDateRowOrdinal
        SELECT @ExecStr = @ExecStr + N' LEFT OUTER JOIN UserData as t'+@MasterIDRowOrdinal +' ON (t0.tp_ListID = t'+@MasterIDRowOrdinal
        +N'.tp_ListID AND t0.tp_ItemID = t'+@MasterIDRowOrdinal+ N'.tp_ItemID AND t0.tp_RowOrdinal = V_DEFAULT_ROWORDINAL 
        AND t'+@MasterIDRowOrdinal+N'.tp_RowOrdinal = '+ @MasterIDRowOrdinal+ N')'
    IF @EventTypeRowOrdinal <> 0 AND @EventTypeRowOrdinal <> @UIDRowOrdinal AND @EventTypeRowOrdinal <> @StartDateRowOrdinal
        AND @EventTypeRowOrdinal <> @MasterIDRowOrdinal
        SELECT @ExecStr = @ExecStr +  N' LEFT OUTER JOIN UserData as t'+@EventTypeRowOrdinal + N' ON (t0.tp_ListID = t'+@EventTypeRowOrdinal
        + N'.tp_ListID AND t0.tp_ItemID = t'+@EventTypeRowOrdinal+N'.tp_ItemID AND t0.tp_RowOrdinal = V_DEFAULT_ROWORDINAL  
        AND t'+@EventTypeRowOrdinal+ N'.tp_RowOrdinal = '+ @EventTypeRowOrdinal+ N')'
    SELECT @ExecStr = @ExecStr +  N' WHERE
            t0.tp_ListID = @ListID AND
            t0.tp_ID = @ItemID AND
            t0.tp_RowOrdinal = 0  AND t' + @UIDRowOrdinal+ N'.' + @UIDColName + N' IS NOT NULL AND 
            (t' + @EventTypeRowOrdinal+ N'.' + @EventTypeColName + N' = @EventType OR
            (@EventType = 2 AND
            t'+@EventTypeRowOrdinal+ N'.' + @EventTypeColName + N' = 4))' 
    EXEC sp_executesql @ExecStr,
        N'@ListID uniqueidentifier, @ItemID int, @EventType int, @UIDRowOrdinal int, @StartDateRowOrdinal int, @MasterIDRowOrdinal int, @EventTypeRowOrdinal int,
        @SeriesUID uniqueidentifier OUTPUT, @StartDate datetime OUTPUT, @MasterSeriesID int OUTPUT',
        @ListID, @ItemID, @EventType, @UIDRowOrdinal, @StartDateRowOrdinal, @MasterIDRowOrdinal, @EventTypeRowOrdinal, @SeriesUID OUTPUT, @StartDate OUTPUT, @MasterSeriesID OUTPUT
    IF @SeriesUID IS NULL OR @StartDate IS NULL
        SET @ReturnCode = 4005
    RETURN @ReturnCode

GO
