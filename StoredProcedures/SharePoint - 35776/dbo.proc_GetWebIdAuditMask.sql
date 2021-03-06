/****** Object:  StoredProcedure [dbo].[proc_GetWebIdAuditMask]    Script Date: 5/15/2018 12:12:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetWebIdAuditMask
(
    @SiteId             uniqueidentifier,
    @Id                 uniqueidentifier
)
AS
    SET NOCOUNT ON
    DECLARE @AuditFlags int
    DECLARE @InheritAuditFlags int
    DECLARE @GlobalAuditMask int
    SELECT 
        @AuditFlags = AuditFlags,
        @InheritAuditFlags = InheritAuditFlags
    FROM 
        Webs
    WHERE
        Webs.SiteId = @SiteId AND        
        Webs.Id = @Id
    EXEC proc_GetGlobalAuditMask @SiteId, @GlobalAuditMask OUTPUT
    SELECT @Id, @AuditFlags, @InheritAuditFlags, @GlobalAuditMask
    IF (0 = @@ROWCOUNT)
        RETURN 2
    ELSE
        RETURN 0    

GO
