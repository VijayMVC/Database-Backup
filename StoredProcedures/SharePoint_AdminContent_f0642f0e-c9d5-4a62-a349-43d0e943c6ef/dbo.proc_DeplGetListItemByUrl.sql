/****** Object:  StoredProcedure [dbo].[proc_DeplGetListItemByUrl]    Script Date: 5/15/2018 12:12:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplGetListItemByUrl(
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @IsDeleted bit OUTPUT,
    @ListItemId int OUTPUT)
AS
    SET NOCOUNT ON
    IF @SiteId IS NULL OR @ListId IS NULL OR (@DirName IS NULL AND @LeafName IS NULL)
        RETURN 87
    SET @IsDeleted = 0
    SELECT TOP 1
        @ListItemId = UserData.tp_ID,
        @IsDeleted =
            CASE
                WHEN tp_DeleteTransactionId=0x0 THEN 0
                ELSE 1
            END
    FROM
        AllUserData as UserData
    WHERE
        UserData.tp_SiteId = @SiteId AND
        UserData.tp_DirName = @DirName AND
        UserData.tp_LeafName = @LeafName AND
        UserData.tp_ListId = @ListId

GO
