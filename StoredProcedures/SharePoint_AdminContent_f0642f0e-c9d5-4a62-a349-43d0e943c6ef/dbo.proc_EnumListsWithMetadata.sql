/****** Object:  StoredProcedure [dbo].[proc_EnumListsWithMetadata]    Script Date: 5/15/2018 12:12:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_EnumListsWithMetadata(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @WebsFilter int,
    @ListsFilter int,
    @BaseType int,
    @ServerTemplate int,
    @IncludeHidden bit,
    @FieldId uniqueidentifier,
    @FieldValue nvarchar(255),
    @FieldType int,
    @PrefetchListScopes bit,
    @MaxLists int,
    @NumLists int,
    @ListIds image)
AS
    SET NOCOUNT ON
    DECLARE @ListIdTable TABLE
    (
        tp_ListId uniqueidentifier, 
        tp_HasFGP bit,
        tp_HasInternalFGP bit,
        tp_ScopeId uniqueidentifier,
        tp_RootFolder uniqueidentifier,
        tp_WebId uniqueidentifier,
        tp_WebFullUrl nvarchar(280),
        tp_WebTitle nvarchar(255),
        tp_WebTemplate int,
        tp_WebLanguage int,
        tp_WebCollation smallint,
        tp_CachedSchema bigint
    )
    DECLARE @WebScopeId uniqueidentifier
    DECLARE @ParentWebId uniqueidentifier
    DECLARE @WebUrlLike nvarchar(1024)
    SELECT
        @WebScopeId = ScopeId,
        @ParentWebId = ParentWebId,
        @WebUrlLike =
            CASE
                WHEN @WebsFilter = 1 AND 
                     ParentWebId IS NOT NULL
                THEN dbo.fn_EscapeForLike(FullUrl, 1)
                ELSE NULL
            END
    FROM
        Webs
    WHERE
        Id = @WebId
    IF @ListsFilter = 2
    BEGIN
        DECLARE @InputLists TABLE
        (
            tp_ID uniqueidentifier
        )
        DECLARE @iListIter int
        SET @iListIter = 0
        WHILE (@iListIter < @NumLists)
        BEGIN
            INSERT INTO @InputLists
            VALUES
                (CAST(SUBSTRING(@ListIds, @iListIter*16 + 1, 16)
                    AS uniqueidentifier))
            SET @iListIter = @iListIter + 1
        END
        INSERT INTO @ListIdTable
            SELECT DISTINCT
                Lists.tp_ID,
                Lists.tp_HasFGP,
                Lists.tp_HasInternalFGP,
                Lists.tp_ScopeId,
                Lists.tp_RootFolder,
                Lists.tp_WebId,
                Webs.FullUrl,
                Webs.Title,
                Webs.WebTemplate,
                Webs.Language,
                Webs.Collation,
                (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200)
            FROM
                @InputLists AS InputLists
            INNER JOIN
                Lists
            ON
                Lists.tp_ID = InputLists.tp_ID
            INNER JOIN
                Webs
            ON
                Lists.tp_WebId = Webs.[Id]
            WHERE
                Webs.SiteId = @SiteId AND
                ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND
                (@WebsFilter = 2 OR
                 Lists.tp_WebId = @WebId OR
                 (@WebsFilter = 1 AND
                  (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE IF @ListsFilter = 1
    BEGIN
        IF @FieldType = 1 OR @FieldType = 5  
        BEGIN
            DECLARE @Collation smallint
            SELECT
                @Collation = Collation
            FROM
                Webs
            WHERE
                Id = @WebId
    IF @Collation = 0
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Albanian_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 1
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Arabic_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 2
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Chinese_PRC_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 3
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Chinese_PRC_Stroke_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 4
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Chinese_Taiwan_Bopomofo_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 5
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Chinese_Taiwan_Stroke_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 6
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Croatian_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 7
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Cyrillic_General_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 8
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Czech_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 9
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Danish_Norwegian_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 10
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Estonian_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 11
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Finnish_Swedish_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 12
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_French_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 13
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Georgian_Modern_Sort_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 14
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_German_PhoneBook_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 15
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Greek_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 16
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Hebrew_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 17
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Hindi_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 18
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Hungarian_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 19
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Hungarian_Technical_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 20
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Icelandic_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 21
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Japanese_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 22
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Japanese_Unicode_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 23
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Korean_Wansung_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 24
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Korean_Wansung_Unicode_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 25
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Latin1_General_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 26
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Latvian_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 27
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Lithuanian_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 28
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Lithuanian_Classic_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 29
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Traditional_Spanish_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 30
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Modern_Spanish_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 31
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Polish_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 32
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Romanian_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 33
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Slovak_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 34
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Slovenian_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 35
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Thai_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 36
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Turkish_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 37
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Ukrainian_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    ELSE
    IF @Collation = 38
    BEGIN
        INSERT INTO @ListIdTable SELECT DISTINCT Lists.tp_ID, Lists.tp_HasFGP, Lists.tp_HasInternalFGP, Lists.tp_ScopeId, Lists.tp_RootFolder, Lists.tp_WebId , Webs.FullUrl , Webs.Title , Webs.WebTemplate , Webs.Language , Webs.Collation , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200) FROM
            NameValuePair_Vietnamese_CI_AS AS NVP
        WITH(INDEX(2)) INNER JOIN Webs ON Nvp.WebId = Webs.[Id] INNER JOIN Lists ON Nvp.ListId = Lists.tp_ID WHERE Nvp.SiteId = @SiteId AND (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND (@ServerTemplate = -1 OR Lists.tp_ServerTemplate = @ServerTemplate) AND ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND (@WebsFilter = 2 OR Lists.tp_WebId = @WebId OR (@WebsFilter = 1 AND (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
        END
        ELSE
        BEGIN
            INSERT INTO @ListIdTable
                SELECT DISTINCT
                    Lists.tp_ID,
                    Lists.tp_HasFGP,
                    Lists.tp_HasInternalFGP,
                    Lists.tp_ScopeId,
                    Lists.tp_RootFolder,
                    Lists.tp_WebId,
                    Webs.FullUrl,
                    Webs.Title,
                    Webs.WebTemplate,
                    Webs.Language,
                    Webs.Collation,
                    (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200)
                FROM
                    NameValuePair AS Nvp WITH(INDEX(2))
                INNER JOIN
                Webs
                ON
                    Nvp.WebId = Webs.[Id]
                INNER JOIN
                    Lists
                ON
                    Nvp.ListId = Lists.tp_ID
                WHERE
                    Nvp.SiteId = @SiteId AND
                    (@FieldId IS NULL OR Nvp.FieldId = @FieldId) AND
                    (@FieldValue IS NULL OR Nvp.Value = @FieldValue) AND
                    (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND
                    (@ServerTemplate = -1 OR
                     Lists.tp_ServerTemplate = @ServerTemplate) AND
                    ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND
                    (@WebsFilter = 2 OR
                     Lists.tp_WebId = @WebId OR
                     (@WebsFilter = 1 AND
                      (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
        END
    END
    ELSE
    BEGIN
        INSERT INTO @ListIdTable
            SELECT DISTINCT
                Lists.tp_ID,
                Lists.tp_HasFGP,
                Lists.tp_HasInternalFGP,
                Lists.tp_ScopeId,
                Lists.tp_RootFolder,
                Lists.tp_WebId
                , Webs.FullUrl
                , Webs.Title
                , Webs.WebTemplate
                , Webs.Language
                , Webs.Collation
                , (Lists.tp_Flags & 0x200000000) | (Webs.Flags & 0x200)
            FROM
                Lists
            INNER JOIN
                Webs
            ON
                Lists.tp_WebId = Webs.[Id]
            WHERE
                Webs.SiteId = @SiteId AND
                (@BaseType = -1 OR Lists.tp_BaseType = @BaseType) AND
                (@ServerTemplate = -1 OR
                 Lists.tp_ServerTemplate = @ServerTemplate) AND
                ((@IncludeHidden = 1) OR ((Lists.tp_Flags & 256) = 0)) AND
                (@WebsFilter = 2 OR
                 Lists.tp_WebId = @WebId OR
                 (@WebsFilter = 1 AND
                  (@ParentWebId IS NULL OR Webs.FullUrl LIKE @WebUrlLike)))
    END
    DECLARE @ListsInBatch int
    SET @ListsInBatch = @@ROWCOUNT
    IF (@MaxLists > 0) AND (@ListsInBatch > @MaxLists)
    BEGIN
        SELECT -1
        RETURN 68
    END
    ELSE
    BEGIN
        SELECT @ListsInBatch
    END
    SELECT
        Lists.tp_ID,
        Lists.tp_Title,
        Lists.tp_Modified,
        Lists.tp_Created,
        Lists.tp_LastDeleted,
        Lists.tp_Version,
        Lists.tp_BaseType,
        Lists.tp_FeatureId,
        Lists.tp_ServerTemplate,
        AllDocs1.DirName,        
        AllDocs1.LeafName,
        AllDocs2.DirName,        
        AllDocs2.LeafName,
        Lists.tp_ReadSecurity,
        Lists.tp_WriteSecurity,
        Lists.tp_Description,
        CASE WHEN
            ListManifest.tp_CachedSchema <> 0
        THEN
             NULL
        ELSE
             Lists.tp_Fields
        END,
        Lists.tp_Direction,
        CASE WHEN Lists.tp_ScopeId = @WebScopeId 
             THEN NULL
             ELSE Perms.AnonymousPermMask
        END,
        Lists.tp_Flags,
        Lists.tp_ThumbnailSize,
        Lists.tp_WebImageWidth,
        Lists.tp_WebImageHeight,
        Lists.tp_ImageUrl,
        Lists.tp_ItemCount,
        Lists.tp_Author,
        Lists.tp_HasInternalFGP,
        Lists.tp_ScopeId,
        CASE WHEN Lists.tp_ScopeId = @WebScopeId 
             THEN NULL
             ELSE Perms.Acl
        END,
        Lists.tp_EventSinkAssembly,
        Lists.tp_EventSinkClass,
        Lists.tp_EventSinkData,
        Lists.tp_EmailInsertsFolder,
        Lists.tp_EmailInsertsLastSyncTime,
        Lists.tp_EmailAlias,
        N'/' + ListManifest.tp_WebFullUrl,
        ListManifest.tp_WebId,
        ListManifest.tp_WebTitle,
        ListManifest.tp_WebTemplate,
        ListManifest.tp_WebLanguage,
        ListManifest.tp_WebCollation,
        Lists.tp_SendToLocation,
        ISNULL(Lists.tp_MaxMajorVersionCount, 0),
        ISNULL(Lists.tp_MaxMajorwithMinorVersionCount, 0),
        Lists.tp_MaxRowOrdinal,
        Lists.tp_ListDataDirty,
        Lists.tp_DefaultWorkflowId,
        CASE WHEN
             ListManifest.tp_CachedSchema <> 0
        THEN
             NULL
        ELSE
             Lists.tp_ContentTypes
        END,
        Lists.tp_Subscribed
    FROM
    	@ListIdTable AS ListManifest
    INNER JOIN
    	Lists
    ON
        Lists.tp_ID = ListManifest.tp_ListId AND
        Lists.tp_WebId = ListManifest.tp_WebId
    INNER JOIN
        Perms
    ON
        Perms.SiteId = @SiteId AND
        Perms.ScopeId = Lists.tp_ScopeId
    INNER JOIN
        AllDocs AS AllDocs1
    ON
        AllDocs1.Id = Lists.tp_RootFolder AND
        AllDocs1.Level = 1
    LEFT OUTER JOIN
        AllDocs AS AllDocs2
    ON
        AllDocs2.Id = Lists.tp_Template AND
        AllDocs2.Level = 1
    ORDER BY
        Lists.tp_ID
    IF @@ROWCOUNT = 0
    BEGIN
        RETURN 0
    END
    SELECT
        Id, Name, SiteId, WebId, HostId, HostType, ItemId, DirName, LeafName, Type, SequenceNumber, Assembly, Class, Data, Filter, SourceId, SourceType, Credential, ContextType, ContextEventType, ContextId, ContextObjectId, ContextCollectionId
    FROM
        EventReceivers
    INNER JOIN
        @ListIdTable AS ListManifest
    ON
        WebId = ListManifest.tp_WebId AND
        HostId = ListManifest.tp_ListId
    WHERE
        SiteId = @SiteId AND
        HostType = 2
    ORDER BY
        SiteId, WebId, HostId, Type, HostType, SequenceNumber, Assembly
    IF (@PrefetchListScopes = 1)
    BEGIN
        SELECT
            tp_ListId AS ListId,
            0x0 AS ScopeId,
            NULL AS Acl,
            0 AS AnonymousPermMask
        FROM 
            @ListIdTable AS ListManifest
        WHERE
            tp_HasFGP = 0
        UNION ALL
        SELECT
            ListManifest.tp_ListId AS ListId, 
            Perms.ScopeId AS ScopeId,
            Perms.Acl AS Acl,
            Perms.AnonymousPermMask AS AnonymousPermMask
        FROM 
            @ListIdTable AS ListManifest
        INNER LOOP JOIN
            Perms
        ON
            ListManifest.tp_HasFGP = 1 AND
            Perms.SiteId = @SiteId AND
            Perms.ScopeId = ListManifest.tp_ScopeId
        UNION ALL
        SELECT TOP 1001
            ListManifest.tp_ListId AS ListId, 
            Perms.ScopeId AS ScopeId,
            Perms.Acl AS Acl,
            Perms.AnonymousPermMask AS AnonymousPermMask
        FROM 
            @ListIdTable AS ListManifest
        INNER JOIN 
            AllDocs 
        ON 
            AllDocs.Id = ListManifest.tp_RootFolder AND
            AllDocs.Level = 1
        INNER LOOP JOIN
            Perms
        ON
            ListManifest.tp_HasInternalFGP = 1 AND
            Perms.SiteId = @SiteId AND
            Perms.DelTransId = 0x AND
            Perms.ScopeUrl LIKE dbo.fn_EscapeForLike(CASE WHEN (DATALENGTH(AllDocs.DirName) = 0) THEN AllDocs.LeafName WHEN (DATALENGTH(AllDocs.LeafName) = 0) THEN AllDocs.DirName ELSE AllDocs.DirName + N'/' + AllDocs.LeafName END, 1) COLLATE Latin1_General_CI_AS_KS_WS
        ORDER BY
            ListId
    END

GO
