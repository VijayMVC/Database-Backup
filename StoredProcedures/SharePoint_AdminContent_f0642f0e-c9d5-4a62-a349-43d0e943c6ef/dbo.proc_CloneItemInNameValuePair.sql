/****** Object:  StoredProcedure [dbo].[proc_CloneItemInNameValuePair]    Script Date: 5/15/2018 12:12:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_CloneItemInNameValuePair(
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier,
    @OldItemId int,
    @NewItemId int,
    @OldLevel tinyint,
    @NewLevel tinyint)
AS
    SET NOCOUNT ON
    DECLARE @Collation smallint
    SELECT
        @Collation = Webs.Collation
    FROM
        Webs
    INNER JOIN
        Lists
    ON
        Lists.tp_WebId = Webs.Id
    WHERE
        Lists.tp_Id = @ListId
    INSERT INTO NameValuePair(
        SiteId,
        WebId,
        ListId,
        ItemId,
        Level,
        FieldId,
        Value)
    SELECT
        SiteId,
        WebId,
        ListId,
        @NewItemId,
        COALESCE(@NewLevel,Level),
        FieldId,
        Value
    FROM
        NameValuePair
    WHERE
        SiteId = @SiteId AND
        ListId = @ListId AND
        ItemId = @OldItemId AND
        Level = @OldLevel
    IF @Collation = 0
    BEGIN
        INSERT INTO NameValuePair_Albanian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Albanian_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 1
    BEGIN
        INSERT INTO NameValuePair_Arabic_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Arabic_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 2
    BEGIN
        INSERT INTO NameValuePair_Chinese_PRC_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Chinese_PRC_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 3
    BEGIN
        INSERT INTO NameValuePair_Chinese_PRC_Stroke_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Chinese_PRC_Stroke_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 4
    BEGIN
        INSERT INTO NameValuePair_Chinese_Taiwan_Bopomofo_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Chinese_Taiwan_Bopomofo_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 5
    BEGIN
        INSERT INTO NameValuePair_Chinese_Taiwan_Stroke_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Chinese_Taiwan_Stroke_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 6
    BEGIN
        INSERT INTO NameValuePair_Croatian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Croatian_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 7
    BEGIN
        INSERT INTO NameValuePair_Cyrillic_General_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Cyrillic_General_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 8
    BEGIN
        INSERT INTO NameValuePair_Czech_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Czech_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 9
    BEGIN
        INSERT INTO NameValuePair_Danish_Norwegian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Danish_Norwegian_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 10
    BEGIN
        INSERT INTO NameValuePair_Estonian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Estonian_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 11
    BEGIN
        INSERT INTO NameValuePair_Finnish_Swedish_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Finnish_Swedish_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 12
    BEGIN
        INSERT INTO NameValuePair_French_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_French_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 13
    BEGIN
        INSERT INTO NameValuePair_Georgian_Modern_Sort_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Georgian_Modern_Sort_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 14
    BEGIN
        INSERT INTO NameValuePair_German_PhoneBook_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_German_PhoneBook_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 15
    BEGIN
        INSERT INTO NameValuePair_Greek_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Greek_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 16
    BEGIN
        INSERT INTO NameValuePair_Hebrew_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Hebrew_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 17
    BEGIN
        INSERT INTO NameValuePair_Hindi_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Hindi_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 18
    BEGIN
        INSERT INTO NameValuePair_Hungarian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Hungarian_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 19
    BEGIN
        INSERT INTO NameValuePair_Hungarian_Technical_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Hungarian_Technical_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 20
    BEGIN
        INSERT INTO NameValuePair_Icelandic_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Icelandic_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 21
    BEGIN
        INSERT INTO NameValuePair_Japanese_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Japanese_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 22
    BEGIN
        INSERT INTO NameValuePair_Japanese_Unicode_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Japanese_Unicode_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 23
    BEGIN
        INSERT INTO NameValuePair_Korean_Wansung_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Korean_Wansung_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 24
    BEGIN
        INSERT INTO NameValuePair_Korean_Wansung_Unicode_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Korean_Wansung_Unicode_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 25
    BEGIN
        INSERT INTO NameValuePair_Latin1_General_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Latin1_General_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 26
    BEGIN
        INSERT INTO NameValuePair_Latvian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Latvian_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 27
    BEGIN
        INSERT INTO NameValuePair_Lithuanian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Lithuanian_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 28
    BEGIN
        INSERT INTO NameValuePair_Lithuanian_Classic_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Lithuanian_Classic_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 29
    BEGIN
        INSERT INTO NameValuePair_Traditional_Spanish_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Traditional_Spanish_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 30
    BEGIN
        INSERT INTO NameValuePair_Modern_Spanish_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Modern_Spanish_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 31
    BEGIN
        INSERT INTO NameValuePair_Polish_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Polish_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 32
    BEGIN
        INSERT INTO NameValuePair_Romanian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Romanian_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 33
    BEGIN
        INSERT INTO NameValuePair_Slovak_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Slovak_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 34
    BEGIN
        INSERT INTO NameValuePair_Slovenian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Slovenian_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 35
    BEGIN
        INSERT INTO NameValuePair_Thai_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Thai_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 36
    BEGIN
        INSERT INTO NameValuePair_Turkish_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Turkish_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 37
    BEGIN
        INSERT INTO NameValuePair_Ukrainian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Ukrainian_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    ELSE
    IF @Collation = 38
    BEGIN
        INSERT INTO NameValuePair_Vietnamese_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
            SELECT
                SiteId, WebId, ListId, @NewItemId, COALESCE(@NewLevel,Level), FieldId, Value
            FROM
                NameValuePair_Vietnamese_CI_AS
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @OldItemId AND
                Level = @OldLevel
    END
    RETURN 0

GO
