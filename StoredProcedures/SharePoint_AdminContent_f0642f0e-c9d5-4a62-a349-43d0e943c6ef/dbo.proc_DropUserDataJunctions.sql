/****** Object:  StoredProcedure [dbo].[proc_DropUserDataJunctions]    Script Date: 5/15/2018 12:12:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_DropUserDataJunctions(
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier,
    @FieldId uniqueidentifier
    )
AS
    DECLARE @DirName nvarchar(256)
    DECLARE @DirLike nvarchar(1024)
    EXEC proc_GetListRootFolder @SiteId, @ListId, @DirName OUTPUT
    EXEC proc_EscapeForLike @DirName, @DirLike OUTPUT, 1
    SET NOCOUNT ON
    DELETE
        AllUserDataJunctions
    WHERE
        tp_SiteId = @SiteId AND
        tp_DeleteTransactionId = 0x AND
        tp_IsCurrentVersion = CAST(1 AS bit) AND
        (tp_DirName = @DirName OR tp_DirName LIKE @DirLike) AND
        tp_FieldId = @FieldId
    DELETE
        AllUserDataJunctions
    WHERE
        tp_SiteId = @SiteId AND
        tp_DeleteTransactionId = 0x AND
        tp_IsCurrentVersion = CAST(0 AS bit) AND
        (tp_DirName = @DirName OR tp_DirName LIKE @DirLike) AND
        tp_FieldId = @FieldId
    DELETE
        AllUserDataJunctions
    FROM
        AllUserDataJunctions AS j
    INNER JOIN
        RecycleBin AS r
    ON
        j.tp_SiteId = @SiteId AND
        r.ListId = @ListId AND
        j.tp_DeleteTransactionId = r.DeleteTransactionId AND
        j.tp_IsCurrentVersion = CAST(1 AS bit) AND
        (j.tp_DirName = @DirName OR j.tp_DirName LIKE @DirLike) AND
        j.tp_FieldId = @FieldId
    DELETE
        AllUserDataJunctions
    FROM
        AllUserDataJunctions AS j
    INNER JOIN
        RecycleBin AS r
    ON
        j.tp_SiteId = @SiteId AND
        r.ListId = @ListId AND
        j.tp_DeleteTransactionId = r.DeleteTransactionId AND
        j.tp_IsCurrentVersion = CAST(0 AS bit) AND
        (j.tp_DirName = @DirName OR j.tp_DirName LIKE @DirLike) AND
        j.tp_FieldId = @FieldId

GO
