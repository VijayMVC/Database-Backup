/****** Object:  StoredProcedure [dbo].[proc_DeleteUrl]    Script Date: 5/15/2018 12:11:52 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeleteUrl(
    @WebSiteId       uniqueidentifier,
    @WebId           uniqueidentifier,
    @Url             nvarchar(260),
    @UserId          int,
    @LogChange bit = 1, 
    @ListDeletedUrls bit = 1,
    @ListDeletedAliases bit = 0,
    @AttachmentsFlag tinyint = 0,
    @AttachmentOp    int = 3,
    @IgnoreCheckedOutFiles bit = 0,
    @DeleteOp        int = 3,
    @QueryAuditFlags bit = 0,
    @FailedUrl       nvarchar(260) = NULL OUTPUT,
    @DeleteTransactionId uniqueidentifier = '00000000-0000-0000-0000-000000000000' OUTPUT,
    @eventData       image = NULL,
    @acl             image = NULL
    )
AS
    SET NOCOUNT ON
    BEGIN TRAN
    DECLARE @DeleteTransactionIdVB varbinary(16)
    SET @DeleteTransactionIdVB = 0x
    DECLARE @iRet int  
    EXEC @iRet = proc_DeleteUrlCore @WebSiteId, @WebId, @Url, @UserId,
        @LogChange, NULL, @ListDeletedUrls, @ListDeletedAliases,
        @AttachmentsFlag, @AttachmentOp,
        @IgnoreCheckedOutFiles,
        @DeleteOp,
        @DeleteTransactionIdVB OUTPUT,
        0,
        @FailedUrl OUTPUT,
        0,    
        NULL, 
        NULL, 
        @QueryAuditFlags
    SET @DeleteTransactionId = CAST(@DeleteTransactionIdVB AS uniqueidentifier)
cleanup:
    IF (@iRet = 0)
    BEGIN
        EXEC proc_UpdateDiskUsed @WebSiteId
    END
    IF (@iRet <> 0 AND @@TRANCOUNT = 1) ROLLBACK TRAN ELSE COMMIT TRAN
    RETURN @iRet

GO
