/****** Object:  StoredProcedure [dbo].[proc_DeleteFieldTemplateInScope]    Script Date: 5/15/2018 12:12:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeleteFieldTemplateInScope(
    @SiteId uniqueidentifier,
    @Scope nvarchar(256),
    @FieldId uniqueidentifier,
    @BaseTypes int)
AS
    SET NOCOUNT ON
    DECLARE @Ret int
    BEGIN TRAN
    DECLARE @Count int
    EXEC @Count = proc_CountFieldTemplateInstancesInContentTypeTemplate @SiteId, @FieldId
    IF (@Count > 0)
    BEGIN
        SET @Ret = 4307
        GOTO cleanup
    END
    EXEC @Count = proc_CountListOfBasesTypeInSite @SiteId, @BaseTypes
    IF (@Count > 0)
    BEGIN
        SET @Ret = 4307
        GOTO cleanup
    END
    DELETE FROM
        FieldUsage
    WHERE
        SiteId = @SiteId AND
        FieldId = @FieldId
    DELETE FROM
        ContentTypes
    WHERE
        ContentTypes.SiteId = @SiteId AND
        ContentTypes.Class = 0 AND
        ContentTypes.Scope = @Scope AND
        ContentTypes.ContentTypeId = @FieldId
    IF (@@ROWCOUNT = 0 OR @@ERROR <> 0)
    BEGIN
        SET @Ret = 2
        GOTO cleanup
    END
    EXEC proc_LogContentTypeChange @SiteId, NULL, 0, @Scope,
        @FieldId, 16384
    EXEC proc_UpdateDiskUsed @SiteId
    SET @Ret = 0
cleanup:
    IF (@Ret <> 0 AND @@TRANCOUNT = 1) ROLLBACK TRAN ELSE COMMIT TRAN
    RETURN @Ret

GO
