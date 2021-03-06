/****** Object:  StoredProcedure [dbo].[proc_AddNonListViewFormWebPartForUrl]    Script Date: 5/15/2018 12:11:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_AddNonListViewFormWebPartForUrl(
    @SiteId uniqueidentifier,
    @DocDirName nvarchar(256),
    @DocLeafName nvarchar(128),
    @WebPartId uniqueidentifier,
    @ListId uniqueidentifier,
    @Type tinyint,
    @Flags int,
    @DisplayName nvarchar(255),
    @ContentTypeId tContentTypeId,
    @Version int,
    @PartOrder int,
    @ZoneId nvarchar(64),
    @IsIncluded bit,
    @FrameState tinyint,
    @WebPartTypeId uniqueidentifier,
    @AllUsersProperties image,
    @PerUserProperties image,
    @Cache image,
    @Source ntext,
    @UserId int = NULL,
    @Level tinyint = 1,
    @BaseViewId tinyint = NULL,
    @bHasFGP bit = NULL,
    @bDeleteUsersOtherWebParts bit = 0,
    @View ntext = NULL)
AS
    SET NOCOUNT ON
    DECLARE @DocId uniqueidentifier
    DECLARE @DocWebId uniqueidentifier
    DECLARE @ListWebId uniqueidentifier
    DECLARE @Ret int
    DECLARE @bExists bit
    DECLARE @quotaOrLockStatus int
    SELECT  @quotaOrLockStatus = dbo.fn_IsOverQuotaOrWriteLocked(@SiteId)
    IF (@quotaOrLockStatus = 1)
    BEGIN
        RETURN 1816
    END
    ELSE IF (@quotaOrLockStatus > 1)
    BEGIN
        RETURN 212
    END
    SET @Ret = 0
    SELECT TOP 1
        @DocId = Id,
        @DocWebId = WebId
    FROM
        Docs
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @DocDirName AND
        Docs.LeafName = @DocLeafName
    IF @@ROWCOUNT <> 1
    BEGIN
        RETURN 2
    END
    BEGIN TRAN
    DECLARE @cbDelta bigint
    SET @cbDelta = 116 + ISNULL(DATALENGTH(NULL), 0) + ISNULL(DATALENGTH(@AllUsersProperties), 0) + ISNULL(DATALENGTH(@PerUserProperties), 0) + ISNULL(DATALENGTH(NULL), 0) + ISNULL(DATALENGTH(NULL), 0)
    DECLARE @HasFGP bit
    IF @ListId IS NOT NULL
    BEGIN
        SELECT
            @HasFGP = tp_HasFGP,
            @ListWebId = tp_WebId
        FROM
            AllLists
        WHERE
            tp_Id = @ListId
    END
    IF @HasFGP IS NULL
    BEGIN
        SET @HasFGP = 0
    END
    IF @ListWebId IS NULL
    BEGIN
        SET @ListWebId = @DocWebId
    END
    IF EXISTS
        (SELECT TOP 1 tp_ID FROM WebParts
         WHERE
             tp_SiteId = @SiteId AND
             tp_ID = @WebPartId AND
             tp_Level = @Level AND
             tp_PageUrlID = @DocId)
    BEGIN
        SET @bExists = 1
    END
    ELSE
    BEGIN
        SET @bExists = 0
    END
    -- Adjust quota and delete webparts.....
    IF (@UserId IS NOT NULL AND @bDeleteUsersOtherWebParts = 1)
    BEGIN
        DELETE FROM WebPartLists
        WHERE
            tp_SiteId = @SiteId AND
            tp_Level = @Level AND
            tp_PageUrlID = @DocId AND
            tp_UserId = @UserId
        DELETE FROM WebParts
        WHERE
            tp_SiteId = @SiteId AND
            tp_Level = @Level AND
            tp_PageUrlID = @DocId AND
            tp_UserId = @UserId
        SET @bExists = 0
    END
    EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp @SiteId, @cbDelta, 0
    IF @ListId IS NOT NULL
    BEGIN
        IF @bExists = 0
        BEGIN
            INSERT INTO WebPartLists(
                tp_SiteId,
                tp_ListId,
                tp_WebId,
                tp_PageUrlID,
                tp_WebPartID,
                tp_UserID,
                tp_Level)
            VALUES (
                @SiteId,
                @ListId,
                @ListWebId,
                @DocId,
                @WebPartId,
                @UserId,
                @Level)
        END
        ELSE
        BEGIN
            UPDATE WebPartLists
                SET tp_ListId = @ListId
            WHERE
                tp_SiteId = @SiteId AND
                tp_PageUrlID = @DocId AND
                tp_WebPartID = @WebPartId AND
                tp_Level = @Level
        END
    END
    IF @bExists = 0
    BEGIN
        INSERT INTO WebParts(
            tp_SiteId,
            tp_ID,
            tp_ListId,
            tp_Type,
            tp_Flags,
            tp_BaseViewID,
            tp_DisplayName,
            tp_ContentTypeId,
            tp_Version,
            tp_PageUrlID,
            tp_PartOrder,
            tp_ZoneID,
            tp_IsIncluded,
            tp_FrameState,
            tp_WebPartTypeId,
            tp_AllUsersProperties,
            tp_PerUserProperties,
            tp_Cache,
            tp_UserID,
            tp_Source,
            tp_Level,
            tp_Size,
            tp_HasFGP,
            tp_View)
        VALUES (
            @SiteId,
            @WebPartId,
            @ListId,
            @Type,
            @Flags,
            @BaseViewId,
            @DisplayName,
            CASE
                WHEN @ContentTypeId IS NULL
                    THEN 0x
                ELSE @ContentTypeId
            END,
            @Version,
            @DocId,
            @PartOrder,
            @ZoneId,
            @IsIncluded,
            @FrameState,
            @WebPartTypeId,
            @AllUsersProperties,
            @PerUserProperties,
            @Cache,
            @UserId,
            @Source,
            @Level,
            @cbDelta,
            @HasFGP,
            @View)
    END
    ELSE 
    BEGIN
        UPDATE WebParts
        SET
            tp_ListId = @ListId,
            tp_Type = @Type,
            tp_Flags = @Flags,
            tp_DisplayName = @DisplayName,
            tp_ContentTypeId =
                CASE
                    WHEN @ContentTypeId IS NULL THEN 0x
                    ELSE @ContentTypeId
                END,
            tp_PartOrder = @PartOrder,
            tp_ZoneID = @ZoneId,
            tp_IsIncluded = @IsIncluded,
            tp_FrameState = @FrameState,
            tp_AllUsersProperties = @AllUsersProperties,
            tp_PerUserProperties = @PerUserProperties,
            tp_Cache = @Cache,
            tp_Source = @Source,
            tp_Size = @cbDelta,
            tp_HasFGP = @HasFGP,
            tp_View = @View
        WHERE
            tp_SiteId = @SiteId AND
            tp_ID = @WebPartId AND
            tp_Level = @Level AND
            tp_PageUrlID = @DocId
    END
    IF (@@ERROR <> 0 OR @Ret <> 0)
    BEGIN
        IF (@Ret = 0)
            SET @Ret = 1
        GOTO cleanup
    END
cleanup:
    IF (@Ret <> 0 AND @@TRANCOUNT = 1) ROLLBACK TRAN ELSE COMMIT TRAN
    RETURN @Ret

GO
