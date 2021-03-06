/****** Object:  StoredProcedure [dbo].[proc_GetAuditMask]    Script Date: 5/15/2018 12:12:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetAuditMask
(
    @ItemType    tinyint,
    @SiteId      uniqueidentifier,
    @DirName     nvarchar(256),
    @LeafName    nvarchar(128)
)
AS
    SET NOCOUNT ON
    DECLARE @Id uniqueidentifier
    DECLARE @AuditFlags int
    DECLARE @InheritAuditFlags int
    DECLARE @GlobalAuditMask int
    EXEC proc_GetAuditMaskOutput 
            @ItemType,
            @SiteId,
            @DirName,
            @LeafName,
            @Id OUTPUT,
            @AuditFlags OUTPUT,
            @InheritAuditFlags OUTPUT,
            @GlobalAuditMask OUTPUT
    SELECT @Id, @AuditFlags, @InheritAuditFlags, @GlobalAuditMask
    IF (0 = @@ROWCOUNT)
        RETURN 2
    ELSE
        RETURN 0

GO
