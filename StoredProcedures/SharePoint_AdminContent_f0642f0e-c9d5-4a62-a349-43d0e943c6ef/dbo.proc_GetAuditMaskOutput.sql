/****** Object:  StoredProcedure [dbo].[proc_GetAuditMaskOutput]    Script Date: 5/15/2018 12:12:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetAuditMaskOutput
(
    @ItemType           tinyint,
    @SiteId             uniqueidentifier,
    @DirName            nvarchar(256),
    @LeafName           nvarchar(128),
    @Id                 uniqueidentifier   OUTPUT,
    @AuditFlags         int                OUTPUT,
    @InheritAuditFlags  int                OUTPUT,
    @GlobalAuditMask    int                OUTPUT
)
AS
    SET NOCOUNT ON
    IF (@ItemType = 1) OR 
        (@ItemType = 3)
        SELECT TOP 1
            @Id = Id,
            @AuditFlags = AuditFlags,
            @InheritAuditFlags = InheritAuditFlags
        FROM 
            Docs
        WHERE
            @SiteId = Docs.SiteId AND
            @DirName = Docs.DirName AND
            @LeafName = Docs.LeafName
    ELSE IF (@ItemType = 4)
        SELECT TOP 1
            @Id = Lists.tp_ID,
            @AuditFlags = Lists.tp_AuditFlags,
            @InheritAuditFlags = Lists.tp_InheritAuditFlags
        FROM 
            Docs
        INNER JOIN 
            Lists WITH (NOLOCK)
        ON
            Lists.tp_WebId = Docs.WebId AND
            Lists.tp_ID = Docs.ListId           
        WHERE
            @SiteId = Docs.SiteId AND
            @DirName = Docs.DirName AND
            @LeafName = Docs.LeafName
    ELSE IF (@ItemType = 5)
        SELECT 
            @Id = Id,
            @AuditFlags = AuditFlags,
            @InheritAuditFlags = InheritAuditFlags
        FROM 
            Docs
        WHERE
            @SiteId = Docs.SiteId AND
            @DirName = Docs.DirName AND
            @LeafName = Docs.LeafName    
    ELSE IF (@ItemType = 6)
        SELECT 
            @Id = Webs.Id,
            @AuditFlags = Webs.AuditFlags,
            @InheritAuditFlags = Webs.InheritAuditFlags
        FROM 
            Docs
        INNER JOIN
            Webs WITH (NOLOCK)
        ON
            Webs.SiteId = Docs.SiteId AND        
            Webs.Id = Docs.WebId 
        WHERE
            @SiteId = Docs.SiteId AND
            @DirName = Docs.DirName AND
            @LeafName = Docs.LeafName
    ELSE IF (@ItemType = 7)
        SELECT TOP 1
            @Id = Id,
            @AuditFlags = AuditFlags,
            @InheritAuditFlags = InheritAuditFlags
        FROM 
            Sites
        WHERE
            @SiteId = Sites.Id
    EXEC proc_GetGlobalAuditMask @SiteId, @GlobalAuditMask OUTPUT
    IF (0 = @@ROWCOUNT)
        RETURN 2
    ELSE
        RETURN 0

GO
