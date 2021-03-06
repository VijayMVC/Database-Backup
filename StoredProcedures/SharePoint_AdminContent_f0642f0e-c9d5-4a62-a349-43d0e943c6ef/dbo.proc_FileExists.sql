/****** Object:  StoredProcedure [dbo].[proc_FileExists]    Script Date: 5/15/2018 12:12:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_FileExists(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @DocId uniqueidentifier,
    @Url nvarchar(260),
    @DeleteRecycleBinItems bit = 0,
    @IsDeleted bit OUTPUT,
    @DocExists bit OUTPUT,
    @DestDocId uniqueidentifier OUTPUT)
AS
    SET NOCOUNT ON
    SET @DocExists = 0
    SET @IsDeleted = 0
    IF @DocId IS NOT NULL
    BEGIN
        SET @DestDocId = @DocId
        DECLARE @DeleteTransactionId varbinary(16)
        IF EXISTS(
            SELECT 1
            FROM
                AllDocs as Docs
            WHERE
                Docs.SiteId <> @SiteId AND
                Docs.Id = @DocId)
        BEGIN
            SET @DocExists = 1
            RETURN 80
        END
        SELECT TOP 1
            @DeleteTransactionId = Docs.DeleteTransactionId,
            @IsDeleted =
                CASE
                    WHEN Docs.DeleteTransactionId = 0x THEN 0
                    ELSE 1
                END
        FROM
            AllDocs as Docs
        WHERE
            Docs.SiteId = @SiteId AND
            Docs.Id = @DocId
        IF @@RowCount <> 0
            SET @DocExists = 1
        IF @DocExists = 1 AND
           @IsDeleted = 1 AND
           @DeleteRecycleBinItems = 1
        BEGIN
            EXEC proc_DeleteRecycleBinItem
                 @SiteId, '00000000-0000-0000-0000-000000000000', 0, @DeleteTransactionId
            SET @DocExists = 0
            SET @IsDeleted = 0
        END
    END
    IF @DocExists = 0 AND @Url IS NOT NULL
    BEGIN
        DECLARE @DirName nvarchar(256)
        DECLARE @LeafName nvarchar(128)
        EXEC proc_SplitUrl @Url, @DirName OUTPUT, @LeafName OUTPUT
        SELECT TOP 1
            @DestDocId = Id
        FROM
            AllDocs as Docs
        WHERE
            Docs.SiteId = @SiteId     AND
            Docs.WebId = @WebId       AND
            Docs.DirName = @DirName   AND
            Docs.LeafName = @LeafName AND
            Docs.DeleteTransactionId = 0x
        IF @@RowCount <> 0
            SET @DocExists = 1
    END
    RETURN 0

GO
