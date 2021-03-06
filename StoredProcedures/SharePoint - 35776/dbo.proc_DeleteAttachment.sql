/****** Object:  StoredProcedure [dbo].[proc_DeleteAttachment]    Script Date: 5/15/2018 12:11:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeleteAttachment(
    @SiteId      uniqueidentifier,
    @WebId       uniqueidentifier,
    @FolderUrl   nvarchar(256),
    @RowID       uniqueidentifier,
    @UserId      int,
    @DeleteOp    int)
AS
    SET NOCOUNT ON
    DECLARE @Url nvarchar(260)
    SELECT   
        @Url = CASE WHEN (DATALENGTH(DirName) = 0) THEN LeafName WHEN (DATALENGTH(LeafName) = 0) THEN DirName ELSE DirName + N'/' + LeafName END
    FROM
        Docs
    WHERE    
        Id      = @RowID        AND
        DirName = @FolderUrl    AND
        Type    = 0
    EXEC proc_DeleteUrl @SiteId, @WebId, @Url, @UserId,
        1, 0, 0, 1, 1,
        0, @DeleteOp
    RETURN 0

GO
