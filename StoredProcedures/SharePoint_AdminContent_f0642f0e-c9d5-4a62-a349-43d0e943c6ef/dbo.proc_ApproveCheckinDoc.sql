/****** Object:  StoredProcedure [dbo].[proc_ApproveCheckinDoc]    Script Date: 5/15/2018 12:12:27 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ApproveCheckinDoc(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),    
    @Level tinyint OUTPUT, 
    @NewLevel tinyint, 
    @EnableMinorVersions bit,
    @CreateVersion bit)
AS
    SET NOCOUNT ON
    DECLARE @ListID uniqueidentifier
    DECLARE @ItemId int
    DECLARE @DocId uniqueidentifier
    DECLARE @DocParentId uniqueidentifier
    DECLARE @cbOld int
    DECLARE @cbOldMetaInfo int
    DECLARE @cbDelta int
    DECLARE @FullUrl nvarchar(260)
    DECLARE @Collation smallint
    IF @Level <= @NewLevel
        return 0
    SET @cbDelta = 0
    SELECT 
        @ListID = ListId,
        @ItemId = DoclibRowId,
        @DocId = Id,
        @DocParentId = ParentId
    FROM 
        Docs
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @DirName AND
        Docs.LeafName = @LeafName AND 
        Docs.Level = @Level
    SELECT
        @cbOld = ISNULL(Docs.Size, 0),
        @cbOldMetaInfo = ISNULL(Docs.MetaInfoSize, 0)
    FROM 
        Docs
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @DirName AND
        Docs.LeafName = @LeafName AND 
        Docs.Level = @NewLevel
    SET @FullUrl = CASE WHEN (DATALENGTH(@DirName) = 0) THEN @LeafName WHEN (DATALENGTH(@LeafName) = 0) THEN @DirName ELSE @DirName + N'/' + @LeafName END
    IF (@cbOld IS NOT NULL) AND (@CreateVersion = 1)
        BEGIN
            EXEC proc_CreateDocVersion @SiteId,
                @DirName,
                @LeafName,
                @ListID,
                @ItemId,
                @NewLevel
            SET @cbDelta = @cbDelta + @cbOld + @cbOldMetaInfo
        END
        DELETE FROM
            Docs
        WHERE
            Docs.SiteId = @SiteId AND
            Docs.DirName = @DirName AND
            Docs.LeafName = @LeafName AND 
            Docs.Level >= @NewLevel AND
            Docs.Level < @Level
        DELETE FROM
            DocStreams
        WHERE
            DocStreams.SiteId = @SiteId AND
            DocStreams.ParentId = @DocParentId AND
            DocStreams.Id = @DocId AND 
            DocStreams.Level >= @NewLevel AND
            DocStreams.Level < @Level
        DELETE FROM
            Links
        WHERE
            SiteId = @SiteId AND
            DirName = @DirName AND
            LeafName = @LeafName AND
            Level >= @Newlevel AND
            Level <@Level
        DELETE FROM 
            Deps
        WHERE 
            SiteId = @SiteId AND
            DeleteTransactionId = 0x AND
            FullUrl = @FullUrl AND
            Level >= @NewLevel AND
            Level < @Level
        IF (@ListId IS NOT NULL) AND (@ItemId IS NOT NULL)
        BEGIN
            DELETE FROM
                UserData
            WHERE
                tp_ListId = @ListId AND
                tp_Id = @ItemId AND
                tp_Level >= @Newlevel AND
                tp_Level < @Level
            DELETE NVP FROM
                NameValuePair AS NVP
            WHERE
                SiteId = @SiteId AND
                ListId = @ListId AND
                ItemId = @ItemId AND
                Level >= @Newlevel AND
                Level < @Level
            EXEC proc_GetCollation @ListId, @Collation OUTPUT
    IF @Collation = 0
    BEGIN
        DELETE NVP FROM
            NameValuePair_Albanian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 1
    BEGIN
        DELETE NVP FROM
            NameValuePair_Arabic_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 2
    BEGIN
        DELETE NVP FROM
            NameValuePair_Chinese_PRC_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 3
    BEGIN
        DELETE NVP FROM
            NameValuePair_Chinese_PRC_Stroke_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 4
    BEGIN
        DELETE NVP FROM
            NameValuePair_Chinese_Taiwan_Bopomofo_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 5
    BEGIN
        DELETE NVP FROM
            NameValuePair_Chinese_Taiwan_Stroke_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 6
    BEGIN
        DELETE NVP FROM
            NameValuePair_Croatian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 7
    BEGIN
        DELETE NVP FROM
            NameValuePair_Cyrillic_General_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 8
    BEGIN
        DELETE NVP FROM
            NameValuePair_Czech_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 9
    BEGIN
        DELETE NVP FROM
            NameValuePair_Danish_Norwegian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 10
    BEGIN
        DELETE NVP FROM
            NameValuePair_Estonian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 11
    BEGIN
        DELETE NVP FROM
            NameValuePair_Finnish_Swedish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 12
    BEGIN
        DELETE NVP FROM
            NameValuePair_French_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 13
    BEGIN
        DELETE NVP FROM
            NameValuePair_Georgian_Modern_Sort_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 14
    BEGIN
        DELETE NVP FROM
            NameValuePair_German_PhoneBook_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 15
    BEGIN
        DELETE NVP FROM
            NameValuePair_Greek_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 16
    BEGIN
        DELETE NVP FROM
            NameValuePair_Hebrew_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 17
    BEGIN
        DELETE NVP FROM
            NameValuePair_Hindi_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 18
    BEGIN
        DELETE NVP FROM
            NameValuePair_Hungarian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 19
    BEGIN
        DELETE NVP FROM
            NameValuePair_Hungarian_Technical_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 20
    BEGIN
        DELETE NVP FROM
            NameValuePair_Icelandic_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 21
    BEGIN
        DELETE NVP FROM
            NameValuePair_Japanese_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 22
    BEGIN
        DELETE NVP FROM
            NameValuePair_Japanese_Unicode_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 23
    BEGIN
        DELETE NVP FROM
            NameValuePair_Korean_Wansung_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 24
    BEGIN
        DELETE NVP FROM
            NameValuePair_Korean_Wansung_Unicode_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 25
    BEGIN
        DELETE NVP FROM
            NameValuePair_Latin1_General_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 26
    BEGIN
        DELETE NVP FROM
            NameValuePair_Latvian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 27
    BEGIN
        DELETE NVP FROM
            NameValuePair_Lithuanian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 28
    BEGIN
        DELETE NVP FROM
            NameValuePair_Lithuanian_Classic_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 29
    BEGIN
        DELETE NVP FROM
            NameValuePair_Traditional_Spanish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 30
    BEGIN
        DELETE NVP FROM
            NameValuePair_Modern_Spanish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 31
    BEGIN
        DELETE NVP FROM
            NameValuePair_Polish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 32
    BEGIN
        DELETE NVP FROM
            NameValuePair_Romanian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 33
    BEGIN
        DELETE NVP FROM
            NameValuePair_Slovak_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 34
    BEGIN
        DELETE NVP FROM
            NameValuePair_Slovenian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 35
    BEGIN
        DELETE NVP FROM
            NameValuePair_Thai_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 36
    BEGIN
        DELETE NVP FROM
            NameValuePair_Turkish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 37
    BEGIN
        DELETE NVP FROM
            NameValuePair_Ukrainian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
    ELSE
    IF @Collation = 38
    BEGIN
        DELETE NVP FROM
            NameValuePair_Vietnamese_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level >= @Newlevel AND Level < @Level
    END
        END
    UPDATE     
        Deps
    SET
        Level =  @NewLevel
    WHERE
        SiteId = @SiteId AND
        DeleteTransactionId = 0x AND
        FullUrl = @FullUrl AND
        Level = @Level
    UPDATE     
        Docs
    SET
        Level =  @NewLevel,               
        DraftOwnerId =
        CASE
            WHEN @NewLevel = 1 THEN
            NULL                
            ELSE DraftOwnerId 
        END,
        UIVersion =                         
        CASE            
            WHEN @NewLevel = 1 AND @EnableMinorVersions = 1 
            THEN
            (UIVersion/512+1)*512        
            ELSE UIVersion  
        END
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @DirName AND
        Docs.LeafName = @LeafName AND
        Docs.Level = @Level
    UPDATE     
        DocStreams
    SET
        Level =  @NewLevel
    WHERE
        DocStreams.SiteId = @SiteId AND
        DocStreams.ParentId = @DocParentId AND
        DocStreams.Id = @DocId AND
        DocStreams.Level = @Level
    UPDATE     
        Links
    SET
        Level =  @NewLevel
    WHERE
        SiteId = @SiteId AND
        DirName = @DirName AND
        LeafName = @LeafName AND 
        Level = @Level                   
    IF (@ListId IS NOT NULL) AND (@ItemId IS NOT NULL)
    BEGIN
        UPDATE
            NVP
        SET
            Level = @NewLevel
        FROM
            NameValuePair AS NVP
        WHERE
            SiteId = @SiteId AND
            ListId = @ListId AND
            ItemId = @ItemId AND
            Level = @Level
        EXEC proc_GetCollation @ListId, @Collation OUTPUT
    IF @Collation = 0
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Albanian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 1
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Arabic_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 2
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Chinese_PRC_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 3
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Chinese_PRC_Stroke_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 4
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Chinese_Taiwan_Bopomofo_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 5
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Chinese_Taiwan_Stroke_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 6
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Croatian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 7
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Cyrillic_General_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 8
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Czech_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 9
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Danish_Norwegian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 10
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Estonian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 11
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Finnish_Swedish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 12
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_French_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 13
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Georgian_Modern_Sort_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 14
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_German_PhoneBook_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 15
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Greek_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 16
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Hebrew_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 17
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Hindi_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 18
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Hungarian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 19
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Hungarian_Technical_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 20
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Icelandic_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 21
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Japanese_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 22
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Japanese_Unicode_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 23
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Korean_Wansung_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 24
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Korean_Wansung_Unicode_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 25
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Latin1_General_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 26
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Latvian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 27
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Lithuanian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 28
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Lithuanian_Classic_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 29
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Traditional_Spanish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 30
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Modern_Spanish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 31
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Polish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 32
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Romanian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 33
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Slovak_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 34
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Slovenian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 35
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Thai_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 36
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Turkish_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 37
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Ukrainian_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
    ELSE
    IF @Collation = 38
    BEGIN
        UPDATE NVP SET Level = @NewLevel FROM
            NameValuePair_Vietnamese_CI_AS AS NVP
        WHERE SiteId = @SiteId AND ListId = @ListId AND ItemId = @ItemId AND Level = @Level
    END
        IF @NewLevel = 1 AND @EnableMinorVersions = 1
        BEGIN
            UPDATE
                NameValuePair
            SET
                Value = (CAST(Value AS int)/512+1)*512
            WHERE
                SiteId = @SiteId AND
                FieldId = '{7841bf41-43d0-4434-9f50-a673baef7631}' AND 
                ListId = @ListId AND
                ItemId = @ItemId AND
                Level = @NewLevel
        END
        UPDATE
            UserData
        SET
            tp_Level = @NewLevel,           
            tp_DraftOwnerId =
            CASE
                WHEN @NewLevel = 1 THEN
                NULL                
                ELSE tp_DraftOwnerId 
            END,
            tp_UIVersion =                  
            CASE            
                WHEN @NewLevel = 1 AND @EnableMinorVersions = 1 
                THEN
                (tp_UIVersion/512+1)*512        
                ELSE tp_UIVersion  
            END,
            tp_ModerationStatus = 
            CASE
                WHEN @NewLevel = 1 THEN
                0             
                ELSE tp_ModerationStatus
            END        
        WHERE
            tp_ListId = @ListId AND
            tp_Id = @ItemId AND
            tp_Level = @Level      
    END 
    EXEC proc_ApproveCheckinForWebPart @SiteID,
                @DocId,
                @Level,
                @NewLevel,
                0 
    EXEC proc_ChangeJunctionLevel
        @SiteId,
        @DirName,
        @LeafName,
        @Level,
        @NewLevel
    SET @Level = @NewLevel
    EXEC proc_UpdateDiskUsed @SiteId
    EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp
            @SiteId, @cbDelta, 1
    RETURN 0

GO
