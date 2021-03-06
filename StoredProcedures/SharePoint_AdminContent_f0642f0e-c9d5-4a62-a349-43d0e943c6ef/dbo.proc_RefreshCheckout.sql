/****** Object:  StoredProcedure [dbo].[proc_RefreshCheckout]    Script Date: 5/15/2018 12:12:52 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_RefreshCheckout(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @SystemID tSystemID,
    @CheckoutTimeout int)
AS
    SET NOCOUNT ON
    DECLARE @Now datetime
    DECLARE @RowsUpdated int
    DECLARE @UserId int
    DECLARE @Level tinyint
    SELECT @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    SELECT
        @UserId = tp_Id
    FROM
        UserInfo
    WHERE
        UserInfo.tp_SiteID = @SiteId AND
        UserInfo.tp_SystemId = @SystemID AND
        UserInfo.tp_Deleted = 0
    IF @UserId IS NULL
        RETURN 5
    EXEC proc_GetLevel  @SiteId, 
        @DirName, 
        @LeafName,
        @UserId,
        2,
        @Level OUTPUT
    UPDATE
        Docs
    SET
        CheckoutExpires = DATEADD(mi, @CheckoutTimeout, @Now)
    FROM
        Docs
    WHERE
        SiteId = @SiteId AND
        DirName = @DirName AND
        LeafName = @LeafName AND
        CheckoutUserId = @UserId AND
        CheckoutExpires IS NOT NULL AND 
        Level = @Level
    IF @@ROWCOUNT = 0
        RETURN 2
    EXEC proc_GetMetaInfoForSingleDoc @SiteId,
        @DirName,
        @LeafName,
        @UserId,
        @Level,
        0, 
        NULL 
    RETURN 0

GO
