/****** Object:  StoredProcedure [dbo].[proc_SecGetSecurityInfo]    Script Date: 5/15/2018 12:12:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecGetSecurityInfo(
    @SiteId  uniqueidentifier,
    @WebId   uniqueidentifier,
    @Url     nvarchar(260),
    @DocId   uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @ScopeId   uniqueidentifier
    DECLARE @DirName nvarchar(256)
    DECLARE @LeafName nvarchar(128)
    IF (@Url IS NOT NULL)
    BEGIN
        EXEC proc_SplitUrl @Url, @DirName OUTPUT, @LeafName OUTPUT
    END
    ELSE
    BEGIN
        SELECT
            @DirName = DirName,
            @LeafName = LeafName,
            @Url = CASE WHEN (DATALENGTH(DirName) = 0) THEN LeafName WHEN (DATALENGTH(LeafName) = 0) THEN DirName ELSE DirName + N'/' + LeafName END
        FROM
            Docs
        WHERE
            SiteId = @SiteId AND
            Id = @DocId
    END
    SELECT
        @ScopeId  = ScopeId
    FROM
        Docs
    WHERE
        SiteId = @SiteId AND
        DirName = @DirName AND
        LeafName = @LeafName
    IF @@ROWCOUNT = 0
    BEGIN
        RETURN 3
    END
    SELECT
        ScopeId,
        ScopeUrl,
        CASE WHEN ScopeUrl = @Url THEN 1 ELSE 0 END,
        Acl,
        AnonymousPermMask
    FROM
        Perms
    WHERE
        SiteId = @SiteId AND
        ScopeId = @ScopeId
    RETURN 0

GO
