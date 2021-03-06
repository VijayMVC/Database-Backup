/****** Object:  StoredProcedure [dbo].[proc_GetFolderInfo]    Script Date: 5/15/2018 12:12:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetFolderInfo(
    @SiteId uniqueidentifier,
    @DocFullUrl nvarchar(256),
    @ScopeId uniqueidentifier OUTPUT,
    @WebId uniqueidentifier OUTPUT,
    @FolderId int OUTPUT)
AS
    DECLARE @DirName nvarchar(256)
    DECLARE @LeafName nvarchar(128)
    EXEC proc_SplitUrl
            @DocFullUrl,
            @DirName OUTPUT,
            @LeafName OUTPUT
    SELECT 
        @ScopeId = ScopeId,
        @WebId = WebId,
        @FolderId = DoclibRowId
    FROM
        Docs
    WHERE
        SiteId = @SiteId AND
        DirName = @DirName AND
        LeafName = @LeafName AND
        (Type = 1 OR Type = 2)
    IF (@@ROWCOUNT = 0 OR @@ERROR <> 0)
    BEGIN
        RETURN 3
    END
    RETURN 0

GO
