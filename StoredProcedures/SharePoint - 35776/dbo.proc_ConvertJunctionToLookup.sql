/****** Object:  StoredProcedure [dbo].[proc_ConvertJunctionToLookup]    Script Date: 5/15/2018 12:11:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_ConvertJunctionToLookup(
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier,
    @FieldId uniqueidentifier,
    @ColName nvarchar(64),
    @RowOrdinal int    
    )
AS
    SET NOCOUNT ON
    DECLARE @QueryString nvarchar(1024)
    SET @QueryString = 
    N'UPDATE
        AllUserData
    SET
        ' + @ColName + N' = j.tp_Id
    FROM
        AllUserDataJunctions AS j
    WHERE
        AllUserData.tp_SiteId = @SiteId AND
        AllUserData.tp_ListId = @ListId AND
        j.tp_SiteId = @SiteId AND
        j.tp_FieldId = @FieldId AND
        j.tp_Ordinal = 0 AND
        j.tp_DirName = AllUserData.tp_DirName AND
        j.tp_LeafName = AllUserData.tp_LeafName AND
        j.tp_Level = AllUserData.tp_Level AND
        j.tp_DeleteTransactionId = AllUserData.tp_DeleteTransactionId AND
        j.tp_IsCurrentVersion = AllUserData.tp_IsCurrentVersion AND
        j.tp_CalculatedVersion = AllUserData.tp_CalculatedVersion AND
        (j.tp_IsCurrentVersion = CAST(1 AS bit) OR j.tp_UIVersion = AllUserData.tp_UIVersion) AND
        AllUserData.tp_RowOrdinal = @RowOrdinal'
    EXEC sp_executesql @QueryString,
        N'@FieldId uniqueidentifier, @SiteId uniqueidentifier, @ListId uniqueidentifier, @RowOrdinal int',
        @FieldId, @SiteId, @ListId, @RowOrdinal
    EXEC proc_DropUserDataJunctions @SiteId, @ListId, @FieldId

GO
