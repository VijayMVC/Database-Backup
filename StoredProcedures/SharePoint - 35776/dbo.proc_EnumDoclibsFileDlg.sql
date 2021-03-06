/****** Object:  StoredProcedure [dbo].[proc_EnumDoclibsFileDlg]    Script Date: 5/15/2018 12:11:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_EnumDoclibsFileDlg(
    @WebId uniqueidentifier,
    @Collation nvarchar(32),
    @GetTemplate bit,
    @OnlyLibsWithTemplates bit,
    @IncludeSubWebs bit,
    @Scopes image = NULL)
AS
    SET NOCOUNT ON
    DECLARE @strTemplateField nvarchar(1024)
    DECLARE @strTemplateJoin nvarchar(1024)
    DECLARE @strWebTemplateField nvarchar(1024)
    DECLARE @strWebTemplateJoin nvarchar(1024)
    DECLARE @strQuery nvarchar(1024)
    SET @strTemplateField = N''
    SET @strTemplateJoin = N''
    SET @strWebTemplateField = N''
    SET @strQuery = 'DECLARE @_scopeTbl TABLE(_id uniqueidentifier NOT NULL PRIMARY KEY);' +
                    'DECLARE @_count INT;' +
                    'SET @_count = 0;' +
                    'WHILE @_count < DATALENGTH(@Scopes)/16 ' +
                    'BEGIN  ' +
                    '   INSERT INTO @_scopeTbl VALUES (CAST(SUBSTRING(@Scopes ,@_count*16 + 1, 16) AS uniqueidentifier))' +
                    '   SET @_count = @_count + 1 ' +
                    'END '
    IF @GetTemplate = 1
    BEGIN
        IF (@IncludeSubWebs = 0)
        BEGIN
            SET @strTemplateField =
                'CASE WHEN LEN(Docs2.DirName) = 0 THEN N''/'' + Docs2.LeafName ' +
                'ELSE N''/'' + Docs2.DirName + N''/'' + Docs2.LeafName END ' +
                'AS Docs#Template#FullUrl,'
            SET @strTemplateJoin =
                'LEFT OUTER JOIN Docs AS Docs2 ON Docs2.Id=tp_Template AND Docs2.Level=' +
                CONVERT(NVARCHAR, 1) + ' '
        END
        ELSE
        BEGIN
            SET @strTemplateField = ' NULL AS Docs#Template#FullUrl,'
        END
    END
    IF (@IncludeSubWebs = 0)
    BEGIN
        SET @strQuery = @strQuery + 'SELECT ' +
            'CASE WHEN LEN(Docs1.DirName) = 0 THEN N''/'' + Docs1.LeafName ' +
            'ELSE N''/'' + Docs1.DirName + N''/'' + Docs1.LeafName END ' +
            'AS tp_RootFolder,' + @strTemplateField +
            'tp_Title, tp_Description, tp_ImageUrl ' +
            'FROM Lists INNER JOIN Docs AS Docs1 ON Docs1.Id=tp_RootFolder AND Docs1.Level=' +
            CONVERT(NVARCHAR, 1) +' '+
            @strTemplateJoin +
            'WHERE tp_WebId=@WebId AND tp_BaseType=1 AND (tp_Flags & '+ 
            CONVERT(NVARCHAR, 256) +')=0 AND tp_ScopeId IN (SELECT _id FROM @_scopeTbl)'
        IF @OnlyLibsWithTemplates = 1
            SET @strQuery = @strQuery + ' AND tp_Template IS NOT NULL'
        SET @strQuery = @strQuery + ' ORDER BY tp_Title COLLATE ' + @Collation
    END
    ELSE 
    BEGIN
        SET @strQuery = @strQuery + 'SELECT N''/'' + FullUrl as tp_RootFolder,' +  @strTemplateField +
        'Title as tp_Title, Description as tp_Description, 
        CASE WHEN WebTemplate = 2 THEN  N''/_layouts/images/mtgicon.gif''
        ELSE N''/_layouts/images/stsicon.gif''
        END
        as  tp_ImageUrl FROM Webs WHERE ParentWebId=@WebId AND ScopeId IN (SELECT _id FROM @_scopeTbl)'
        SET @strQuery = @strQuery + ' ORDER BY Title COLLATE ' + @Collation
    END
    EXEC sp_executesql @strQuery, N'@WebId uniqueidentifier, @Scopes image', @WebId, @Scopes

GO
