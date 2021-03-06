/****** Object:  StoredProcedure [dbo].[proc_FetchContentTypeInScope]    Script Date: 5/15/2018 12:11:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_FetchContentTypeInScope(
    @SiteId uniqueidentifier,
    @Class tinyint,
    @Scope nvarchar(256),
    @ContentTypeId tContentTypeId)
AS
    SET NOCOUNT ON
    DECLARE @CTScope nvarchar(256)
    IF (DATALENGTH(@Scope) = 0)
    BEGIN
        SET @CTScope = @Scope
    END
    ELSE
    BEGIN
        SELECT
            @CTScope = ContentTypes.Scope
        FROM
            ContentTypes
        WHERE
            ContentTypes.SiteId = @SiteId AND
            ContentTypes.Class = @Class AND
            ContentTypes.ContentTypeId = @ContentTypeId
        IF @CTScope IS NOT NULL AND @CTScope <> '' AND @CTScope <> @Scope
        BEGIN
            DECLARE @ScopeEscaped nvarchar(256)
            EXEC proc_EscapeForLike @CTScope, @ScopeEscaped OUTPUT, 1
            IF (@Scope NOT LIKE @ScopeEscaped)
                SET @CTScope = NULL
        END
    END
    SELECT
        ContentTypes.Definition,
        ContentTypes.Version
    FROM
        ContentTypes
    WHERE
        ContentTypes.SiteId = @SiteId AND
        ContentTypes.Class = @Class AND
        ContentTypes.Scope = @CTScope AND
        ContentTypes.ContentTypeId = @ContentTypeId
    ORDER BY
        ContentTypes.ContentTypeId
    IF (@@ROWCOUNT = 0 OR @@ERROR <> 0)
    BEGIN
        RETURN 2
    END    
    RETURN 0

GO
