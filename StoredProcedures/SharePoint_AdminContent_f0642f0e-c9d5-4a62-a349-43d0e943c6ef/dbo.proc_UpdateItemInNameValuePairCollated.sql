/****** Object:  StoredProcedure [dbo].[proc_UpdateItemInNameValuePairCollated]    Script Date: 5/15/2018 12:13:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateItemInNameValuePairCollated(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @ListId uniqueidentifier,
    @ItemId int,
    @Collation smallint,
    @Level tinyint = 1,
    @FieldId1 uniqueidentifier = NULL,
    @FieldValue1 nvarchar(255) = NULL,
    @FieldId2 uniqueidentifier = NULL,
    @FieldValue2 nvarchar(255) = NULL,
    @FieldId3 uniqueidentifier = NULL,
    @FieldValue3 nvarchar(255) = NULL,
    @FieldId4 uniqueidentifier = NULL,
    @FieldValue4 nvarchar(255) = NULL,
    @FieldId5 uniqueidentifier = NULL,
    @FieldValue5 nvarchar(255) = NULL,
    @FieldId6 uniqueidentifier = NULL,
    @FieldValue6 nvarchar(255) = NULL,
    @FieldId7 uniqueidentifier = NULL,
    @FieldValue7 nvarchar(255) = NULL,
    @FieldId8 uniqueidentifier = NULL,
    @FieldValue8 nvarchar(255) = NULL,
    @FieldId9 uniqueidentifier = NULL,
    @FieldValue9 nvarchar(255) = NULL,
    @FieldId10 uniqueidentifier = NULL,
    @FieldValue10 nvarchar(255) = NULL,
    @InsertIfUpdateFails int = 0)
AS
    SET NOCOUNT ON
    DECLARE @ReturnCode int
    SET @ReturnCode = 0
    DECLARE @RowsAffected int
    SET @RowsAffected = 0
    DECLARE @NameValuePairEntries TABLE (
        FieldId uniqueidentifier,
        Value nvarchar(255))
    INSERT INTO @NameValuePairEntries
        SELECT
            @FieldId1 AS FieldId,
            @FieldValue1 AS Value
        WHERE @FieldId1 IS NOT NULL
        UNION ALL
        SELECT
            @FieldId2 AS FieldId,
            @FieldValue2 AS Value
        WHERE @FieldId2 IS NOT NULL
        UNION ALL
        SELECT
            @FieldId3 AS FieldId,
            @FieldValue3 AS Value
        WHERE @FieldId3 IS NOT NULL
        UNION ALL
        SELECT
            @FieldId4 AS FieldId,
            @FieldValue4 AS Value
        WHERE @FieldId4 IS NOT NULL
        UNION ALL
        SELECT
            @FieldId5 AS FieldId,
            @FieldValue5 AS Value
        WHERE @FieldId5 IS NOT NULL
        UNION ALL
        SELECT
            @FieldId6 AS FieldId,
            @FieldValue6 AS Value
        WHERE @FieldId6 IS NOT NULL
        UNION ALL
        SELECT
            @FieldId7 AS FieldId,
            @FieldValue7 AS Value
        WHERE @FieldId7 IS NOT NULL
        UNION ALL
        SELECT
            @FieldId8 AS FieldId,
            @FieldValue8 AS Value
        WHERE @FieldId8 IS NOT NULL
        UNION ALL
        SELECT
            @FieldId9 AS FieldId,
            @FieldValue9 AS Value
        WHERE @FieldId9 IS NOT NULL
        UNION ALL
        SELECT
            @FieldId10 AS FieldId,
            @FieldValue10 AS Value
        WHERE @FieldId10 IS NOT NULL
    IF @Collation = 0
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Albanian_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 1
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Arabic_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 2
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Chinese_PRC_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 3
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Chinese_PRC_Stroke_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 4
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Chinese_Taiwan_Bopomofo_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 5
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Chinese_Taiwan_Stroke_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 6
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Croatian_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 7
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Cyrillic_General_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 8
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Czech_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 9
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Danish_Norwegian_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 10
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Estonian_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 11
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Finnish_Swedish_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 12
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_French_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 13
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Georgian_Modern_Sort_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 14
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_German_PhoneBook_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 15
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Greek_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 16
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Hebrew_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 17
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Hindi_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 18
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Hungarian_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 19
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Hungarian_Technical_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 20
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Icelandic_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 21
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Japanese_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 22
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Japanese_Unicode_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 23
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Korean_Wansung_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 24
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Korean_Wansung_Unicode_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 25
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Latin1_General_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 26
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Latvian_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 27
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Lithuanian_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 28
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Lithuanian_Classic_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 29
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Traditional_Spanish_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 30
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Modern_Spanish_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 31
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Polish_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 32
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Romanian_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 33
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Slovak_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 34
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Slovenian_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 35
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Thai_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 36
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Turkish_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 37
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Ukrainian_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    ELSE
    IF @Collation = 38
    BEGIN
        UPDATE
            NVP
        SET
            NVP.Value = NvpEntries.Value
        FROM
            @NameValuePairEntries AS NvpEntries
        INNER JOIN
            NameValuePair_Vietnamese_CI_AS NVP
        ON
            NVP.SiteId = @SiteId AND
            NVP.ListId = @ListId AND
            NVP.ItemId = @ItemId AND
            NVP.Level = CASE WHEN @Level IS NULL THEN NVP.Level ELSE @Level END AND
            NVP.FieldId = NvpEntries.FieldId
    END
    SET @RowsAffected = @@RowCount
    IF @RowsAffected = 0
    BEGIN
        IF @InsertIfUpdateFails = 1
        BEGIN
            EXEC @ReturnCode = proc_InsertItemIntoNameValuePairCollated
                @SiteId, @WebId, @ListId, @ItemId, @Collation, @Level,
                @FieldId1, @FieldValue1,
                @FieldId2, @FieldValue2,
                @FieldId3, @FieldValue3,
                @FieldId4, @FieldValue4,
                @FieldId5, @FieldValue5,
                @FieldId6, @FieldValue6,
                @FieldId7, @FieldValue7,
                @FieldId8, @FieldValue8,
                @FieldId9, @FieldValue9,
                @FieldId10, @FieldValue10
            SET @RowsAffected = @@RowCount
        END
        IF @RowsAffected = 0
        BEGIN
            SET @ReturnCode = 87
            GOTO CLEANUP
        END
    END
CLEANUP:
    RETURN @ReturnCode

GO
