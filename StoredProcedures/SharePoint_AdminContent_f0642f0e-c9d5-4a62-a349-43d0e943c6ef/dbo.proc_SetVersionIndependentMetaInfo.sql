/****** Object:  StoredProcedure [dbo].[proc_SetVersionIndependentMetaInfo]    Script Date: 5/15/2018 12:13:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SetVersionIndependentMetaInfo(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @MetaInfo image,
    @MetaInfoSize int,
    @UpdateHCD int,
    @HCD int,
    @UpdatedVersion int OUTPUT)
AS
    SET NOCOUNT ON
    DECLARE @quotaOrLockStatus int
    SELECT  @quotaOrLockStatus =
        dbo.fn_IsOverQuotaOrWriteLocked(@SiteId)
    IF (@quotaOrLockStatus = 1)
    BEGIN
        RETURN 1816
    END
    ELSE IF (@quotaOrLockStatus > 1)
    BEGIN
        RETURN 212
    END
    DECLARE @StoredVersion int
    DECLARE @StoredSize int
    DECLARE @StoredDocLibRowId int
    DECLARE @StoredListId uniqueidentifier
    SELECT TOP 1
        @StoredVersion = UnVersionedMetaInfoVersion,
        @StoredSize = ISNULL(UnVersionedMetaInfoSize,0),
        @StoredDocLibRowId = DoclibRowId,
        @StoredListId = ListId
    FROM
        Docs
    WHERE
        SiteId = @SiteId AND
        DirName = @DirName AND
        LeafName = @LeafName
    IF @StoredVersion IS NOT NULL AND @UpdatedVersion <> @StoredVersion
        RETURN 33
    DECLARE @NextVersion int
    SET @NextVersion = CASE WHEN @StoredVersion IS NULL THEN 1
                       ELSE @StoredVersion + 1 END
    DECLARE @NumRowsWritten int
    UPDATE 
        Docs
    SET
        UnVersionedMetaInfo = @MetaInfo,
        UnVersionedMetaInfoSize = @MetaInfoSize,
        UnversionedMetaInfoVersion = @NextVersion
    WHERE
        SiteId = @SiteId AND
        DirName = @DirName AND
        LeafName = @LeafName AND
        (UnVersionedMetaInfoVersion = @StoredVersion OR
         UnVersionedMetaInfoVersion IS NULL AND @StoredVersion IS NULL)
    SET @NumRowsWritten = @@ROWCOUNT
    IF @NumRowsWritten = 0
        RETURN 33
    SET @UpdatedVersion = @NextVersion
    IF @UpdateHCD IS NOT NULL AND @UpdateHCD <> 0 
        AND @StoredDocLibRowId IS NOT NULL
        AND @StoredListId IS NOT NULL
    BEGIN
        DECLARE @Value int
        SET @Value = CASE WHEN @HCD = 0 THEN 0 ELSE 1 END
        EXEC proc_UpdateItemInNameValuePair
            @SiteID, NULL, @StoredListId, @StoredDocLibRowId, NULL,
            '{26d0756c-986a-48a7-af35-bf18ab85ff4a}', @Value
        UPDATE
            UserData
        SET 
            tp_HasCopyDestinations = @Value
        WHERE
            tp_SiteId = @SiteId AND
            tp_ListId = @StoredListId AND
            tp_ID = @StoredDocLibRowId AND
            tp_RowOrdinal = 0
    END
    DECLARE @cbDelta int
    SET @cbDelta = @NumRowsWritten * (@MetaInfoSize - @StoredSize) 
    EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp @SiteId, @cbDelta, 1
    RETURN 0

GO
