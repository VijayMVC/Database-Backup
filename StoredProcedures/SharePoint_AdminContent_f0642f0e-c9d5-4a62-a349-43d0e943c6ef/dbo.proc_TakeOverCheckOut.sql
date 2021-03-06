/****** Object:  StoredProcedure [dbo].[proc_TakeOverCheckOut]    Script Date: 5/15/2018 12:13:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_TakeOverCheckOut(
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @UserId int
    )
AS
    SET NOCOUNT ON
    UPDATE
        Docs
    SET    
        CheckOutUserId = @UserId
    WHERE
        SiteId = @SiteId AND
        DirName = @DirName AND
        LeafName = @LeafName AND
        ListId = @ListId AND
        DocFlags & 32 <> 0 AND
        NOT EXISTS(
            SELECT
                *
            FROM
                Docs
            WHERE
                SiteId = @SiteId AND
                DirName = @DirName AND
                LeafName = @LeafName AND
                Level <> 255)
    UPDATE
        UserData
    SET    
        tp_CheckoutUserId = @UserId
    WHERE
        tp_SiteId = @SiteId AND
        tp_DirName = @DirName AND
        tp_LeafName = @LeafName AND
        tp_ListId = @ListId AND
        tp_Level = 255 AND
        NOT EXISTS(
            SELECT
                *
            FROM
                UserData
            WHERE
                tp_SiteId = @SiteId AND
                tp_DirName = @DirName AND
                tp_LeafName = @LeafName AND
                tp_Level <> 255)            
    IF (@@ROWCOUNT = 1)
        RETURN 0
    ELSE
        RETURN 2

GO
