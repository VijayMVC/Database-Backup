/****** Object:  StoredProcedure [dbo].[proc_DeplGetListItemAndReserveId]    Script Date: 5/15/2018 12:12:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplGetListItemAndReserveId(
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier,
    @DocId uniqueidentifier OUTPUT,
    @IsDeleted bit OUTPUT,
    @ListItemId int OUTPUT,
    @WebId uniqueidentifier,
    @OriginalListItemId int,
    @IsIdTaken bit OUTPUT,
    @ListItemUrl nvarchar(260) OUTPUT,
    @DeleteRecycleBinItems bit = 0)
AS
    SET NOCOUNT ON
    IF @SiteId IS NULL OR @ListId IS NULL 
        RETURN 87
    SET @IsDeleted = 0
    SET @IsIdTaken = 0
    DECLARE @ItemExists bit
    SET @ItemExists = 0
    DECLARE @DeleteTransactionId varbinary(16)
    SELECT TOP 1
        @ListItemId = Docs.DocLibRowId,
        @DeleteTransactionId = Docs.DeleteTransactionId,
        @IsDeleted =
            CASE
                WHEN DeleteTransactionId=0x0 THEN 0
                ELSE 1
            END,
        @ListItemUrl = '/' + CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END            
    FROM
        AllDocs as Docs
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.Id = @DocId AND
        Docs.ListId = @ListId
    IF @@ROWCOUNT > 0
        SET @ItemExists = 1
    IF @ItemExists = 0 AND @ListItemUrl IS NOT NULL
    BEGIN
        DECLARE @DirName nvarchar(256)
        DECLARE @LeafName nvarchar(128)
        EXEC proc_SplitUrl @ListItemUrl, @DirName OUTPUT, @LeafName OUTPUT
        SELECT TOP 1
            @DocId = Docs.Id,
            @ListItemId = Docs.DocLibRowId,
            @DeleteTransactionId = Docs.DeleteTransactionId,
            @IsDeleted =
                CASE
                    WHEN DeleteTransactionId=0x0 THEN 0
                    ELSE 1
                END,
            @ListItemUrl = '/' + CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END     				
        FROM
            AllDocs as Docs
        WHERE
            Docs.SiteId = @SiteId AND
            Docs.DirName = @DirName   AND
            Docs.LeafName = @LeafName 
        IF @@ROWCOUNT > 0
            SET @ItemExists = 1
    END
    IF @ItemExists = 1 AND @IsDeleted = 0
    BEGIN
        SET @IsIdTaken = 1
        RETURN @ItemExists
    END
    IF @IsDeleted = 1
    BEGIN     
        IF @DeleteRecycleBinItems = 1
        BEGIN
            EXEC proc_DeleteRecycleBinItem
                 @SiteId, '00000000-0000-0000-0000-000000000000', 0, @DeleteTransactionId
            SET @IsDeleted = 0
            SET @IsIdTaken = 0
        END
        SET @ItemExists = 0
        RETURN @ItemExists
    END
    IF EXISTS(
        SELECT 1
        FROM AllUserData
        WHERE tp_ListId = @ListId AND
              tp_ID = @OriginalListItemId)
        SET @IsIdTaken = 1
    IF @IsDeleted = 0
    BEGIN
        IF @IsIdTaken = 0
        BEGIN
            DECLARE @NextAvailableId int
            SELECT
                @NextAvailableId = tp_NextAvailableId
            FROM
                Lists WITH (UPDLOCK)
            WHERE
                tp_WebId = @WebId AND
                tp_ID = @ListId
            IF ISNULL(@NextAvailableId, 1) <= @OriginalListItemId 
            BEGIN
                SET @NextAvailableId = @OriginalListItemId + 1
                exec proc_SetNextId @WebId, @ListId, @NextAvailableId
            END                
            SET @ListItemId = @OriginalListItemId
        END			
        ELSE
            BEGIN
                exec @ListItemId = proc_GenerateNextId @WebId, @ListId, 1
            END				
    END   
    RETURN 0         

GO
