/****** Object:  StoredProcedure [dbo].[proc_CopyFileJunctions]    Script Date: 5/15/2018 12:12:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_CopyFileJunctions(
    @SiteId uniqueidentifier,
    @OldUrlDirName nvarchar(256),
    @OldUrlLeafName nvarchar(128),
    @NewUrlDirName nvarchar(256),
    @NewUrlLeafName nvarchar(128),
    @NewLevel int
    )
AS
    SET NOCOUNT ON
    INSERT INTO UserDataJunctions (
        tp_SiteId,
        tp_DeleteTransactionId,
        tp_IsCurrentVersion,
        tp_DirName,
        tp_LeafName,
        tp_FieldId,
        tp_CalculatedVersion,
        tp_Level,
        tp_UIVersion,
        tp_Id,
        tp_Ordinal
        )
    SELECT
        @SiteId,
        0x,
        CAST(1 AS bit),
        @NewUrlDirName,
        @NewUrlLeafName,
        tp_FieldId,
        0,
        @NewLevel,
        1,
        tp_Id,
        tp_Ordinal
    FROM
        UserDataJunctions
    WHERE
        tp_SiteId = @SiteId AND
        tp_DirName = @OldUrlDirName AND
        tp_LeafName = @NewUrlLeafName AND
        tp_Level = 1

GO
