/****** Object:  StoredProcedure [dbo].[proc_EnumListsCoreWithScopes]    Script Date: 5/15/2018 12:11:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_EnumListsCoreWithScopes(
       @SiteId uniqueidentifier,                                                
       @WebId uniqueidentifier,
       @WebFullUrl nvarchar(256),
       @Collation nvarchar(32),
       @BaseType int,
       @BaseType2 int,
       @BaseType3 int,
       @BaseType4 int,
       @ServerTemplate int,
       @FMobileDefaultViewUrl bit,
       @FRootFolder bit,
       @ListFlags int,
       @FAclInfo int,
       @Scopes image)
AS
       SET NOCOUNT ON
DECLARE @_scopeTbl TABLE(_id uniqueidentifier NOT NULL PRIMARY KEY)
DECLARE @_count INT
SET @_count = 0
WHILE @_count < DATALENGTH(@scopes)/16
BEGIN 
    INSERT INTO @_scopeTbl VALUES (CAST(SUBSTRING(@scopes ,@_count*16 + 1, 16) AS uniqueidentifier))
    SET @_count = @_count + 1
END
       IF (@Collation = N'Latin1_General_CI_AS')
       BEGIN 
SELECT
	 CASE WHEN AllDocs1.DirName = N'' THEN
		 N'/' + AllDocs1.LeafName
	 ELSE
		 N'/' + AllDocs1.DirName + N'/' + AllDocs1.LeafName END
	 AS
		 tp_DocTemplateUrl,
	 CASE WHEN AllDocs2.DirName = N'' THEN
		 N'/' + AllDocs2.LeafName
	 ELSE
		 N'/' + AllDocs2.DirName + N'/' + AllDocs2.LeafName END
	 AS
		 tp_DefaultViewUrl,
     CASE WHEN @FMobileDefaultViewUrl = 1 THEN
		 dbo.fn_GetMobileDefaultViewUrl(Lists.tp_ID)
	 ELSE
		 NULL END
	 AS
		 tp_MobileDefaultViewUrl,
	 Lists.tp_ID AS tp_ID,
	 Lists.tp_Title AS tp_Title,
	 Lists.tp_Description AS tp_Description,
	 Lists.tp_ImageUrl AS tp_ImageUrl,
	 N'{' + CAST(Lists.tp_ID AS nvarchar(36)) + N'}' AS tp_Name,
	 Lists.tp_BaseType AS tp_BaseType,
	 Lists.tp_FeatureId AS tp_FeatureId,
	 Lists.tp_ServerTemplate AS tp_ServerTemplate,
	 Lists.tp_Created AS tp_Created,
	 Lists.tp_Modified AS tp_Modified,
	 Lists.tp_LastDeleted AS tp_LastDeleted,
	 Lists.tp_Version AS tp_Version,
	 Lists.tp_Direction AS tp_Direction,
	 Lists.tp_ThumbnailSize AS tp_ThumbnailSize,
	 Lists.tp_WebImageWidth AS tp_WebImageWidth,
	 Lists.tp_WebImageHeight AS tp_WebImageHeight,
	 Lists.tp_Flags AS tp_Flags,
	 Lists.tp_ItemCount AS tp_ItemCount,
	 Perms.AnonymousPermMask AS tp_AnonymousPermMask,
	 CASE WHEN @FRootFolder = 1 THEN
		 dbo.fn_GetRootFolder(Lists.tp_RootFolder)
	 ELSE
		 NULL END
	 AS
		 tp_RootFolder,
	 Lists.tp_ReadSecurity,
	 Lists.tp_WriteSecurity,
	 Lists.tp_Author,
	 Lists.tp_EventSinkAssembly,
	 Lists.tp_EventSinkClass,
	 Lists.tp_EventSinkData,
	 Lists.tp_EmailInsertsFolder,
	 Lists.tp_EmailAlias,
	 @WebFullUrl AS tp_WebFullUrl,
	 @WebId AS tp_WebId,
	 Lists.tp_SendToLocation,
	 Lists.tp_ScopeId,
	 ISNULL(Lists.tp_MaxMajorVersionCount, 0),
	 ISNULL(Lists.tp_MaxMajorwithMinorVersionCount, 0),	  
	 Lists.tp_DefaultWorkflowId,
	 Lists.tp_HasInternalFGP,
	 CASE WHEN @FAclInfo = 1 THEN
		 Perms.Acl
	 ELSE
		 NULL END
	 AS
		 tp_ACL				
FROM
	 Lists INNER JOIN Perms
ON
	 Perms.SiteId = @SiteId AND
	 Lists.tp_ScopeId = Perms.ScopeId
AND Lists.tp_ScopeId IN (SELECT _id from @_scopetbl)
	 LEFT OUTER JOIN WebParts
ON
	 WebParts.tp_ListId = Lists.tp_ID AND
	 WebParts.tp_UserID IS NULL AND
	 WebParts.tp_Type = 0 AND
	 WebParts.tp_Level = 1
	 LEFT OUTER JOIN AllDocs AS AllDocs2
ON
	 AllDocs2.Id = WebParts.tp_PageUrlID AND
	 AllDocs2.Level = WebParts.tp_Level
	 LEFT OUTER JOIN AllDocs AS AllDocs1
ON
	 AllDocs1.Id = Lists.tp_Template AND
	 AllDocs1.Level = 1
WHERE
	 Lists.tp_WebId = @WebId AND
	 (@BaseType = -1
	  OR
	  Lists.tp_BaseType = @BaseType
	  OR
	  Lists.tp_BaseType = @BaseType2
	  OR
	  Lists.tp_BaseType = @BaseType3
	  OR
	  Lists.tp_BaseType = @BaseType4) AND
	 (@ServerTemplate = -1
	  OR
	  Lists.tp_ServerTemplate = @ServerTemplate) AND
	 (@ListFlags = -1
	  OR
	  Lists.tp_Flags & @ListFlags = @ListFlags)
ORDER BY Lists.tp_Title COLLATE  Latin1_General_CI_AS OPTION (FORCE ORDER)
       END
       ELSE IF (@Collation = N'Japanese_CI_AS')
       BEGIN 
SELECT
	 CASE WHEN AllDocs1.DirName = N'' THEN
		 N'/' + AllDocs1.LeafName
	 ELSE
		 N'/' + AllDocs1.DirName + N'/' + AllDocs1.LeafName END
	 AS
		 tp_DocTemplateUrl,
	 CASE WHEN AllDocs2.DirName = N'' THEN
		 N'/' + AllDocs2.LeafName
	 ELSE
		 N'/' + AllDocs2.DirName + N'/' + AllDocs2.LeafName END
	 AS
		 tp_DefaultViewUrl,
     CASE WHEN @FMobileDefaultViewUrl = 1 THEN
		 dbo.fn_GetMobileDefaultViewUrl(Lists.tp_ID)
	 ELSE
		 NULL END
	 AS
		 tp_MobileDefaultViewUrl,
	 Lists.tp_ID AS tp_ID,
	 Lists.tp_Title AS tp_Title,
	 Lists.tp_Description AS tp_Description,
	 Lists.tp_ImageUrl AS tp_ImageUrl,
	 N'{' + CAST(Lists.tp_ID AS nvarchar(36)) + N'}' AS tp_Name,
	 Lists.tp_BaseType AS tp_BaseType,
	 Lists.tp_FeatureId AS tp_FeatureId,
	 Lists.tp_ServerTemplate AS tp_ServerTemplate,
	 Lists.tp_Created AS tp_Created,
	 Lists.tp_Modified AS tp_Modified,
	 Lists.tp_LastDeleted AS tp_LastDeleted,
	 Lists.tp_Version AS tp_Version,
	 Lists.tp_Direction AS tp_Direction,
	 Lists.tp_ThumbnailSize AS tp_ThumbnailSize,
	 Lists.tp_WebImageWidth AS tp_WebImageWidth,
	 Lists.tp_WebImageHeight AS tp_WebImageHeight,
	 Lists.tp_Flags AS tp_Flags,
	 Lists.tp_ItemCount AS tp_ItemCount,
	 Perms.AnonymousPermMask AS tp_AnonymousPermMask,
	 CASE WHEN @FRootFolder = 1 THEN
		 dbo.fn_GetRootFolder(Lists.tp_RootFolder)
	 ELSE
		 NULL END
	 AS
		 tp_RootFolder,
	 Lists.tp_ReadSecurity,
	 Lists.tp_WriteSecurity,
	 Lists.tp_Author,
	 Lists.tp_EventSinkAssembly,
	 Lists.tp_EventSinkClass,
	 Lists.tp_EventSinkData,
	 Lists.tp_EmailInsertsFolder,
	 Lists.tp_EmailAlias,
	 @WebFullUrl AS tp_WebFullUrl,
	 @WebId AS tp_WebId,
	 Lists.tp_SendToLocation,
	 Lists.tp_ScopeId,
	 ISNULL(Lists.tp_MaxMajorVersionCount, 0),
	 ISNULL(Lists.tp_MaxMajorwithMinorVersionCount, 0),	  
	 Lists.tp_DefaultWorkflowId,
	 Lists.tp_HasInternalFGP,
	 CASE WHEN @FAclInfo = 1 THEN
		 Perms.Acl
	 ELSE
		 NULL END
	 AS
		 tp_ACL				
FROM
	 Lists INNER JOIN Perms
ON
	 Perms.SiteId = @SiteId AND
	 Lists.tp_ScopeId = Perms.ScopeId
AND Lists.tp_ScopeId IN (SELECT _id from @_scopetbl)
	 LEFT OUTER JOIN WebParts
ON
	 WebParts.tp_ListId = Lists.tp_ID AND
	 WebParts.tp_UserID IS NULL AND
	 WebParts.tp_Type = 0 AND
	 WebParts.tp_Level = 1
	 LEFT OUTER JOIN AllDocs AS AllDocs2
ON
	 AllDocs2.Id = WebParts.tp_PageUrlID AND
	 AllDocs2.Level = WebParts.tp_Level
	 LEFT OUTER JOIN AllDocs AS AllDocs1
ON
	 AllDocs1.Id = Lists.tp_Template AND
	 AllDocs1.Level = 1
WHERE
	 Lists.tp_WebId = @WebId AND
	 (@BaseType = -1
	  OR
	  Lists.tp_BaseType = @BaseType
	  OR
	  Lists.tp_BaseType = @BaseType2
	  OR
	  Lists.tp_BaseType = @BaseType3
	  OR
	  Lists.tp_BaseType = @BaseType4) AND
	 (@ServerTemplate = -1
	  OR
	  Lists.tp_ServerTemplate = @ServerTemplate) AND
	 (@ListFlags = -1
	  OR
	  Lists.tp_Flags & @ListFlags = @ListFlags)
ORDER BY Lists.tp_Title COLLATE  Japanese_CI_AS OPTION (FORCE ORDER)
       END
       ELSE IF (@Collation = N'Modern_Spanish_CI_AS')
       BEGIN 
SELECT
	 CASE WHEN AllDocs1.DirName = N'' THEN
		 N'/' + AllDocs1.LeafName
	 ELSE
		 N'/' + AllDocs1.DirName + N'/' + AllDocs1.LeafName END
	 AS
		 tp_DocTemplateUrl,
	 CASE WHEN AllDocs2.DirName = N'' THEN
		 N'/' + AllDocs2.LeafName
	 ELSE
		 N'/' + AllDocs2.DirName + N'/' + AllDocs2.LeafName END
	 AS
		 tp_DefaultViewUrl,
     CASE WHEN @FMobileDefaultViewUrl = 1 THEN
		 dbo.fn_GetMobileDefaultViewUrl(Lists.tp_ID)
	 ELSE
		 NULL END
	 AS
		 tp_MobileDefaultViewUrl,
	 Lists.tp_ID AS tp_ID,
	 Lists.tp_Title AS tp_Title,
	 Lists.tp_Description AS tp_Description,
	 Lists.tp_ImageUrl AS tp_ImageUrl,
	 N'{' + CAST(Lists.tp_ID AS nvarchar(36)) + N'}' AS tp_Name,
	 Lists.tp_BaseType AS tp_BaseType,
	 Lists.tp_FeatureId AS tp_FeatureId,
	 Lists.tp_ServerTemplate AS tp_ServerTemplate,
	 Lists.tp_Created AS tp_Created,
	 Lists.tp_Modified AS tp_Modified,
	 Lists.tp_LastDeleted AS tp_LastDeleted,
	 Lists.tp_Version AS tp_Version,
	 Lists.tp_Direction AS tp_Direction,
	 Lists.tp_ThumbnailSize AS tp_ThumbnailSize,
	 Lists.tp_WebImageWidth AS tp_WebImageWidth,
	 Lists.tp_WebImageHeight AS tp_WebImageHeight,
	 Lists.tp_Flags AS tp_Flags,
	 Lists.tp_ItemCount AS tp_ItemCount,
	 Perms.AnonymousPermMask AS tp_AnonymousPermMask,
	 CASE WHEN @FRootFolder = 1 THEN
		 dbo.fn_GetRootFolder(Lists.tp_RootFolder)
	 ELSE
		 NULL END
	 AS
		 tp_RootFolder,
	 Lists.tp_ReadSecurity,
	 Lists.tp_WriteSecurity,
	 Lists.tp_Author,
	 Lists.tp_EventSinkAssembly,
	 Lists.tp_EventSinkClass,
	 Lists.tp_EventSinkData,
	 Lists.tp_EmailInsertsFolder,
	 Lists.tp_EmailAlias,
	 @WebFullUrl AS tp_WebFullUrl,
	 @WebId AS tp_WebId,
	 Lists.tp_SendToLocation,
	 Lists.tp_ScopeId,
	 ISNULL(Lists.tp_MaxMajorVersionCount, 0),
	 ISNULL(Lists.tp_MaxMajorwithMinorVersionCount, 0),	  
	 Lists.tp_DefaultWorkflowId,
	 Lists.tp_HasInternalFGP,
	 CASE WHEN @FAclInfo = 1 THEN
		 Perms.Acl
	 ELSE
		 NULL END
	 AS
		 tp_ACL				
FROM
	 Lists INNER JOIN Perms
ON
	 Perms.SiteId = @SiteId AND
	 Lists.tp_ScopeId = Perms.ScopeId
AND Lists.tp_ScopeId IN (SELECT _id from @_scopetbl)
	 LEFT OUTER JOIN WebParts
ON
	 WebParts.tp_ListId = Lists.tp_ID AND
	 WebParts.tp_UserID IS NULL AND
	 WebParts.tp_Type = 0 AND
	 WebParts.tp_Level = 1
	 LEFT OUTER JOIN AllDocs AS AllDocs2
ON
	 AllDocs2.Id = WebParts.tp_PageUrlID AND
	 AllDocs2.Level = WebParts.tp_Level
	 LEFT OUTER JOIN AllDocs AS AllDocs1
ON
	 AllDocs1.Id = Lists.tp_Template AND
	 AllDocs1.Level = 1
WHERE
	 Lists.tp_WebId = @WebId AND
	 (@BaseType = -1
	  OR
	  Lists.tp_BaseType = @BaseType
	  OR
	  Lists.tp_BaseType = @BaseType2
	  OR
	  Lists.tp_BaseType = @BaseType3
	  OR
	  Lists.tp_BaseType = @BaseType4) AND
	 (@ServerTemplate = -1
	  OR
	  Lists.tp_ServerTemplate = @ServerTemplate) AND
	 (@ListFlags = -1
	  OR
	  Lists.tp_Flags & @ListFlags = @ListFlags)
ORDER BY Lists.tp_Title COLLATE  Modern_Spanish_CI_AS OPTION (FORCE ORDER)
       END
       ELSE IF (@Collation = N'French_CI_AS')
       BEGIN 
SELECT
	 CASE WHEN AllDocs1.DirName = N'' THEN
		 N'/' + AllDocs1.LeafName
	 ELSE
		 N'/' + AllDocs1.DirName + N'/' + AllDocs1.LeafName END
	 AS
		 tp_DocTemplateUrl,
	 CASE WHEN AllDocs2.DirName = N'' THEN
		 N'/' + AllDocs2.LeafName
	 ELSE
		 N'/' + AllDocs2.DirName + N'/' + AllDocs2.LeafName END
	 AS
		 tp_DefaultViewUrl,
     CASE WHEN @FMobileDefaultViewUrl = 1 THEN
		 dbo.fn_GetMobileDefaultViewUrl(Lists.tp_ID)
	 ELSE
		 NULL END
	 AS
		 tp_MobileDefaultViewUrl,
	 Lists.tp_ID AS tp_ID,
	 Lists.tp_Title AS tp_Title,
	 Lists.tp_Description AS tp_Description,
	 Lists.tp_ImageUrl AS tp_ImageUrl,
	 N'{' + CAST(Lists.tp_ID AS nvarchar(36)) + N'}' AS tp_Name,
	 Lists.tp_BaseType AS tp_BaseType,
	 Lists.tp_FeatureId AS tp_FeatureId,
	 Lists.tp_ServerTemplate AS tp_ServerTemplate,
	 Lists.tp_Created AS tp_Created,
	 Lists.tp_Modified AS tp_Modified,
	 Lists.tp_LastDeleted AS tp_LastDeleted,
	 Lists.tp_Version AS tp_Version,
	 Lists.tp_Direction AS tp_Direction,
	 Lists.tp_ThumbnailSize AS tp_ThumbnailSize,
	 Lists.tp_WebImageWidth AS tp_WebImageWidth,
	 Lists.tp_WebImageHeight AS tp_WebImageHeight,
	 Lists.tp_Flags AS tp_Flags,
	 Lists.tp_ItemCount AS tp_ItemCount,
	 Perms.AnonymousPermMask AS tp_AnonymousPermMask,
	 CASE WHEN @FRootFolder = 1 THEN
		 dbo.fn_GetRootFolder(Lists.tp_RootFolder)
	 ELSE
		 NULL END
	 AS
		 tp_RootFolder,
	 Lists.tp_ReadSecurity,
	 Lists.tp_WriteSecurity,
	 Lists.tp_Author,
	 Lists.tp_EventSinkAssembly,
	 Lists.tp_EventSinkClass,
	 Lists.tp_EventSinkData,
	 Lists.tp_EmailInsertsFolder,
	 Lists.tp_EmailAlias,
	 @WebFullUrl AS tp_WebFullUrl,
	 @WebId AS tp_WebId,
	 Lists.tp_SendToLocation,
	 Lists.tp_ScopeId,
	 ISNULL(Lists.tp_MaxMajorVersionCount, 0),
	 ISNULL(Lists.tp_MaxMajorwithMinorVersionCount, 0),	  
	 Lists.tp_DefaultWorkflowId,
	 Lists.tp_HasInternalFGP,
	 CASE WHEN @FAclInfo = 1 THEN
		 Perms.Acl
	 ELSE
		 NULL END
	 AS
		 tp_ACL				
FROM
	 Lists INNER JOIN Perms
ON
	 Perms.SiteId = @SiteId AND
	 Lists.tp_ScopeId = Perms.ScopeId
AND Lists.tp_ScopeId IN (SELECT _id from @_scopetbl)
	 LEFT OUTER JOIN WebParts
ON
	 WebParts.tp_ListId = Lists.tp_ID AND
	 WebParts.tp_UserID IS NULL AND
	 WebParts.tp_Type = 0 AND
	 WebParts.tp_Level = 1
	 LEFT OUTER JOIN AllDocs AS AllDocs2
ON
	 AllDocs2.Id = WebParts.tp_PageUrlID AND
	 AllDocs2.Level = WebParts.tp_Level
	 LEFT OUTER JOIN AllDocs AS AllDocs1
ON
	 AllDocs1.Id = Lists.tp_Template AND
	 AllDocs1.Level = 1
WHERE
	 Lists.tp_WebId = @WebId AND
	 (@BaseType = -1
	  OR
	  Lists.tp_BaseType = @BaseType
	  OR
	  Lists.tp_BaseType = @BaseType2
	  OR
	  Lists.tp_BaseType = @BaseType3
	  OR
	  Lists.tp_BaseType = @BaseType4) AND
	 (@ServerTemplate = -1
	  OR
	  Lists.tp_ServerTemplate = @ServerTemplate) AND
	 (@ListFlags = -1
	  OR
	  Lists.tp_Flags & @ListFlags = @ListFlags)
ORDER BY Lists.tp_Title COLLATE  French_CI_AS OPTION (FORCE ORDER)
       END 
		ELSE
		BEGIN
		DECLARE @strQuery nvarchar(4000)
		DECLARE @param1 nvarchar(40)
       SET @param1 = CASE WHEN @WebId IS NULL THEN N'NULL' ELSE N'''' + CAST(@WebId AS nvarchar(40)) + N'''' END
		DECLARE @param2 nvarchar(40)
       SET @param2 = CASE WHEN @BaseType IS NULL THEN N'NULL' ELSE CAST(@BaseType AS nvarchar(40)) END
		DECLARE @param3 nvarchar(40)
       SET @param3 = CASE WHEN @BaseType2 IS NULL THEN N'NULL' ELSE CAST(@BaseType2 AS nvarchar(40)) END
		DECLARE @param4 nvarchar(40)
       SET @param4 = CASE WHEN @BaseType3 IS NULL THEN N'NULL' ELSE CAST(@BaseType3 AS nvarchar(40)) END
		DECLARE @param5 nvarchar(40)
       SET @param5 = CASE WHEN @BaseType4 IS NULL THEN N'NULL' ELSE CAST(@BaseType4 AS nvarchar(40)) END
		DECLARE @param6 nvarchar(40)
       SET @param6 = CASE WHEN @ServerTemplate IS NULL THEN N'NULL' ELSE CAST(@ServerTemplate AS nvarchar(40)) END
		DECLARE @param7 nvarchar(40)
       SET @param7 = CASE WHEN @FMobileDefaultViewUrl IS NULL THEN N'NULL' ELSE CAST(@FMobileDefaultViewUrl AS nvarchar(40)) END
		DECLARE @param8 nvarchar(40)
       SET @param8 = CASE WHEN @FRootFolder IS NULL THEN N'NULL' ELSE CAST(@FRootFolder AS nvarchar(40)) END
		DECLARE @param9 nvarchar(40)
       SET @param9 = CASE WHEN @ListFlags IS NULL THEN N'NULL' ELSE CAST(@ListFlags AS nvarchar(40)) END
		DECLARE @param10 nvarchar(40)
       SET @param10 = CASE WHEN @FAclInfo IS NULL THEN N'NULL' ELSE CAST(@FAclInfo AS nvarchar(40)) END
		DECLARE @param11 nvarchar(256)
       SET @param11 = CASE WHEN @WebFullUrl IS NULL THEN N'NULL' ELSE N'N''' + REPLACE(CAST(@WebFullUrl AS nvarchar(256)), N'''', N'''''') + N'''' END
		DECLARE @param12 nvarchar(40)
       SET @param12 = CASE WHEN @SiteId IS NULL THEN N'NULL' ELSE N'''' + CAST(@SiteId AS nvarchar(40)) + N'''' END
	   SET @strQuery = N'
DECLARE @WebId uniqueidentifier
DECLARE @BaseType int
DECLARE @BaseType2 int
DECLARE @BaseType3 int
DECLARE @BaseType4 int
DECLARE @ServerTemplate int
DECLARE @FmobileDefaultViewUrl bit
DECLARE @FRootFolder bit
DECLARE @ListFlags int
DECLARE @FAclInfo bit
DECLARE @WebFullUrl nvarchar(256)
DECLARE @SiteId uniqueidentifier
DECLARE @_scopeTbl TABLE(_id uniqueidentifier NOT NULL PRIMARY KEY)
DECLARE @_count INT
SET @_count = 0
WHILE @_count < DATALENGTH(@scopes)/16
BEGIN 
    INSERT INTO @_scopeTbl VALUES (CAST(SUBSTRING(@scopes ,@_count*16 + 1, 16) AS uniqueidentifier))
    SET @_count = @_count + 1
END
SET @WebId=' + @param1 + N'
SET @BaseType=' + @param2 + N'
SET @BaseType2=' + @param3 + N'
SET @BaseType3=' + @param4 + N'
SET @BaseType4=' + @param5 + N'
SET @ServerTemplate=' + @param6 + N'
SET @FMobileDefaultViewUrl=' + @param7 + N'
SET @FRootFolder=' + @param8 + N'
SET @ListFlags=' + @param9 + N'
SET @FAclInfo=' + @param10 + N'
SET @WebFullUrl=' + @param11 + N'
SET @SiteId=' + @param12 + N'
SELECT
	 CASE WHEN AllDocs1.DirName = N'''' THEN
		 N''/'' + AllDocs1.LeafName
	 ELSE
		 N''/'' + AllDocs1.DirName + N''/'' + AllDocs1.LeafName END
	 AS
		 tp_DocTemplateUrl,
	 CASE WHEN AllDocs2.DirName = N'''' THEN
		 N''/'' + AllDocs2.LeafName
	 ELSE
		 N''/'' + AllDocs2.DirName + N''/'' + AllDocs2.LeafName END
	 AS
		 tp_DefaultViewUrl,
     CASE WHEN @FMobileDefaultViewUrl = 1 THEN
		 dbo.fn_GetMobileDefaultViewUrl(Lists.tp_ID)
	 ELSE
		 NULL END
	 AS
		 tp_MobileDefaultViewUrl,
	 Lists.tp_ID AS tp_ID,
	 Lists.tp_Title AS tp_Title,
	 Lists.tp_Description AS tp_Description,
	 Lists.tp_ImageUrl AS tp_ImageUrl,
	 N''{'' + CAST(Lists.tp_ID AS nvarchar(36)) + N''}'' AS tp_Name,
	 Lists.tp_BaseType AS tp_BaseType,
	 Lists.tp_FeatureId AS tp_FeatureId,
	 Lists.tp_ServerTemplate AS tp_ServerTemplate,
	 Lists.tp_Created AS tp_Created,
	 Lists.tp_Modified AS tp_Modified,
	 Lists.tp_LastDeleted AS tp_LastDeleted,
	 Lists.tp_Version AS tp_Version,
	 Lists.tp_Direction AS tp_Direction,
	 Lists.tp_ThumbnailSize AS tp_ThumbnailSize,
	 Lists.tp_WebImageWidth AS tp_WebImageWidth,
	 Lists.tp_WebImageHeight AS tp_WebImageHeight,
	 Lists.tp_Flags AS tp_Flags,
	 Lists.tp_ItemCount AS tp_ItemCount,
	 Perms.AnonymousPermMask AS tp_AnonymousPermMask,
	 CASE WHEN @FRootFolder = 1 THEN
		 dbo.fn_GetRootFolder(Lists.tp_RootFolder)
	 ELSE
		 NULL END
	 AS
		 tp_RootFolder,
	 Lists.tp_ReadSecurity,
	 Lists.tp_WriteSecurity,
	 Lists.tp_Author,
	 Lists.tp_EventSinkAssembly,
	 Lists.tp_EventSinkClass,
	 Lists.tp_EventSinkData,
	 Lists.tp_EmailInsertsFolder,
	 Lists.tp_EmailAlias,
	 @WebFullUrl AS tp_WebFullUrl,
	 @WebId AS tp_WebId,
	 Lists.tp_SendToLocation,
	 Lists.tp_ScopeId,
	 ISNULL(Lists.tp_MaxMajorVersionCount, 0),
	 ISNULL(Lists.tp_MaxMajorwithMinorVersionCount, 0),	  
	 Lists.tp_DefaultWorkflowId,
	 Lists.tp_HasInternalFGP,
	 CASE WHEN @FAclInfo = 1 THEN
		 Perms.Acl
	 ELSE
		 NULL END
	 AS
		 tp_ACL				
FROM
	 Lists INNER JOIN Perms
ON
	 Perms.SiteId = @SiteId AND
	 Lists.tp_ScopeId = Perms.ScopeId
AND Lists.tp_ScopeId IN (SELECT _id from @_scopetbl)
	 LEFT OUTER JOIN WebParts
ON
	 WebParts.tp_ListId = Lists.tp_ID AND
	 WebParts.tp_UserID IS NULL AND
	 WebParts.tp_Type = 0 AND
	 WebParts.tp_Level = 1
	 LEFT OUTER JOIN AllDocs AS AllDocs2
ON
	 AllDocs2.Id = WebParts.tp_PageUrlID AND
	 AllDocs2.Level = WebParts.tp_Level
	 LEFT OUTER JOIN AllDocs AS AllDocs1
ON
	 AllDocs1.Id = Lists.tp_Template AND
	 AllDocs1.Level = 1
WHERE
	 Lists.tp_WebId = @WebId AND
	 (@BaseType = -1
	  OR
	  Lists.tp_BaseType = @BaseType
	  OR
	  Lists.tp_BaseType = @BaseType2
	  OR
	  Lists.tp_BaseType = @BaseType3
	  OR
	  Lists.tp_BaseType = @BaseType4) AND
	 (@ServerTemplate = -1
	  OR
	  Lists.tp_ServerTemplate = @ServerTemplate) AND
	 (@ListFlags = -1
	  OR
	  Lists.tp_Flags & @ListFlags = @ListFlags)
ORDER BY Lists.tp_Title COLLATE  ' + @Collation + N' OPTION (FORCE ORDER)'
		EXEC sp_executesql @strQuery, N'@Scopes image', @Scopes
		END

GO
