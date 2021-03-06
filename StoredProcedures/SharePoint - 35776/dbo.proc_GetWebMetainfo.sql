/****** Object:  StoredProcedure [dbo].[proc_GetWebMetainfo]    Script Date: 5/15/2018 12:12:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetWebMetainfo(
    @WebSiteId uniqueidentifier,
    @WebDirName nvarchar(256),
    @WebLeafName nvarchar(128),
    @DGCacheVersion bigint,
    @SystemId tSystemId = NULL)
AS
    SET NOCOUNT ON
    DECLARE @WebId uniqueidentifier
    SELECT
        @WebId = WebId
    FROM
        Docs
    WHERE
        SiteId = @WebSiteId AND
        DirName = @WebDirName AND
        LeafName = @WebLeafName AND
        Type = 2 
    DECLARE @ret int
    EXEC @ret = proc_ReturnWebMetainfo @WebId
    IF @ret <> 0
        RETURN @ret
    EXEC @ret = proc_GetTpWebMetaData @WebSiteId, @WebDirName, 
        @WebLeafName, @DGCacheVersion, @SystemId
    RETURN @ret

GO
