/****** Object:  StoredProcedure [dbo].[proc_FixV2ContentTypeField]    Script Date: 5/15/2018 12:12:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_FixV2ContentTypeField(
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier,
    @ContentTypeId tContentTypeId,
    @ContentType nvarchar(255))
AS
    SET NOCOUNT ON
    UPDATE
        NVP
    SET
        Value = @ContentType
    FROM
        NameValuePair AS NVP
    INNER JOIN
        AllUserData
    ON
        NVP.ListId = AllUserData.tp_ListID AND
        NVP.ItemId = AllUserData.tp_Id
    WHERE
        NVP.SiteId = @SiteId AND
        NVP.ListId = @ListId AND
        NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND
        AllUserData.tp_ContentTypeID = @ContentTypeId
    DECLARE @Collation smallint
    EXEC proc_GetCollation @ListId, @Collation OUTPUT
    IF @Collation = 0
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Albanian_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 1
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Arabic_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 2
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Chinese_PRC_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 3
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Chinese_PRC_Stroke_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 4
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Chinese_Taiwan_Bopomofo_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 5
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Chinese_Taiwan_Stroke_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 6
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Croatian_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 7
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Cyrillic_General_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 8
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Czech_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 9
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Danish_Norwegian_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 10
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Estonian_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 11
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Finnish_Swedish_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 12
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_French_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 13
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Georgian_Modern_Sort_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 14
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_German_PhoneBook_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 15
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Greek_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 16
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Hebrew_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 17
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Hindi_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 18
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Hungarian_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 19
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Hungarian_Technical_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 20
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Icelandic_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 21
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Japanese_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 22
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Japanese_Unicode_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 23
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Korean_Wansung_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 24
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Korean_Wansung_Unicode_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 25
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Latin1_General_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 26
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Latvian_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 27
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Lithuanian_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 28
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Lithuanian_Classic_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 29
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Traditional_Spanish_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 30
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Modern_Spanish_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 31
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Polish_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 32
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Romanian_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 33
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Slovak_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 34
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Slovenian_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 35
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Thai_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 36
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Turkish_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 37
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Ukrainian_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    ELSE
    IF @Collation = 38
    BEGIN
        UPDATE NVP SET Value = @ContentType FROM
            NameValuePair_Vietnamese_CI_AS AS NVP
        INNER JOIN AllUserData ON NVP.ListId = AllUserData.tp_ListID AND NVP.ItemId = AllUserData.tp_Id WHERE NVP.SiteId = @SiteId AND NVP.ListId = @ListId AND NVP.FieldId = '{c042a256-787d-4a6f-8a8a-cf6ab767f12d}' AND AllUserData.tp_ContentTypeID = @ContentTypeId
    END
    UPDATE
        AllUserData
    SET
        tp_ContentType = @ContentType
    WHERE
        @SiteId = tp_SiteId AND
        @ListId = tp_ListId AND
        @ContentTypeId = tp_ContentTypeId

GO
