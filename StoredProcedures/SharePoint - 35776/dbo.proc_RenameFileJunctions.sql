/****** Object:  StoredProcedure [dbo].[proc_RenameFileJunctions]    Script Date: 5/15/2018 12:12:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_RenameFileJunctions(
    @SiteId uniqueidentifier,
    @OldUrlDirName nvarchar(256),
    @OldUrlLeafName nvarchar(128),
    @NewUrlDirName nvarchar(256),
    @NewUrlLeafName nvarchar(128)
    )
AS
    SET NOCOUNT ON
    UPDATE
        AllUserDataJunctions
    SET
        tp_DirName = @NewUrlDirName,
        tp_LeafName = @NewUrlLeafName
    WHERE
        tp_SiteId = @SiteId AND
        tp_DeleteTransactionId = 0x AND
        tp_IsCurrentVersion = CAST(1 AS bit) AND
        tp_DirName = @OldUrlDirName AND
        tp_LeafName = @OldUrlLeafName
    UPDATE
        AllUserDataJunctions
    SET
        tp_DirName = @NewUrlDirName,
        tp_LeafName = @NewUrlLeafName
    WHERE
        tp_SiteId = @SiteId AND
        tp_DeleteTransactionId = 0x AND
        tp_IsCurrentVersion = CAST(0 AS bit) AND
        tp_DirName = @OldUrlDirName AND
        tp_LeafName = @OldUrlLeafName

GO
