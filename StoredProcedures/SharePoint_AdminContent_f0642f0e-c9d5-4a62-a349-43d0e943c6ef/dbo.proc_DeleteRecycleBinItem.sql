/****** Object:  StoredProcedure [dbo].[proc_DeleteRecycleBinItem]    Script Date: 5/15/2018 12:12:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeleteRecycleBinItem(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @UserId int,
    @DeleteTransactionId varbinary(16)
    )
AS
    SET NOCOUNT ON
    DECLARE @Ret int
    SET @Ret = 1359
    DECLARE @DeleteUserId int
    DECLARE @ItemType tinyint
    DECLARE @DocId uniqueidentifier
    DECLARE @DocVersionId int
    DECLARE @ListId uniqueidentifier
    DECLARE @ListItemId int
    DECLARE @FreedSpace bigint
    DECLARE @FreedRecycleBinSpace bigint
    DECLARE @Collation smallint
    BEGIN TRAN
    IF (@UserId = 0)
    BEGIN
        SELECT
            @WebId = WebId,
            @DeleteUserId = DeleteUserId,
            @ItemType = ItemType,
            @DocId = DocId,
            @DocVersionId = DocVersionId,
            @ListId = ListId,
            @ListItemId = ListItemId,
            @FreedSpace =
                CASE
                WHEN BinId <> 2 THEN Size 
                ELSE 0
                END,
            @FreedRecycleBinSpace =
                CASE
                WHEN BinId = 2 THEN Size 
                ELSE 0
                END
        FROM
            RecycleBin
        WHERE
            SiteId = @SiteId AND
            DeleteTransactionId = @DeleteTransactionId
        IF (@@ROWCOUNT <> 1)
        BEGIN
            SET @Ret = 1168
            GOTO cleanup
        END
    END
    ELSE
    BEGIN
        SELECT
            @ItemType = ItemType,
            @DocId = DocId,
            @DocVersionId = DocVersionId,
            @ListId = ListId,
            @ListItemId = ListItemId,
            @FreedSpace =
                CASE
                WHEN BinId <> 2 THEN Size 
                ELSE 0
                END,
            @FreedRecycleBinSpace =
                CASE
                WHEN BinId = 2 THEN Size 
                ELSE 0
                END
        FROM
            RecycleBin
        WHERE
            SiteId = @SiteId AND
            WebId = @WebId AND
            DeleteUserId = @UserId AND
            DeleteTransactionId = @DeleteTransactionId
        IF (@@ROWCOUNT <> 1)
        BEGIN
            SET @Ret = 1168
            GOTO cleanup
        END
        SET @DeleteUserId = @UserId
    END
    DELETE FROM
        RecycleBin
    WHERE
        SiteId = @SiteId AND
        WebId = @WebId AND
        DeleteTransactionId = @DeleteTransactionId
    IF (@ItemType = 2)
    BEGIN
        DELETE FROM
            AllDocVersions
        WHERE
            SiteId = @SiteId AND
            Id = @DocId AND
            Version = @DocVersionId
        DELETE FROM
            AllUserData
        WHERE
            tp_SiteId = @SiteId AND
            tp_ListId = @ListId AND
            tp_ID = @ListItemId AND
            tp_CalculatedVersion = @DocVersionId
        SET @Ret = 0
        GOTO cleanup
    END
    ELSE IF (@ItemType = 8)
    BEGIN
        DELETE FROM
            AllUserData
        WHERE
            tp_ListId = @ListId AND
            tp_ID = @ListItemId AND
            tp_CalculatedVersion = @DocVersionId
        SET @Ret = 0
        GOTO cleanup
    END
    ELSE IF (@ItemType = 7)
    BEGIN
        DELETE FROM
            AllDocs
        WHERE
            SiteId = @SiteId AND
            DeleteTransactionId = @DeleteTransactionId
        DELETE FROM
            AllDocStreams
        WHERE
            SiteId = @SiteId AND
            DeleteTransactionId = @DeleteTransactionId
        SET @Ret = 0
        GOTO cleanup
    END
    DECLARE @TransactionsDeleted table (
        DeleteTransactionId varbinary(16),
        BinId tinyint,
        Size bigint)
    INSERT INTO @TransactionsDeleted
        (DeleteTransactionId, BinId, Size)
    VALUES
        (@DeleteTransactionId, 0, 0)
    DECLARE @ListsDeleted table (
        ListId uniqueidentifier)
    DECLARE @DocsDeleted table (
        DocId uniqueidentifier)
    IF @ItemType = 6
    BEGIN
        INSERT INTO @ListsDeleted 
            (ListId)
        SELECT
            tp_Id
        FROM      
            AllLists
        WHERE
            tp_WebId = @WebId AND
            tp_DeleteTransactionId = @DeleteTransactionId
        INSERT INTO @TransactionsDeleted 
            (DeleteTransactionId, BinId, Size)
        SELECT
            DeleteTransactionId, BinId, Size
        FROM
            RecycleBin
        WHERE
            ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE IF @ItemType = 4
    BEGIN
        INSERT INTO @TransactionsDeleted
            (DeleteTransactionId, BinId, Size)
        SELECT
            DeleteTransactionId, BinId, Size
        FROM
            RecycleBin
        WHERE
            ListId = @ListId
    END
    ELSE IF @ItemType = 3
    BEGIN
        INSERT INTO @TransactionsDeleted
            (DeleteTransactionId, BinId, Size)
        SELECT
            DeleteTransactionId, BinId, Size
        FROM
            RecycleBin
        WHERE
            ListId = @ListId AND
            ListItemId = @ListItemId
    END
    ELSE IF @ItemType = 5
    BEGIN
        INSERT INTO @TransactionsDeleted
            (DeleteTransactionId, BinId, Size)
        SELECT
            DeleteTransactionId, BinId, Size
        FROM
            RecycleBin
        WHERE
            ListId = @ListId AND
            ListItemId IN
                (SELECT
                    tp_Id
                FROM
                    AllUserData
                WHERE    
                    tp_ListId = @ListId AND
                    tp_DeleteTransactionId = @DeleteTransactionId)
    END
    IF ((SELECT COUNT(*) FROM @TransactionsDeleted) > 1)
    BEGIN
        INSERT INTO @DocsDeleted (
            DocId)
        SELECT
            AllDocs.Id
        FROM
            AllDocs
        WHERE
            SiteId = @SiteId AND
            DeleteTransactionId IN (SELECT DeleteTransactionId FROM @TransactionsDeleted)
    END
    ELSE
    BEGIN
        INSERT INTO @DocsDeleted (
            DocId)
        SELECT
            AllDocs.Id
        FROM
            AllDocs
        WHERE
            SiteId = @SiteId AND
            DeleteTransactionId = @DeleteTransactionId
    END
    IF (@ItemType = 4)
    BEGIN
        DELETE FROM
            ImmedSubscriptions
        WHERE
            SiteId = @SiteId AND
            ListId = @ListId
        DELETE FROM
            SchedSubscriptions
        WHERE
            SiteId = @SiteId AND
            ListId = @ListId
        DELETE FROM
            AllUserData
        WHERE
            tp_ListId = @ListId
        EXEC proc_DeleteFromNVP @SiteId, @ListId
        DELETE FROM
            AllLists
        WHERE
            tp_WebId = @WebId AND
            tp_Id = @ListId
        DELETE FROM
            EventReceivers
        WHERE
            SiteId = @SiteId AND
            WebId = @WebId AND
            HostId = @ListId
        DELETE FROM
            ContentTypeUsage
        WHERE
            SiteId = @SiteId AND
            WebId = @WebId AND
            ListId = @ListId
        UPDATE
            WorkflowAssociation
        SET
            Configuration = Configuration | 512
        WHERE
            SiteId = @SiteId AND
            WebId = @WebId AND
            ListId = @ListId
        DELETE FROM
            ScheduledWorkitems
        WHERE
            SiteId = @SiteId AND
            ParentId = @ListId
    END
    ELSE IF (@ItemType = 6)
    BEGIN
        DELETE FROM
            ImmedSubscriptions
        WHERE
            SiteId = @SiteId AND
            ListId IN (SELECT ListId FROM @ListsDeleted)
        DELETE FROM
            SchedSubscriptions
        WHERE
            SiteId = @SiteId AND
            ListId IN (SELECT ListId FROM @ListsDeleted)
        DELETE FROM
            AllUserData
        WHERE
            tp_ListId IN (SELECT ListId FROM @ListsDeleted)
        DELETE NVP FROM
            NameValuePair AS NVP
        WHERE
            SiteId = @SiteId AND
            ListId IN (SELECT ListId FROM @ListsDeleted)
        EXEC proc_GetCollation @ListId, @Collation OUTPUT
    IF @Collation = 0
    BEGIN
        DELETE NVP FROM
            NameValuePair_Albanian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 1
    BEGIN
        DELETE NVP FROM
            NameValuePair_Arabic_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 2
    BEGIN
        DELETE NVP FROM
            NameValuePair_Chinese_PRC_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 3
    BEGIN
        DELETE NVP FROM
            NameValuePair_Chinese_PRC_Stroke_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 4
    BEGIN
        DELETE NVP FROM
            NameValuePair_Chinese_Taiwan_Bopomofo_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 5
    BEGIN
        DELETE NVP FROM
            NameValuePair_Chinese_Taiwan_Stroke_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 6
    BEGIN
        DELETE NVP FROM
            NameValuePair_Croatian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 7
    BEGIN
        DELETE NVP FROM
            NameValuePair_Cyrillic_General_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 8
    BEGIN
        DELETE NVP FROM
            NameValuePair_Czech_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 9
    BEGIN
        DELETE NVP FROM
            NameValuePair_Danish_Norwegian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 10
    BEGIN
        DELETE NVP FROM
            NameValuePair_Estonian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 11
    BEGIN
        DELETE NVP FROM
            NameValuePair_Finnish_Swedish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 12
    BEGIN
        DELETE NVP FROM
            NameValuePair_French_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 13
    BEGIN
        DELETE NVP FROM
            NameValuePair_Georgian_Modern_Sort_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 14
    BEGIN
        DELETE NVP FROM
            NameValuePair_German_PhoneBook_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 15
    BEGIN
        DELETE NVP FROM
            NameValuePair_Greek_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 16
    BEGIN
        DELETE NVP FROM
            NameValuePair_Hebrew_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 17
    BEGIN
        DELETE NVP FROM
            NameValuePair_Hindi_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 18
    BEGIN
        DELETE NVP FROM
            NameValuePair_Hungarian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 19
    BEGIN
        DELETE NVP FROM
            NameValuePair_Hungarian_Technical_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 20
    BEGIN
        DELETE NVP FROM
            NameValuePair_Icelandic_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 21
    BEGIN
        DELETE NVP FROM
            NameValuePair_Japanese_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 22
    BEGIN
        DELETE NVP FROM
            NameValuePair_Japanese_Unicode_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 23
    BEGIN
        DELETE NVP FROM
            NameValuePair_Korean_Wansung_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 24
    BEGIN
        DELETE NVP FROM
            NameValuePair_Korean_Wansung_Unicode_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 25
    BEGIN
        DELETE NVP FROM
            NameValuePair_Latin1_General_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 26
    BEGIN
        DELETE NVP FROM
            NameValuePair_Latvian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 27
    BEGIN
        DELETE NVP FROM
            NameValuePair_Lithuanian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 28
    BEGIN
        DELETE NVP FROM
            NameValuePair_Lithuanian_Classic_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 29
    BEGIN
        DELETE NVP FROM
            NameValuePair_Traditional_Spanish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 30
    BEGIN
        DELETE NVP FROM
            NameValuePair_Modern_Spanish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 31
    BEGIN
        DELETE NVP FROM
            NameValuePair_Polish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 32
    BEGIN
        DELETE NVP FROM
            NameValuePair_Romanian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 33
    BEGIN
        DELETE NVP FROM
            NameValuePair_Slovak_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 34
    BEGIN
        DELETE NVP FROM
            NameValuePair_Slovenian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 35
    BEGIN
        DELETE NVP FROM
            NameValuePair_Thai_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 36
    BEGIN
        DELETE NVP FROM
            NameValuePair_Turkish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 37
    BEGIN
        DELETE NVP FROM
            NameValuePair_Ukrainian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE
    IF @Collation = 38
    BEGIN
        DELETE NVP FROM
            NameValuePair_Vietnamese_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId IN (SELECT ListId FROM @ListsDeleted)
    END
        DELETE FROM
            AllLists
        WHERE
            tp_WebId = @WebId AND
            tp_Id IN (SELECT ListId FROM @ListsDeleted)
        DELETE FROM
            EventReceivers
        WHERE
            SiteId = @SiteId AND
            WebId = @WebId AND
            HostId IN (SELECT ListId FROM @ListsDeleted)
        DELETE FROM
            ContentTypeUsage
        WHERE
            SiteId = @SiteId AND
            WebId = @WebId AND
            ListId IN (SELECT ListId FROM @ListsDeleted)
        UPDATE
            WorkflowAssociation
        SET
            Configuration = Configuration | 512
        WHERE
            SiteId = @SiteId AND
            WebId = @WebId AND
            ListId IN (SELECT ListId FROM @ListsDeleted)
        DELETE FROM
            ScheduledWorkitems
        WHERE
            SiteId = @SiteId AND
            ParentId IN (SELECT ListId FROM @ListsDeleted)
    END
    ELSE IF (@ItemType = 5)
    BEGIN
        DELETE FROM
            ImmedSubscriptions
        WHERE
            SiteId = @SiteId AND
            ListId = @ListId AND
            ItemId IN
                (SELECT
                    tp_Id
                FROM
                    AllUserData
                WHERE
                    tp_ListId = @ListId AND
                    tp_DeleteTransactionId = @DeleteTransactionId)
        DELETE FROM
            SchedSubscriptions
        WHERE
            SiteId = @SiteId AND
            ListId = @ListId AND
            ItemId IN
                (SELECT
                    tp_Id
                FROM
                    AllUserData
                WHERE    
                    tp_ListId = @ListId AND
                    tp_DeleteTransactionId = @DeleteTransactionId)
        DELETE NVP FROM
            NameValuePair AS NVP
        WHERE
            SiteId = @SiteId AND
            ListId = @ListId AND
            ItemId IN
                (SELECT
                    tp_Id
                FROM
                    AllUserData
                WHERE    
                    tp_ListId = @ListId AND
                    tp_DeleteTransactionId = @DeleteTransactionId)
        EXEC proc_GetCollation @ListId, @Collation OUTPUT
    IF @Collation = 0
    BEGIN
        DELETE NVP FROM
            NameValuePair_Albanian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 1
    BEGIN
        DELETE NVP FROM
            NameValuePair_Arabic_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 2
    BEGIN
        DELETE NVP FROM
            NameValuePair_Chinese_PRC_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 3
    BEGIN
        DELETE NVP FROM
            NameValuePair_Chinese_PRC_Stroke_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 4
    BEGIN
        DELETE NVP FROM
            NameValuePair_Chinese_Taiwan_Bopomofo_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 5
    BEGIN
        DELETE NVP FROM
            NameValuePair_Chinese_Taiwan_Stroke_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 6
    BEGIN
        DELETE NVP FROM
            NameValuePair_Croatian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 7
    BEGIN
        DELETE NVP FROM
            NameValuePair_Cyrillic_General_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 8
    BEGIN
        DELETE NVP FROM
            NameValuePair_Czech_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 9
    BEGIN
        DELETE NVP FROM
            NameValuePair_Danish_Norwegian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 10
    BEGIN
        DELETE NVP FROM
            NameValuePair_Estonian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 11
    BEGIN
        DELETE NVP FROM
            NameValuePair_Finnish_Swedish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 12
    BEGIN
        DELETE NVP FROM
            NameValuePair_French_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 13
    BEGIN
        DELETE NVP FROM
            NameValuePair_Georgian_Modern_Sort_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 14
    BEGIN
        DELETE NVP FROM
            NameValuePair_German_PhoneBook_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 15
    BEGIN
        DELETE NVP FROM
            NameValuePair_Greek_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 16
    BEGIN
        DELETE NVP FROM
            NameValuePair_Hebrew_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 17
    BEGIN
        DELETE NVP FROM
            NameValuePair_Hindi_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 18
    BEGIN
        DELETE NVP FROM
            NameValuePair_Hungarian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 19
    BEGIN
        DELETE NVP FROM
            NameValuePair_Hungarian_Technical_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 20
    BEGIN
        DELETE NVP FROM
            NameValuePair_Icelandic_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 21
    BEGIN
        DELETE NVP FROM
            NameValuePair_Japanese_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 22
    BEGIN
        DELETE NVP FROM
            NameValuePair_Japanese_Unicode_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 23
    BEGIN
        DELETE NVP FROM
            NameValuePair_Korean_Wansung_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 24
    BEGIN
        DELETE NVP FROM
            NameValuePair_Korean_Wansung_Unicode_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 25
    BEGIN
        DELETE NVP FROM
            NameValuePair_Latin1_General_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 26
    BEGIN
        DELETE NVP FROM
            NameValuePair_Latvian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 27
    BEGIN
        DELETE NVP FROM
            NameValuePair_Lithuanian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 28
    BEGIN
        DELETE NVP FROM
            NameValuePair_Lithuanian_Classic_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 29
    BEGIN
        DELETE NVP FROM
            NameValuePair_Traditional_Spanish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 30
    BEGIN
        DELETE NVP FROM
            NameValuePair_Modern_Spanish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 31
    BEGIN
        DELETE NVP FROM
            NameValuePair_Polish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 32
    BEGIN
        DELETE NVP FROM
            NameValuePair_Romanian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 33
    BEGIN
        DELETE NVP FROM
            NameValuePair_Slovak_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 34
    BEGIN
        DELETE NVP FROM
            NameValuePair_Slovenian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 35
    BEGIN
        DELETE NVP FROM
            NameValuePair_Thai_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 36
    BEGIN
        DELETE NVP FROM
            NameValuePair_Turkish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 37
    BEGIN
        DELETE NVP FROM
            NameValuePair_Ukrainian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
    ELSE
    IF @Collation = 38
    BEGIN
        DELETE NVP FROM
            NameValuePair_Vietnamese_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId IN (SELECT tp_Id FROM AllUserData WHERE tp_ListId = @ListId AND tp_DeleteTransactionId = @DeleteTransactionId)
    END
        DELETE FROM
            AllUserData
        WHERE
            tp_ListId = @ListId AND
            tp_DeleteTransactionId = @DeleteTransactionId
    END
    ELSE
    BEGIN
        IF @ListItemId IS NOT NULL
        BEGIN
            DELETE FROM
                ImmedSubscriptions
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @ListItemId
            DELETE FROM
                SchedSubscriptions
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @ListItemId
            EXEC proc_DeleteFromNVP @SiteId, @ListId, @ListItemId
            EXEC proc_AutoDropWorkflows @SiteId, @WebId, @ListId, @ListItemId, NULL, NULL, 1 , 5
            DELETE FROM
                AllUserData
            WHERE
                tp_ListId = @ListId AND
                tp_ID = @ListItemId
        END
    END
    DELETE FROM
        EventReceivers
    WHERE
        SiteId = @SiteId AND
        WebId = @WebId AND
        HostId IN (SELECT DocId FROM @DocsDeleted)
    DELETE FROM
        AllDocStreams
    WHERE
        SiteId = @SiteId AND
        Id IN (SELECT DocId FROM @DocsDeleted)
    IF @ItemType = 4 OR
        @ItemType = 6 OR
        @ItemType = 1 OR
        @ItemType = 5
    BEGIN
        INSERT INTO @TransactionsDeleted
            (DeleteTransactionId, BinId, Size)
        SELECT
            RB.DeleteTransactionId, RB.BinId, RB.Size
        FROM
            AllDocVersions DV
        INNER JOIN
            RecycleBin RB
        ON
            DV.DeleteTransactionId = RB.DeleteTransactionId
        WHERE
            DV.SiteId = @SiteId AND
            DV.Id IN (SELECT DocId FROM @DocsDeleted) AND
            DV.DeleteTransactionId <> 0x AND
            DV.DeleteTransactionId <> @DeleteTransactionId
        DELETE FROM
            AllDocVersions
        WHERE
            SiteId = @SiteId AND
            Id IN (SELECT DocId FROM @DocsDeleted)
        DELETE FROM
            WebParts
        WHERE
            tp_SiteId = @SiteId AND
            tp_PageUrlId IN (SELECT DocId FROM @DocsDeleted)
    END
    IF (SELECT COUNT(*) FROM @TransactionsDeleted) > 1
    BEGIN
        SELECT
            @FreedSpace = @FreedSpace + ISNULL(SUM(
                CASE
                WHEN BinId <> 2 THEN Size 
                ELSE 0
                END),0),
            @FreedRecycleBinSpace = @FreedRecycleBinSpace + ISNULL(SUM(
                CASE
                WHEN BinId = 2 THEN Size 
                ELSE 0
                END),0)
        FROM
            @TransactionsDeleted TD
        DELETE FROM
            RecycleBin
        WHERE
            SiteId = @SiteId AND
            WebId = @WebId AND
            DeleteTransactionId IN (SELECT DeleteTransactionId FROM @TransactionsDeleted)
        DELETE FROM
            AllDocs
        WHERE
            SiteId = @SiteId AND
            DeleteTransactionId IN (SELECT DeleteTransactionId FROM @TransactionsDeleted)
        DELETE FROM
            AllLinks
        WHERE
            SiteId = @SiteId AND
            DeleteTransactionId IN (SELECT DeleteTransactionId FROM @TransactionsDeleted)
        DELETE FROM
            Deps
        WHERE
            SiteId = @SiteId AND
            DeleteTransactionId IN (SELECT DeleteTransactionId FROM @TransactionsDeleted)
        DELETE FROM
            Perms
        WHERE
            SiteId = @SiteId AND
            DelTransId IN (SELECT DeleteTransactionId FROM @TransactionsDeleted)
    END
    ELSE
    BEGIN
        DELETE FROM
            AllDocs
        WHERE
            SiteId = @SiteId AND
            DeleteTransactionId = @DeleteTransactionId
        DELETE FROM
            AllLinks
        WHERE
            SiteId = @SiteId AND
            DeleteTransactionId = @DeleteTransactionId
        DELETE FROM
            Deps
        WHERE
            SiteId = @SiteId AND
            DeleteTransactionId = @DeleteTransactionId
        DELETE FROM
            Perms
        WHERE
            SiteId = @SiteId AND
            DelTransId = @DeleteTransactionId
    END
    SET @Ret = 0
cleanup:
    IF (@Ret = 0)
    BEGIN
        EXEC proc_UpdateDiskUsed @SiteId
        IF (@FreedSpace > 0)
        BEGIN
            SET @FreedSpace = -@FreedSpace
            EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp 
                @SiteId, @FreedSpace, 1
        END
        IF (@FreedRecycleBinSpace > 0)
        BEGIN
            UPDATE
                Sites
            SET
                SecondStageDiskUsed = SecondStageDiskUsed - @FreedRecycleBinSpace
            WHERE
                Id = @SiteId    
        END
    END
    IF (@Ret <> 0 AND @@TRANCOUNT = 1) ROLLBACK TRAN ELSE COMMIT TRAN
    RETURN @Ret

GO
