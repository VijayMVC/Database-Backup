/****** Object:  StoredProcedure [dbo].[proc_MoveRecycleBinItemToSecondStage]    Script Date: 5/15/2018 12:12:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MoveRecycleBinItemToSecondStage(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @UserId int,
    @DeleteTransactionId varbinary(16),
    @SecondStageRecycleBinQuota int,
    @SpaceRequired bigint OUTPUT,
    @DiskUsedBefore bigint = 0 OUTPUT,
    @DiskUsedAfter bigint = 0 OUTPUT,
    @MaxSSDiskSpace bigint = 0 OUTPUT    
    )
AS
    SET NOCOUNT ON
    SET @DiskUsedBefore = 0
    SET @DiskUsedAfter = 0
    SET @MaxSSDiskSpace  = 0
    IF (@SecondStageRecycleBinQuota <= 0)
    BEGIN
        RETURN 112
    END
    DECLARE @Ret int
    SET @Ret = 1359
    DECLARE @FreedSpace bigint
    SET @FreedSpace = 0
    BEGIN TRAN
    IF (@UserId = 0)
    BEGIN
        SELECT
            @WebId = WebId,
            @UserId = DeleteUserId,
            @FreedSpace = Size
        FROM
            RecycleBin
        WHERE
            SiteId = @SiteId AND
            BinId = 1 AND
            DeleteTransactionId = @DeleteTransactionId
    END
    ELSE
    BEGIN
        SELECT
            @FreedSpace = Size
        FROM
            RecycleBin
        WHERE
            SiteId = @SiteId AND
            WebId = @WebId AND
            BinId = 1 AND
            DeleteUserId = @UserId AND
            DeleteTransactionId = @DeleteTransactionId
    END
    IF (@@ROWCOUNT <> 1)
    BEGIN
        SET @Ret = 1168
        GOTO cleanup
    END
    IF (@FreedSpace > 0)
    BEGIN
        DECLARE @DiskQuota bigint
        DECLARE @SecondStageDiskUsed bigint
        SELECT
            @DiskQuota = DiskQuota,
            @SecondStageDiskUsed = SecondStageDiskUsed
        FROM
            Sites
        WHERE
            Id = @SiteId   
        IF @DiskQuota > 0
        BEGIN
            IF @FreedSpace > (@DiskQuota * @SecondStageRecycleBinQuota / 100)
            BEGIN
                EXEC @Ret = proc_DeleteRecycleBinItem @SiteId, @WebId, @UserId, @DeleteTransactionId
                SET @Ret = 0
                GOTO cleanup
            END
            SET @SpaceRequired = 
                (@SecondStageDiskUsed + @FreedSpace) - 
                (@DiskQuota * @SecondStageRecycleBinQuota / 100)
            IF @SpaceRequired > 0
            BEGIN
                SET @Ret = 112
                GOTO cleanup
            END
            ELSE
            BEGIN
                SET @SpaceRequired = 0
            END
        END
        SET @DiskUsedBefore = @SecondStageDiskUsed
        SET @DiskUsedAfter = @SecondStageDiskUsed + @FreedSpace
        SET @MaxSSDiskSpace = (@DiskQuota * @SecondStageRecycleBinQuota / 100)
        UPDATE
            Sites
        SET
            SecondStageDiskUsed = SecondStageDiskUsed + @FreedSpace
        WHERE
            Id = @SiteId
        SET @FreedSpace = -@FreedSpace
        EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp @SiteId, @FreedSpace, 0
    END
    UPDATE
        RecycleBin
    SET
        BinId = 2
    WHERE
        SiteId = @SiteId AND
        WebId = @WebId AND
        BinId = 1 AND
        DeleteUserId = @UserId AND
        DeleteTransactionId = @DeleteTransactionId
    SET @Ret = 0
cleanup:
    IF (@Ret <> 0 AND @@TRANCOUNT = 1) ROLLBACK TRAN ELSE COMMIT TRAN
    RETURN @Ret

GO
