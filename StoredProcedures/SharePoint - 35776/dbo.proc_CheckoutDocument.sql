/****** Object:  StoredProcedure [dbo].[proc_CheckoutDocument]    Script Date: 5/15/2018 12:11:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_CheckoutDocument(
    @SiteId uniqueidentifier,
    @WebId  uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @Level tinyint,
    @EnableMinorVersions bit,
    @IsModerated bit,
    @UserId int,
    @CheckoutTimeout int,
    @RefreshCheckout bit,
    @CheckoutToLocal bit,
    @IsForceCheckout bit)
AS
    DECLARE @Now datetime
    DECLARE @Ret int
    SET NOCOUNT ON
    SELECT @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    IF @CheckoutTimeout IS NULL OR @CheckoutTimeout <> 0
    BEGIN
        EXEC @Ret = proc_CheckoutDocumentInternal
            @SiteId,
            @WebId,
            @DirName,
            @LeafName,
            @Level,
            @EnableMinorVersions,
            @IsModerated,
            @UserId,
            @CheckoutTimeout,
            @RefreshCheckout,
            @CheckoutToLocal,
            @IsForceCheckout,
            @Now
    END
    ELSE IF @RefreshCheckout = 1
    BEGIN
        EXEC @Ret = proc_UncheckoutDocumentInternal
            @SiteId,
            @WebId,
            @DirName,
            @LeafName,
            @UserId,
            1,
            @IsForceCheckout,
            @Level,
            @Level OUTPUT
    END
    EXEC proc_GetLinkInfoSingleDoc @SiteId, @DirName, @LeafName, @Level
    EXEC proc_GetMetaInfoForSingleDoc @SiteId, 
        @DirName, 
        @LeafName, 
        @UserId, 
        @Level,
        0, 
        @WebId
    IF @Ret <> 0
        RETURN @Ret
    EXEC proc_GetAuditMask 1, @SiteId, @DirName, @LeafName
    RETURN 0

GO
