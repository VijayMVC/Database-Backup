/****** Object:  StoredProcedure [dbo].[proc_DeleteAllItemVersions]    Script Date: 5/15/2018 12:12:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeleteAllItemVersions(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @ListId uniqueidentifier,
    @ItemId int,
    @UserId int,
    @UseNvarchar1ItemName bit = 1,
    @DeleteOp int = 3)
AS
    DECLARE @ReturnStatus int
    DECLARE @DeleteTransactionId varbinary(16)
    SET @ReturnStatus = 1359
    BEGIN TRAN
    DECLARE @DirName nvarchar(256)
    DECLARE @LeafName nvarchar(128)
    DECLARE @AuditEventData nvarchar(4000)
    EXEC proc_ListItemIdToSiteDirLeafName @ListId, @ItemId, @SiteId OUTPUT, @DirName OUTPUT, @LeafName OUTPUT
    SET @AuditEventData = STUFF(STUFF('</>', 3, 0, 'Version'), 1, 0, STUFF('<AllPreviousVersions/>', 1, 0, STUFF('<>', 2, 0, 'Version')))
    IF (@DeleteOp = 3) SET @AuditEventData = @AuditEventData + '<Recycle>0<Recycle>'
    ELSE IF (@DeleteOp = 4) SET @AuditEventData = @AuditEventData + '<Recycle>1<Recycle>'
    EXEC @ReturnStatus = proc_AddAuditEntryFromSql
            @SiteId,
            @DirName,
            @LeafName,
            3,
            @UserId,                
            4,
            @AuditEventData,
            0x00000008
    IF @ReturnStatus <> 0 GOTO cleanup
    IF (@DeleteOp = 3)
    BEGIN
        DELETE FROM
            UserDataVersioned
        WHERE
            tp_ListId = @ListId AND
            tp_Id = @ItemId AND
            tp_IsCurrentVersion = CONVERT(bit,0)
        IF @@ROWCOUNT = 0
        BEGIN
            SET @ReturnStatus = 2
            GOTO cleanup
        END
        DELETE
            UserDataJunctionsVersioned
        WHERE
            tp_SiteId = @SiteId AND
            tp_DirName = @DirName AND
            tp_LeafName = @LeafName
        SET @ReturnStatus = 0
    END
    ELSE IF (@DeleteOp = 4)
    BEGIN
        DECLARE @ListDirName nvarchar(256)
        SELECT 
            @ListDirName = CASE WHEN (DATALENGTH(DirName) = 0) THEN LeafName WHEN (DATALENGTH(LeafName) = 0) THEN DirName ELSE DirName + N'/' + LeafName END
        FROM 
            Docs 
        WHERE 
            SiteId = @SiteId AND 
            Id = (SELECT tp_RootFolder FROM Lists WHERE 
                tp_WebId = @WebId AND tp_Id = @ListId)
        DECLARE @VersionsDeleted table (
            ItemVersion int NOT NULL,
            Size bigint NOT NULL,
            ItemName nvarchar(255) NOT NULL,
            AuthorId int,
            DeleteTransactionId uniqueidentifier NOT NULL)
        INSERT INTO @VersionsDeleted (
            ItemVersion,
            Size,
            ItemName,
            AuthorId,
            DeleteTransactionId)
        SELECT
            tp_CalculatedVersion,
            CAST(ISNULL(tp_Size, 0) AS BIGINT),
            CASE 
                WHEN @UseNvarchar1ItemName = 1 AND nvarchar1 IS NOT NULL THEN nvarchar1 
                ELSE CAST(tp_Id AS NVARCHAR(10)) 
            END,
            tp_Editor,
            NEWID()
        FROM
            UserDataVersioned
        WHERE
            tp_ListId = @ListId AND
            tp_Id = @ItemId AND
            tp_IsCurrentVersion = CONVERT(bit,0) AND
            tp_RowOrdinal = 0
        INSERT INTO RecycleBin (
            SiteId,
            WebId,
            BinId,
            DeleteUserId,
            DeleteTransactionId,
            DeleteDate,
            ItemType,
            ListId,
            DocId,
            DocVersionId,
            ListItemId,
            Title,
            DirName,
            LeafName,
            AuthorId,
            Size,
            ListDirName,
            ScopeId)
        SELECT
            @SiteId,
            @WebId,
            1,
            @UserId,
            DeleteTransactionId,
            dbo.fn_RoundDateToNearestSecond(GETUTCDATE()),
            8,
            @ListId,
            NULL,
            ItemVersion,
            @ItemId,
            ItemName + ' (' + CAST(ItemVersion/512 AS nvarchar(10)) + 
                         '.' + CAST(ItemVersion%512 AS nvarchar(10)) + ')',
            @DirName,
            @LeafName,
            AuthorId,
            Size,
            @ListDirName,
            NULL   
        FROM
            @VersionsDeleted
        UPDATE 
            UserDataVersioned
        SET
            tp_DeleteTransactionId = 
                (SELECT
                    DeleteTransactionId
                FROM
                    @VersionsDeleted
                WHERE
                    UserDataVersioned.tp_CalculatedVersion = ItemVersion
                )    
        WHERE
            tp_ListId = @ListId AND
            tp_ID = @ItemId AND
            tp_IsCurrentVersion = CONVERT(bit,0)
        UPDATE
            AllUserDataJunctions
        SET
            tp_DeleteTransactionId = 
                (SELECT
                    DeleteTransactionId
                FROM
                    @VersionsDeleted
                WHERE
                    AllUserDataJunctions.tp_CalculatedVersion = ItemVersion
                )
        WHERE
            tp_SiteId = @SiteId AND
            tp_DirName = @DirName AND
            tp_LeafName = @LeafName AND
            tp_IsCurrentVersion = CAST(0 AS bit) AND
            tp_DeleteTransactionId = 0x
        SET @ReturnStatus = 0
    END
cleanup:
    IF (@ReturnStatus <> 0 AND @@TRANCOUNT = 1) ROLLBACK TRAN ELSE COMMIT TRAN
    RETURN @ReturnStatus

GO
