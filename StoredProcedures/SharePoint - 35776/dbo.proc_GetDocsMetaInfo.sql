/****** Object:  StoredProcedure [dbo].[proc_GetDocsMetaInfo]    Script Date: 5/15/2018 12:12:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetDocsMetaInfo(
    @DocSiteId uniqueidentifier,
    @WebFullUrl nvarchar(260),
    @GetDocsFlags int,
    @UserId int,
    @DirName1 nvarchar(256) = NULL,
    @LeafName1 nvarchar(128) = NULL,
    @AttachmentsFlag1 tinyint               = NULL,
    @Level1 tinyint                         = NULL,
    @DirName2 nvarchar(256) = NULL,
    @LeafName2 nvarchar(128) = NULL,
    @AttachmentsFlag2 tinyint               = NULL,
    @Level2 tinyint                         = NULL,    
    @DirName3 nvarchar(256) = NULL,
    @LeafName3 nvarchar(128) = NULL,
    @AttachmentsFlag3 tinyint               = NULL,
    @Level3 tinyint                         = NULL,    
    @DirName4 nvarchar(256) = NULL,
    @LeafName4 nvarchar(128) = NULL,
    @AttachmentsFlag4 tinyint               = NULL,
    @Level4 tinyint                         = NULL,
    @DirName5 nvarchar(256) = NULL,
    @LeafName5 nvarchar(128) = NULL,
    @AttachmentsFlag5 tinyint               = NULL,
    @Level5 tinyint                         = NULL,
    @DirName6 nvarchar(256) = NULL,
    @LeafName6 nvarchar(128) = NULL,
    @AttachmentsFlag6 tinyint               = NULL,
    @Level6 tinyint                         = NULL,
    @DirName7 nvarchar(256) = NULL,
    @LeafName7 nvarchar(128) = NULL,
    @AttachmentsFlag7 tinyint               = NULL,
    @Level7 tinyint                         = NULL,
    @DirName8 nvarchar(256) = NULL,
    @LeafName8 nvarchar(128) = NULL,
    @AttachmentsFlag8 tinyint               = NULL,
    @Level8 tinyint                         = NULL,    
    @DirName9 nvarchar(256) = NULL,
    @LeafName9 nvarchar(128) = NULL,
    @AttachmentsFlag9 tinyint               = NULL,
    @Level9 tinyint                         = NULL,
    @DirName10 nvarchar(256) = NULL,
    @LeafName10 nvarchar(128) = NULL,
    @AttachmentsFlag10 tinyint               = NULL,
    @Level10 tinyint                         = NULL)
    AS
    SET NOCOUNT ON
    DECLARE @DocWebId uniqueidentifier
    DECLARE @WebId uniqueidentifier
    DECLARE @Level tinyint
    DECLARE @CheckinLevel tinyint
    SELECT
        @DocWebId = Webs.Id
    FROM
        Webs WITH (NOLOCK)
    WHERE
        Webs.SiteId = @DocSiteId AND
        Webs.FullUrl = @WebFullUrl
    DECLARE @FetchLinkInfo bit
    SELECT @FetchLinkInfo = CASE
        WHEN
            ((@GetDocsFlags & 32) = 32)
        THEN
            1
        ELSE
            0
        END
    DECLARE @DocList table
        (DirName nvarchar(256) COLLATE Latin1_General_CI_AS_KS_WS, 
            LeafName nvarchar(128) COLLATE Latin1_General_CI_AS_KS_WS,
            Level tinyint,
            SeqId uniqueidentifier,
            WebId uniqueidentifier
        )
    IF @DirName1 IS NOT NULL
    BEGIN
        DECLARE @FullUrl1 nvarchar(260)
        SET @FullUrl1 = CASE WHEN (DATALENGTH(@DirName1) = 0) THEN @LeafName1 WHEN (DATALENGTH(@LeafName1) = 0) THEN @DirName1 ELSE @DirName1 + N'/' + @LeafName1 END
        EXEC proc_GetLevel  
            @DocSiteId, 
            @DirName1, 
            @LeafName1, 
            @UserId,
            @Level1,
            @Level OUTPUT,
            @CheckinLevel OUTPUT,
            @WebId OUTPUT
        EXEC proc_SecGetIndividualUrlSecurity @DocSiteId, @DocWebId,
            @FullUrl1, @DirName1, @LeafName1,
            @UserId, @AttachmentsFlag1, 0, 0, 0, 0, @Level
        INSERT INTO @DocList (DirName, LeafName, Level, SeqId, WebId)
            VALUES (@DirName1, @LeafName1, @Level, NEWID(), @WebId)
    END
    IF @DirName2 IS NOT NULL
    BEGIN
        DECLARE @FullUrl2 nvarchar(260)
        SET @FullUrl2 = CASE WHEN (DATALENGTH(@DirName2) = 0) THEN @LeafName2 WHEN (DATALENGTH(@LeafName2) = 0) THEN @DirName2 ELSE @DirName2 + N'/' + @LeafName2 END
        EXEC proc_GetLevel  
            @DocSiteId, 
            @DirName2, 
            @LeafName2, 
            @UserId,
            @Level2,
            @Level OUTPUT,
            @CheckinLevel OUTPUT,
            @WebId OUTPUT
        EXEC proc_SecGetIndividualUrlSecurity @DocSiteId, @DocWebId,
            @FullUrl2, @DirName2, @LeafName2,
            @UserId, @AttachmentsFlag2, 0, 0, 0, 0, @Level
        INSERT INTO @DocList (DirName, LeafName, Level, SeqId, WebId)
            VALUES (@DirName2, @LeafName2, @Level, NEWID(), @WebId)
    END
    IF @DirName3 IS NOT NULL
    BEGIN
        DECLARE @FullUrl3 nvarchar(260)
        SET @FullUrl3 = CASE WHEN (DATALENGTH(@DirName3) = 0) THEN @LeafName3 WHEN (DATALENGTH(@LeafName3) = 0) THEN @DirName3 ELSE @DirName3 + N'/' + @LeafName3 END
        EXEC proc_GetLevel  
            @DocSiteId, 
            @DirName3, 
            @LeafName3, 
            @UserId,
            @Level3,
            @Level OUTPUT,
            @CheckinLevel OUTPUT,
            @WebId OUTPUT
        EXEC proc_SecGetIndividualUrlSecurity @DocSiteId, @DocWebId,
            @FullUrl3, @DirName3, @LeafName3,
            @UserId, @AttachmentsFlag3, 0, 0, 0,0, @Level
        INSERT INTO @DocList (DirName, LeafName, Level, SeqId, WebId)
            VALUES (@DirName3, @LeafName3, @Level, NEWID(), @WebId)
    END
    IF @DirName4 IS NOT NULL
    BEGIN
        DECLARE @FullUrl4 nvarchar(260)
        SET @FullUrl4 = CASE WHEN (DATALENGTH(@DirName4) = 0) THEN @LeafName4 WHEN (DATALENGTH(@LeafName4) = 0) THEN @DirName4 ELSE @DirName4 + N'/' + @LeafName4 END
        EXEC proc_GetLevel  
            @DocSiteId, 
            @DirName4, 
            @LeafName4, 
            @UserId,
            @Level4,
            @Level OUTPUT,
            @CheckinLevel OUTPUT,
            @WebId OUTPUT
        EXEC proc_SecGetIndividualUrlSecurity @DocSiteId, @DocWebId,
            @FullUrl4, @DirName4, @LeafName4,
            @UserId, @AttachmentsFlag4, 0, 0, 0,0, @Level
        INSERT INTO @DocList (DirName, LeafName, Level, SeqId, WebId)
            VALUES (@DirName4, @LeafName4, @Level, NEWID(), @WebId)
    END
    IF @DirName5 IS NOT NULL
    BEGIN
        DECLARE @FullUrl5 nvarchar(260)
        SET @FullUrl5 = CASE WHEN (DATALENGTH(@DirName5) = 0) THEN @LeafName5 WHEN (DATALENGTH(@LeafName5) = 0) THEN @DirName5 ELSE @DirName5 + N'/' + @LeafName5 END
        EXEC proc_GetLevel  
            @DocSiteId, 
            @DirName5, 
            @LeafName5, 
            @UserId,
            @Level5,
            @Level OUTPUT,
            @CheckinLevel OUTPUT,
            @WebId OUTPUT
        EXEC proc_SecGetIndividualUrlSecurity @DocSiteId, @DocWebId,
            @FullUrl5, @DirName5, @LeafName5,
            @UserId, @AttachmentsFlag5, 0, 0, 0,0, @Level
        INSERT INTO @DocList (DirName, LeafName, Level, SeqId, WebId)
            VALUES (@DirName5, @LeafName5, @Level, NEWID(), @WebId)
    END
    IF @DirName6 IS NOT NULL
    BEGIN
        DECLARE @FullUrl6 nvarchar(260)
        SET @FullUrl6 = CASE WHEN (DATALENGTH(@DirName6) = 0) THEN @LeafName6 WHEN (DATALENGTH(@LeafName6) = 0) THEN @DirName6 ELSE @DirName6 + N'/' + @LeafName6 END
        EXEC proc_GetLevel  
            @DocSiteId, 
            @DirName6, 
            @LeafName6, 
            @UserId,
            @Level6,
            @Level OUTPUT,
            @CheckinLevel OUTPUT,
            @WebId OUTPUT
        EXEC proc_SecGetIndividualUrlSecurity @DocSiteId, @DocWebId,
            @FullUrl6, @DirName6, @LeafName6,
            @UserId, @AttachmentsFlag6, 0, 0, 0,0, @Level
        INSERT INTO @DocList (DirName, LeafName, Level, SeqId, WebId)
            VALUES (@DirName6, @LeafName6, @Level, NEWID(), @WebId)
    END
    IF @DirName7 IS NOT NULL
    BEGIN
        DECLARE @FullUrl7 nvarchar(260)
        SET @FullUrl7 = CASE WHEN (DATALENGTH(@DirName7) = 0) THEN @LeafName7 WHEN (DATALENGTH(@LeafName7) = 0) THEN @DirName7 ELSE @DirName7 + N'/' + @LeafName7 END
        EXEC proc_GetLevel  
            @DocSiteId, 
            @DirName7, 
            @LeafName7, 
            @UserId,
            @Level7,
            @Level OUTPUT,
            @CheckinLevel OUTPUT,
            @WebId OUTPUT
        EXEC proc_SecGetIndividualUrlSecurity @DocSiteId, @DocWebId,
            @FullUrl7, @DirName7, @LeafName7,
            @UserId, @AttachmentsFlag7, 0, 0, 0, 0, @Level
        INSERT INTO @DocList (DirName, LeafName, Level, SeqId, WebId)
            VALUES (@DirName7, @LeafName7, @Level, NEWID(), @WebId)
    END
    IF @DirName8 IS NOT NULL
    BEGIN
        DECLARE @FullUrl8 nvarchar(260)
        SET @FullUrl8 = CASE WHEN (DATALENGTH(@DirName8) = 0) THEN @LeafName8 WHEN (DATALENGTH(@LeafName8) = 0) THEN @DirName8 ELSE @DirName8 + N'/' + @LeafName8 END
        EXEC proc_GetLevel  
            @DocSiteId, 
            @DirName8, 
            @LeafName8, 
            @UserId,
            @Level8,
            @Level OUTPUT,
            @CheckinLevel OUTPUT,
            @WebId OUTPUT
        EXEC proc_SecGetIndividualUrlSecurity @DocSiteId, @DocWebId,
            @FullUrl8, @DirName8, @LeafName8,
            @UserId, @AttachmentsFlag8, 0, 0, 0,0, @Level
        INSERT INTO @DocList (DirName, LeafName, Level, SeqId, WebId)
            VALUES (@DirName8, @LeafName8, @Level, NEWID(), @WebId)
    END
    IF @DirName9 IS NOT NULL
    BEGIN
        DECLARE @FullUrl9 nvarchar(260)
        SET @FullUrl9 = CASE WHEN (DATALENGTH(@DirName9) = 0) THEN @LeafName9 WHEN (DATALENGTH(@LeafName9) = 0) THEN @DirName9 ELSE @DirName9 + N'/' + @LeafName9 END
        EXEC proc_GetLevel  
            @DocSiteId, 
            @DirName9, 
            @LeafName9, 
            @UserId,
            @Level9,
            @Level OUTPUT,
            @CheckinLevel OUTPUT,
            @WebId OUTPUT
        EXEC proc_SecGetIndividualUrlSecurity @DocSiteId, @DocWebId,
            @FullUrl9, @DirName9, @LeafName9,
            @UserId, @AttachmentsFlag9, 0, 0, 0,0, @Level
        INSERT INTO @DocList (DirName, LeafName, Level, SeqId, WebId)
            VALUES (@DirName9, @LeafName9, @Level, NEWID(), @WebId)
    END
    IF @DirName10 IS NOT NULL
    BEGIN
        DECLARE @FullUrl10 nvarchar(260)
        SET @FullUrl10 = CASE WHEN (DATALENGTH(@DirName10) = 0) THEN @LeafName10 WHEN (DATALENGTH(@LeafName10) = 0) THEN @DirName10 ELSE @DirName10 + N'/' + @LeafName10 END
        EXEC proc_GetLevel  
            @DocSiteId, 
            @DirName10, 
            @LeafName10, 
            @UserId,
            @Level10,
            @Level OUTPUT,
            @CheckinLevel OUTPUT,
            @WebId OUTPUT
        EXEC proc_SecGetIndividualUrlSecurity @DocSiteId, @DocWebId,
            @FullUrl10, @DirName10, @LeafName10,
            @UserId, @AttachmentsFlag10, 0, 0, 0, 0, @Level
        INSERT INTO @DocList (DirName, LeafName, Level, SeqId, WebId)
            VALUES (@DirName10, @LeafName10, @Level, NEWID(), @WebId)
    END
    SELECT dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    SELECT
        Webs.FullUrl
    FROM
        Webs
    WHERE
		Webs.SiteId = @DocSiteId AND
        Webs.ParentWebId = @DocWebId
    UPDATE
        @DocList
    SET
        SeqId = COALESCE(Docs.Id, SeqId)
    FROM
        @DocList DocList LEFT OUTER JOIN Docs
    ON
        Docs.SiteId = @DocSiteID AND
        Docs.DirName = DocList.DirName AND
        Docs.LeafName = DocList.LeafName
    IF @FetchLinkInfo = 1
    BEGIN
        SELECT
            DocList.SeqId As DocId, Links.TargetDirName AS LinkDirName,
            Links.TargetLeafName AS LinkLeafName, Links.Type AS LinkType,
            Links.Security AS LinkSecurity, Links.Dynamic AS LinkDynamic,
            Links.ServerRel AS LinkServerRel, Docs2.Type AS LinkStatus,
            PointsToDir AS PointsToDir, NULL AS WebPartId,
            NULL AS LinkNumber, NULL AS WebId, NULL AS Search, NULL AS FieldId
        FROM
            Links INNER JOIN @DocList DocList
        ON
            Links.DirName = DocList.DirName AND
            Links.LeafName = DocList.LeafName AND
            Links.Level = DocList.Level                  
            LEFT OUTER JOIN Docs Docs2
        ON
            Links.ServerRel = 1 AND
            Docs2.SiteId = Links.SiteId AND
            Docs2.DirName = Links.TargetDirName AND
            Docs2.LeafName = Links.TargetLeafName
        WHERE
            Links.SiteId = @DocSiteId AND
            DocList.WebId = @DocWebId
        UNION ALL
        SELECT DISTINCT
            DocList.SeqId As DocId, Links.DirName AS LinkDirName,
            Links.LeafName AS LinkLeafName, Links.Type AS LinkType, 
            NULL AS LinkSecurity, NULL AS LinkDynamic, 
            NULL AS LinkServerRel,
            CAST(128 AS tinyint) AS LinkStatus,
            NULL AS PointsToDir, NULL AS WebPartId, NULL AS LinkNumber,
            NULL AS WebId, NULL AS Search, NULL AS FieldId
        FROM
            @DocList DocList
        INNER JOIN
            AllLinks AS Links WITH (INDEX=Links_Backward)
        ON
            Links.DeleteTransactionId = 0x AND
            Links.TargetDirName = DocList.DirName AND
            Links.TargetLeafName = DocList.LeafName
        WHERE
            Links.SiteId = @DocSiteId AND
            DocList.WebId = @DocWebId
        ORDER BY
            DocList.SeqId
    END
    SELECT
        DocList.SeqId AS DocId,                         
        CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END,          
        Docs.Type,                                      
        Docs.MetaInfoTimeLastModified,                  
        Docs.MetaInfo,                                  
        Size,                                           
        Docs.TimeCreated,                               
        Docs.TimeLastModified,                          
        Docs.Version,                                   
        Docs.DocFlags,                                  
        Lists.tp_BaseType + Lists.tp_ServerTemplate * 256, 
        N'{' + CAST(Lists.tp_ID AS nvarchar(36)) + N'}' AS tp_Name, 
        CASE WHEN                                   
                (Lists.tp_RootFolder = Docs.Id )
        THEN
                Lists.tp_Title
        ELSE
                NULL
        END,							          
        NULL, 
        DocList.DirName AS GhostDirName,                
        DocList.LeafName AS GhostLeafName,              
        UserInfo.tp_Login,                              
        Docs.CheckoutDate,                              
        CASE WHEN LTCheckoutUserId IS NULL              
        THEN Docs.CheckoutExpires
        ELSE NULL
        END,
        Docs.VirusStatus,                               
        Docs.VirusInfo,                                 
        Docs.SetupPathVersion,                          
        Docs.SetupPath,                                 
        Docs.SetupPathUser,                             
        Docs.NextToLastTimeModified,                    
        Docs.UIVersion,                                 
        Docs.CheckinComment, 
        Docs.WelcomePageUrl,                            
        Docs.WelcomePageParameters,                     
        Lists.tp_Flags,                                 
        Perms.Acl,          
        Perms.AnonymousPermMask, 
        Docs.DraftOwnerId,                              
        Docs.Level,                                     
        Docs.ParentVersion,                             
        Docs.TransformerId,                             
        Docs.ParentLeafName,                            
        Docs.ProgId,                                    
        Docs.DoclibRowId,                               
        Lists.tp_DefaultWorkflowId,                     
        Docs.ListId                                     
    FROM
        @DocList DocList LEFT OUTER JOIN Docs
    ON
        DocList.DirName = Docs.DirName AND
        DocList.LeafName = Docs.LeafName AND
        DocList.Level = Docs.Level AND
        Docs.WebId = @DocWebId AND
        Docs.SiteId = @DocSiteId
        LEFT OUTER JOIN Perms
    ON
        Docs.SiteId = Perms.SiteId AND
        Docs.ScopeId = Perms.ScopeId
        LEFT OUTER JOIN Lists WITH (NOLOCK)
    ON
        Lists.tp_WebId = Docs.WebId AND
        (Docs.Type = 1 AND
         Lists.tp_RootFolder = Docs.Id OR
         Lists.tp_ID = Docs.ListId AND
         Docs.DoclibRowId IS NOT NULL)
        LEFT OUTER JOIN UserInfo
    ON
        Docs.CheckoutUserId = UserInfo.tp_Id AND
        Docs.SiteId = UserInfo.tp_SiteID
    ORDER BY
        DocList.SeqId
    RETURN 0

GO
