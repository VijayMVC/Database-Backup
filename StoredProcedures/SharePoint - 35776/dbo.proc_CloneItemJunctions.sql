/****** Object:  StoredProcedure [dbo].[proc_CloneItemJunctions]    Script Date: 5/15/2018 12:11:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_CloneItemJunctions(
    @WebSiteId uniqueidentifier,
    @ListId uniqueidentifier,
    @OldItemId int,
    @NewItemId int,
    @OldLevel tinyint,
    @NewLevel tinyint = NULL,
    @OldUIVersion int,
    @NewUIVersion int
    )
AS
    SET NOCOUNT ON
    DECLARE @SiteId AS uniqueidentifier
    DECLARE @DirName AS nvarchar(256)
    DECLARE @LeafName AS nvarchar(128)
    EXEC proc_ListItemIdToSiteDirLeafName @ListId, @OldItemId, @SiteId OUTPUT, @DirName OUTPUT, @LeafName OUTPUT
    INSERT INTO UserDataJunctions (
        tp_SiteId,
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
        @DirName,
        @LeafName,
        tp_FieldId,
        0, 
        COALESCE(@NewLevel, @OldLevel),
        @NewUIVersion,
        tp_Id,
        tp_Ordinal
    FROM
        UserDataJunctions
    WHERE
        tp_SiteId = @SiteId AND
        tp_DirName = @DirName AND
        tp_LeafName = @LeafName AND
        tp_Level = @OldLevel AND
        (COALESCE(@NewLevel, @OldLevel) != @OldLevel OR
         tp_CalculatedVersion != 0)

GO
