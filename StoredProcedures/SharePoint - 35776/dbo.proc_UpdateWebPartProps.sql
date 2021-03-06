/****** Object:  StoredProcedure [dbo].[proc_UpdateWebPartProps]    Script Date: 5/15/2018 12:12:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateWebPartProps(
    @SiteId uniqueidentifier,
    @WebPartID uniqueidentifier,
    @IsIncluded bit,
    @FrameState tinyint,
    @AllUsersProperties image,
    @PerUserProperties image,
    @Level tinyint OUTPUT)
AS
    SET NOCOUNT ON
    DECLARE @Ret int
    DECLARE @AllUsersSize int
    DECLARE @PerUserSize int
    DECLARE @@NewSize bigint
    SET @AllUsersSize = ISNULL(DATALENGTH(@AllUsersProperties), 0)
    SET @PerUserSize = ISNULL(DATALENGTH(@PerUserProperties), 0)
    EXEC @Ret = proc_OnUpdateWebParts
        @SiteId,
        @WebPartID,
        @Level,
        NULL,     
        @AllUsersSize,
        @PerUserSize,
        0,        
        NULL,     
        NULL,     
        @@NewSize OUTPUT
    IF (@@ERROR <> 0 OR @Ret <> 0)
    BEGIN
        IF (@Ret = 0)
            SET @Ret = -2147467259
        GOTO cleanup
    END
    UPDATE
        dbo.WebParts
    SET
        tp_IsIncluded = @IsIncluded,
        tp_FrameState = @FrameState,
        tp_AllUsersProperties = @AllUsersProperties,
        tp_PerUserProperties = @PerUserProperties,
        tp_Cache = NULL,
        tp_Size = @@NewSize
    WHERE
        tp_SiteId = @SiteId AND
        tp_ID = @WebPartID AND
        tp_Level = @Level
    IF (@@ERROR <> 0)
    BEGIN
        SET @Ret = -2147467259
        GOTO cleanup
    END
    IF (@Level = 1)
    BEGIN
        EXEC @Ret = proc_InvalidatePerUserWebPartCache
                @SiteId,
                @WebPartID
        IF (@@ERROR <> 0 OR @Ret <> 0)
        BEGIN
            IF (@Ret = 0)
                SET @Ret = -2147467259
            GOTO cleanup
        END
    END
cleanup:
    RETURN @Ret

GO
