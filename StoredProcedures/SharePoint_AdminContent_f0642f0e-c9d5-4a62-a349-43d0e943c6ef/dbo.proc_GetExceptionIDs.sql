/****** Object:  StoredProcedure [dbo].[proc_GetExceptionIDs]    Script Date: 5/15/2018 12:12:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetExceptionIDs
(
    @ListID             uniqueidentifier,
    @ViewStart          datetime,
    @ViewEnd            datetime,
    @EventTypeColName   nvarchar(64),
    @EventTypeRowOrdinal int = 0,
    @UIDColName         nvarchar(64),
    @UIDRowOrdinal int = 0,
    @RecurrenceIDColName  nvarchar(64),
    @RecurrenceIDRowOrdinal int = 0,
    @StartDateColName   nvarchar(64),
    @StartDateRowOrdinal int = 0,
    @EndDateColName     nvarchar(64),
    @EndDateRowOrdinal int = 0
)
AS
    SET NOCOUNT ON
    DECLARE @ExecStr nvarchar(2000)
    DECLARE @ReturnCode int
    SET @ReturnCode = 0
    DECLARE @UIDRowOrd NVARCHAR(10)
    SET @UIDRowOrd  = CONVERT(NVARCHAR(10), @UIDRowOrdinal)
    DECLARE @EventTypeRowOrd NVARCHAR(10)
    SET @EventTypeRowOrd  = CONVERT(NVARCHAR(10), @EventTypeRowOrdinal)
    DECLARE @StartDateRowOrd NVARCHAR(10)
    SET @StartDateRowOrd  = CONVERT(NVARCHAR(10), @StartDateRowOrdinal)
    DECLARE @RecurrenceIDRowOrd NVARCHAR(10)
    SET @RecurrenceIDRowOrd  = CONVERT(NVARCHAR(10), @RecurrenceIDRowOrdinal)
    DECLARE @EndDateRowOrd NVARCHAR(10)
    SET @EndDateRowOrd  = CONVERT(NVARCHAR(10), @EndDateRowOrdinal)
    SELECT @ExecStr = N'
        SELECT
            t' + @UIDRowOrd + N'.' + @UIDColName + N',
            t' + @RecurrenceIDRowOrd + N'.' + @RecurrenceIDColName + N' FROM DBO.UserData as t0'
        IF @UIDRowOrd <> 0
            SELECT @ExecStr = @ExecStr + N' LEFT OUTER JOIN UserData as t' + @UIDRowOrd + N' ON (t0.tp_ListID = t' + 
            @UIDRowOrd + N'.tp_ListID AND t0.tp_ItemID = t' + @UIDRowOrd + N'.tp_ItemID AND t0.tp_RowOrdinal = V_DEFAULT_ROWORDINAL
            AND t' + @UIDRowOrd + N'.tp_RowOrdinal = ' + @UIDRowOrd + N')'
        IF @StartDateRowOrd <> 0 AND @StartDateRowOrd <> @UIDRowOrd
            SELECT @ExecStr = @ExecStr +  N' LEFT OUTER JOIN UserData as t' + @StartDateRowOrd + N' ON (t0.tp_ListID = t' + 
            @StartDateRowOrd + N'.tp_ListID AND t0.tp_ItemID = t' + @StartDateRowOrd + N'.tp_ItemID 
            AND t0.tp_RowOrdinal = 0 AND t' + @StartDateRowOrd + N'.tp_RowOrdinal = ' + @StartDateRowOrd +N')'
        IF @RecurrenceIDRowOrd <> 0 AND @RecurrenceIDRowOrd <> @UIDRowOrd AND @RecurrenceIDRowOrd <> @StartDateRowOrd
            SELECT @ExecStr = @ExecStr + N' LEFT OUTER JOIN UserData as t' + @RecurrenceIDRowOrd + N' ON (t0.tp_ListID = t' + 
            @RecurrenceIDRowOrd + N'.tp_ListID AND t0.tp_ItemID = t' + @RecurrenceIDRowOrd + N'.tp_ItemID 
            AND t0.tp_RowOrdinal = 0  AND t' + @RecurrenceIDRowOrd + N'.tp_RowOrdinal 
            = ' + @RecurrenceIDRowOrd +N')'
        IF @EventTypeRowOrd <> 0 AND @EventTypeRowOrd <> @UIDRowOrd AND @EventTypeRowOrd <> @StartDateRowOrd
            AND @EventTypeRowOrd <> @RecurrenceIDRowOrd
            SELECT @ExecStr = @ExecStr +  N' LEFT OUTER JOIN UserData as t' + @EventTypeRowOrd + N' ON (t0.tp_ListID = t' + 
            @EventTypeRowOrd + N'.tp_ListID AND t0.tp_ItemID = t' + @EventTypeRowOrd + N'.tp_ItemID 
            AND t0.tp_RowOrdinal =  0 AND t' + @EventTypeRowOrd + N'.tp_RowOrdinal = ' + @EventTypeRowOrd +N')'
        IF @EndDateRowOrd <> 0 AND @EndDateRowOrd <> @UIDRowOrd AND @EndDateRowOrd <> @StartDateRowOrd
            AND @EndDateRowOrd <> @RecurrenceIDRowOrd AND @EndDateRowOrd <> @EventTypeRowOrd 
            SELECT @ExecStr = @ExecStr +  N' LEFT OUTER JOIN UserData as t' + @EndDateRowOrd + N' ON (t0.tp_ListID = t' + 
            @EndDateRowOrd + N'.tp_ListID AND t0.tp_ItemID = t' + @EndDateRowOrd + N'.tp_ItemID 
            AND t0.tp_RowOrdinal = 0  AND t' + @EndDateRowOrd + N'.tp_RowOrdinal = ' + @EndDateRowOrd +N')'
        SELECT @ExecStr = @ExecStr +  N' WHERE
            t0.tp_ListID = @ListID AND
            t' + @EventTypeRowOrd + N'.' + @EventTypeColName + N' >= 2 AND
            t' + @EventTypeRowOrd + N'.' +@EventTypeColName + N' <= 4 AND                   
            t' + @UIDRowOrd + N'.' + @UIDColName + N' IS NOT NULL AND
            t' + @RecurrenceIDRowOrd + N'.' + @RecurrenceIDColName + N' IS NOT NULL AND
            ((t' + @StartDateRowOrd + N'.' + @StartDateColName + N' <= @ViewEnd AND 
            ((t' + @EndDateRowOrd + N'.' + @EndDateColName + N' IS NULL AND t' + @StartDateRowOrd + N'.' 
            + @StartDateColName + N' >= @ViewStart) OR
            (t' + @EndDateRowOrd + N'.' +  @EndDateColName + N' >= @ViewStart 
            AND t' + @StartDateRowOrd + N'.' + @StartDateColName + N' <= t' + @EndDateRowOrd + N'.' + @EndDateColName + N'))) OR
            (t' + @RecurrenceIDRowOrd + N'.' + @RecurrenceIDColName + N' >= @ViewStart AND t' + @RecurrenceIDRowOrd + N'.' + 
            @RecurrenceIDColName + N' <= @ViewEnd ))'
    EXEC sp_executesql @ExecStr,
        N'@ListID uniqueidentifier, @ViewStart datetime, @ViewEnd datetime',
        @ListID, @ViewStart, @ViewEnd
    RETURN @ReturnCode

GO
