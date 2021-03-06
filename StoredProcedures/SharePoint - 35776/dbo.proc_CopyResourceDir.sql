/****** Object:  StoredProcedure [dbo].[proc_CopyResourceDir]    Script Date: 5/15/2018 12:11:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_CopyResourceDir(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @ContentTypeId tContentTypeId,
    @Scope nvarchar(256),
    @TargetDir nvarchar(256))
AS
    SET NOCOUNT ON
    DECLARE @ctFolder nvarchar(256)
    DECLARE @flags int
    SET @flags = 512 | 2
    SELECT
        @ctFolder = dbo.fn_GetFullUrl(dbo.fn_GetFullUrl(@Scope, N'_cts'), ResourceDir)
    FROM
        ContentTypes
    WHERE
        SiteId = @SiteId AND
        Class =  1 AND
        Scope = @Scope AND
        ContentTypeId = @ContentTypeId
    IF @@rowcount = 1
    BEGIN
        EXEC proc_CopyUrl @SiteId,
            @WebId,
            @ctFolder,
            @TargetDir,
            NULL,
            @flags
    END

GO
