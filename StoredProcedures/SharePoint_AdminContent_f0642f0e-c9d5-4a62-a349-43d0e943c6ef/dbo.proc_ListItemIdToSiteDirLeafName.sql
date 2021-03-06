/****** Object:  StoredProcedure [dbo].[proc_ListItemIdToSiteDirLeafName]    Script Date: 5/15/2018 12:12:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_ListItemIdToSiteDirLeafName(
    @ListId uniqueidentifier,
    @ItemId int,
    @SiteId uniqueidentifier OUTPUT,
    @DirName nvarchar(256) OUTPUT,
    @LeafName nvarchar(128) OUTPUT
    )
AS
    SET NOCOUNT ON
    SELECT TOP 1
        @SiteId = tp_SiteId,
        @DirName = tp_DirName,
        @LeafName = tp_LeafName
    FROM
        UserData
    WHERE
        tp_ListId = @ListId AND
        tp_Id = @ItemId
    ORDER BY
        tp_Level ASC

GO
