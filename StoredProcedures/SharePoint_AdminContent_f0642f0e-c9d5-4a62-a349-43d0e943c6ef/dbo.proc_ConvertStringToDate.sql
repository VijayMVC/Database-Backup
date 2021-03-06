/****** Object:  StoredProcedure [dbo].[proc_ConvertStringToDate]    Script Date: 5/15/2018 12:12:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ConvertStringToDate(
    @ListId uniqueidentifier,
    @OldColName nvarchar(255),
    @OldRowOrdinal int,
    @NewColName nvarchar(255),
    @NewRowOrdinal int,
    @WebTimeBias int,
    @DateOrder nvarchar(3),
    @bFromNtext bit)
AS
    DECLARE @query nvarchar(4000)
    DECLARE @ConvertedOldColName nvarchar(4000)
    IF @DateOrder <> 'mdy' AND @DateOrder <> 'dmy' AND @DateOrder <> 'ymd'
        RETURN
    SET DATEFORMAT @DateOrder
    IF @OldRowOrdinal = @NewRowOrdinal
    BEGIN
    SET @ConvertedOldColName = 
        CASE WHEN @bFromNtext = 1 
        THEN 'CAST(' + @OldColName  + ' AS nvarchar(50))' 
        ELSE @OldColName END
    SET @query = 'UPDATE AllUserData SET ' + @NewColName  + ' = CASE ISDATE(' +
        @ConvertedOldColName + 
        ') WHEN 1 THEN DATEADD(mi, @WebTimeBias + 60, convert(char(8),' +
        ' CAST(' + @ConvertedOldColName + 
        ' as datetime), 112)) ELSE NULL END WHERE tp_ListId = @ListId and tp_RowOrdinal =  @OldRowOrdinal'
    EXEC sp_executesql @query, N'@ListId uniqueidentifier, @WebTimeBias int, @Oldrowordinal int', 
        @ListId, @WebTimeBias, @OldRowOrdinal
    END
    ELSE
    BEGIN
        SET @ConvertedOldColName = 
        CASE WHEN @bFromNtext = 1 
        THEN 'CAST(t.' + @OldColName  + ' AS nvarchar(50))' 
        ELSE 't.'+ @OldColName END
    SET @query = 'UPDATE UserData SET ' + @NewColName  + ' = CASE ISDATE(' +
        @ConvertedOldColName + 
        ') WHEN 1 THEN DATEADD(mi, @WebTimeBias + 60, convert(char(8),' +
        ' CAST(' + @ConvertedOldColName + 
        ' as datetime), 112)) ELSE NULL END FROM (SELECT tp_ID,' +@OldColName + ' FROM Userdata  where tp_ListId = @ListId
        AND  tp_RowOrdinal =@OldRowOrdinal) as t WHERE tp_ListId = @ListId and Userdata.tp_ID = t.tp_ID and tp_RowOrdinal =@NewRowOrdinal'
    EXEC sp_executesql @query, N'@ListId uniqueidentifier, @WebTimeBias int, @OldRowOrdinal int, @NewRowOrdinal int', 
        @ListId, @WebTimeBias, @OldRowOrdinal, @NewRowOrdinal
    END

GO
