/****** Object:  StoredProcedure [dbo].[proc_ConvertLookupToJunction]    Script Date: 5/15/2018 12:12:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_ConvertLookupToJunction(
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
    N'INSERT INTO
        AllUserDataJunctions
    SELECT
        tp_SiteId,
        tp_DeleteTransactionId,
        tp_IsCurrentVersion,
        tp_DirName,
        tp_LeafName,
        @FieldId,
        tp_CalculatedVersion,
        tp_Level,
        tp_UIVersion, 
        u.' + @ColName + N',
        0
    FROM
        AllUserData AS u
    WHERE
        u.tp_SiteId = @SiteId AND
        u.tp_ListId = @ListId AND
        u.tp_RowOrdinal = @RowOrdinal AND
        u.' + @ColName + N' > 0'
    EXEC sp_executesql @QueryString,
        N'@FieldId uniqueidentifier, @SiteId uniqueidentifier, @ListId uniqueidentifier, @RowOrdinal int',
        @FieldId, @SiteId, @ListId, @RowOrdinal
    SET @QueryString =
    N'UPDATE
        AllUserData
    SET ' + @ColName + N' = NULL
    WHERE
        AllUserData.tp_SiteId = @SiteId AND
        AllUserData.tp_ListId = @ListId AND
        AllUserData.tp_RowOrdinal = @RowOrdinal'
    EXEC sp_executesql @QueryString,
        N'@SiteId uniqueidentifier, @ListId uniqueidentifier, @RowOrdinal int',
        @SiteId, @ListId, @RowOrdinal                

GO
