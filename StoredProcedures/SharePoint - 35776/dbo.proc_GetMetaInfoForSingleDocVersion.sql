/****** Object:  StoredProcedure [dbo].[proc_GetMetaInfoForSingleDocVersion]    Script Date: 5/15/2018 12:12:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetMetaInfoForSingleDocVersion(
    @DocSiteId          uniqueidentifier,
    @DocDirName         nvarchar(256),
    @DocLeafName        nvarchar(128),
    @UserId             int,
    @Level              tinyint,
    @CacheParse         bit,
    @DocWebId           uniqueidentifier,
    @Version            int)
AS
    DECLARE @DocId uniqueidentifier
    SELECT
        Docs.Id,                                        
        CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END,          
        Docs.Type,                                      
        Docs.MetaInfoTimeLastModified,                  
        DocVersions.MetaInfo,                           
        DocVersions.Size,                               
        Docs.TimeCreated,                               
        DocVersions.TimeCreated,                        
        Docs.Version,                                   
        Docs.DocFlags,                                  
        NULL, 
        NULL, 
        NULL, 
        CASE WHEN @CacheParse = 1                       
        THEN
            CacheParseId
        ELSE
            NULL
        END,
        NULL, 
        NULL, 
        UserInfo.tp_Login,                              
        Docs.CheckoutDate,                              
        CASE WHEN Docs.LTCheckoutUserId IS NULL         
        THEN
            Docs.CheckoutExpires
        ELSE
            NULL
        END,
        DocVersions.VirusStatus,                        
        DocVersions.VirusInfo,                          
        SetupPathVersion,                               
        SetupPath,                                      
        SetupPathUser,                                  
        Docs.NextToLastTimeModified,                    
        DocVersions.Version,                            
        DocVersions.CheckinComment, 
        Docs.WelcomePageUrl,                            
        Docs.WelcomePageParameters,                     
        NULL,    
        Perms.Acl,          
        Perms.AnonymousPermMask, 
        Docs.DraftOwnerId,                              
        Docs.Level,                                     
        Docs.ParentVersion,                             
        Docs.TransformerId,                             
        Docs.ParentLeafName,                            
        Docs.ProgId,                                    
        Docs.DoclibRowId,                               
        NULL,                                           
        Docs.ListId                                     
    FROM
        Docs
    INNER JOIN
        Perms
    ON
        Docs.SiteId = Perms.SiteId AND
        Docs.ScopeId = Perms.ScopeId
    INNER JOIN
        DocVersions
    ON
        Docs.SiteId = DocVersions.SiteId AND
        Docs.ID = DocVersions.ID
    LEFT OUTER JOIN
        UserInfo
    ON
        Docs.CheckoutUserId = UserInfo.tp_Id AND
        Docs.SiteId = UserInfo.tp_SiteID
    WHERE
        Docs.SiteId = @DocSiteId AND
        Docs.DirName = @DocDirName AND 
        Docs.LeafName = @DocLeafName AND
        Docs.Level = @Level AND
        DocVersions.Version = @Version AND
        Docs.WebId = @DocWebId
    UNION ALL
    SELECT
        Docs.Id,                                        
        CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END,          
        Docs.Type,                                      
        Docs.MetaInfoTimeLastModified,                  
        Docs2.MetaInfo,                                 
        COALESCE(DocStreams.Size, Docs2.Size),          
        Docs.TimeCreated,                               
        Docs2.TimeLastModified,                         
        Docs.Version,                                   
        Docs.DocFlags,                                  
        NULL, 
        NULL, 
        NULL, 
        CASE WHEN @CacheParse = 1                       
        THEN
            Docs.CacheParseId
        ELSE
            NULL
        END,
        NULL, 
        NULL, 
        UserInfo.tp_Login,                              
        Docs.CheckoutDate,                              
        CASE WHEN Docs.LTCheckoutUserId IS NULL         
        THEN
            Docs.CheckoutExpires
        ELSE
            NULL
        END,
        Docs2.VirusStatus,                              
        Docs2.VirusInfo,                                
        Docs.SetupPathVersion,                          
        Docs.SetupPath,                                 
        Docs.SetupPathUser,                             
        Docs.NextToLastTimeModified,                    
        Docs2.Version,                                  
        Docs2.CheckinComment, 
        Docs.WelcomePageUrl,                            
        Docs.WelcomePageParameters,                     
        NULL,    
        Perms.Acl,          
        Perms.AnonymousPermMask, 
        Docs.DraftOwnerId,                              
        Docs.Level,                                     
        Docs.ParentVersion,                             
        Docs.TransformerId,                             
        Docs.ParentLeafName,                            
        Docs.ProgId,                                    
        Docs.DoclibRowId,                               
        NULL,     
        Docs.ListId                                     
    FROM
        Docs      
    INNER JOIN
        Perms
    ON
        Docs.SiteId = Perms.SiteId AND
        Docs.ScopeId = Perms.ScopeId
    INNER JOIN
        Docs AS Docs2
    ON
        Docs.SiteId = Docs2.SiteId AND
        Docs.ID = Docs2.ID AND 
        Docs2.UIVersion = @Version AND
        Docs2.Level < @Level
    LEFT OUTER JOIN 
        DocStreams
    ON
        Docs2.SiteId = DocStreams.SiteId AND
        Docs2.ParentId = DocStreams.ParentId AND
        Docs2.Id = DocStreams.Id AND
        Docs2.Level = DocStreams.Level
    LEFT OUTER JOIN
        UserInfo
    ON
        Docs.CheckoutUserId = UserInfo.tp_Id AND
        Docs.SiteId = UserInfo.tp_SiteID
    WHERE
        Docs.SiteId = @DocSiteId AND
        Docs.DirName = @DocDirName AND 
        Docs.LeafName = @DocLeafName AND
        Docs.Level = @Level AND
        Docs.WebId = @DocWebId
    IF @@ROWCOUNT > 0
    BEGIN
        SELECT TOP 1
            @DocId = Id
        FROM
            Docs
        WHERE
            Docs.SiteId = @DocSiteId AND
            Docs.DirName = @DocDirName AND 
            Docs.LeafName = @DocLeafName
        EXEC proc_GetEventReceivers @DocSiteId, @DocWebId, @DocId, 3
    END

GO
