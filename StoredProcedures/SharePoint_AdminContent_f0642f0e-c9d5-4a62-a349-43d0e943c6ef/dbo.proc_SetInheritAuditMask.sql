/****** Object:  StoredProcedure [dbo].[proc_SetInheritAuditMask]    Script Date: 5/15/2018 12:13:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SetInheritAuditMask
(
    @ItemType           tinyint,
    @SiteId             uniqueidentifier,
    @DirName            nvarchar(256),
    @LeafName           nvarchar(128),
    @InheritAuditFlags  int
)
AS
    SET NOCOUNT ON
    DECLARE @Id uniqueidentifier
    IF (@ItemType = 1) OR 
        (@ItemType = 3) OR 
        (@ItemType = 5)
        UPDATE
            Docs
        SET
            InheritAuditFlags = CASE WHEN (InheritAuditFlags IS NULL) 
                                        THEN @InheritAuditFlags
                             ELSE (@InheritAuditFlags | InheritAuditFlags)
                            END
        WHERE
            @SiteId = Docs.SiteId AND
            @DirName = Docs.DirName AND
            @LeafName = Docs.LeafName AND
            Docs.Level = 1
    ELSE IF (@ItemType = 4)
        BEGIN
            SELECT TOP 1
                @Id = Lists.tp_ID
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
            UPDATE
                Lists
            SET 
                tp_InheritAuditFlags = CASE WHEN (tp_InheritAuditFlags IS NULL) 
                                       THEN @InheritAuditFlags
                                    ELSE (@InheritAuditFlags | tp_InheritAuditFlags)
                                   END
            WHERE
                Lists.tp_ID = @Id
        END
    ELSE IF (@ItemType = 6)
        BEGIN
            SELECT TOP 1
                @Id = Docs.WebId
            FROM 
                Docs
            WHERE
                @SiteId = Docs.SiteId AND
                @DirName = Docs.DirName AND
                @LeafName = Docs.LeafName
            UPDATE
                Webs
            SET 
                InheritAuditFlags = CASE WHEN (InheritAuditFlags IS NULL) 
                                    THEN @InheritAuditFlags
                                 ELSE (@InheritAuditFlags | InheritAuditFlags)
                                END
            WHERE
                Webs.Id = @Id
        END
    ELSE IF (@ItemType = 7)
        UPDATE
            Sites
        SET
            InheritAuditFlags = CASE WHEN (InheritAuditFlags IS NULL) 
                                    THEN @InheritAuditFlags
                              ELSE (@InheritAuditFlags | InheritAuditFlags)
                             END
        WHERE
            @SiteId = Sites.Id
    IF (@ItemType <> 7)
        BEGIN
            DECLARE @NewItemType    tinyint
            DECLARE @NewDirName     nvarchar(256)
            DECLARE @NewLeafName    nvarchar(128)
            EXEC proc_GetParent 
                @ItemType, 
                @SiteId, 
                @DirName, 
                @LeafName,
                @NewItemType OUTPUT,
                @NewDirName OUTPUT,
                @NewLeafName OUTPUT
            EXEC proc_SetInheritAuditMask @NewItemType, @SiteId, @NewDirName, 
                                        @NewLeafName, @InheritAuditFlags    
        END
    IF (0 = @@ROWCOUNT)
        RETURN 2
    ELSE
        RETURN 0

GO
