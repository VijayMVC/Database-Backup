/****** Object:  StoredProcedure [dbo].[proc_CreateItemJunctionsVersion]    Script Date: 5/15/2018 12:12:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_CreateItemJunctionsVersion(
    @ListId uniqueidentifier,
    @ItemId int,
    @Level tinyint = 1
    )
AS
    SET NOCOUNT ON
    DECLARE @SiteId AS uniqueidentifier
    DECLARE @DirName AS nvarchar(256)
    DECLARE @LeafName AS nvarchar(128)
    EXEC proc_ListItemIdToSiteDirLeafName @ListId, @ItemId, @SiteId OUTPUT, @DirName OUTPUT, @LeafName OUTPUT
    INSERT INTO AllUserDataJunctions
    SELECT 
        tp_SiteId,
        tp_DeleteTransactionId,
        CAST(0 AS bit),
        tp_DirName,
        tp_LeafName,
        tp_FieldId,
        tp_UIVersion, 
        tp_Level,
        tp_UIVersion,
        tp_Id,
        tp_Ordinal
    FROM
        UserDataJunctions
    WHERE
        tp_SiteId = @SiteId AND
        tp_DirName = @DirName AND
        tp_LeafName = @LeafName AND
        tp_Level = @Level        

GO
