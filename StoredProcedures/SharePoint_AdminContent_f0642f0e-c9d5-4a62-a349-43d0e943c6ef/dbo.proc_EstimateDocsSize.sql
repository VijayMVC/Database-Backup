/****** Object:  StoredProcedure [dbo].[proc_EstimateDocsSize]    Script Date: 5/15/2018 12:12:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_EstimateDocsSize(
    @ListId uniqueidentifier,
    @WebId  uniqueidentifier,
    @SiteId uniqueidentifier,
    @MaxSize bigint,
    @IncludeListDocs bit = 1)
AS
    DECLARE @SiteSize bigint
    SELECT
        @SiteSize = DiskUsed
    FROM
        Sites
    WHERE
        ID = @SiteId
    IF @SiteSize <= @MaxSize
        SELECT @SiteSize
    ELSE
    BEGIN
        DECLARE @DirRoot     nvarchar(260)
        DECLARE @DirChildren nvarchar(1024)
        IF @ListId IS NULL
            SELECT
                @DirRoot = FullUrl
            FROM
                Webs
            WHERE
                Id = @WebId
        ELSE
            SELECT
                @DirRoot = CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END
            FROM
                Docs INNER JOIN Lists ON Docs.Id = Lists.tp_RootFolder
            WHERE
                Lists.tp_ID = @ListId AND
                Lists.tp_WebId = @WebId
        IF DATALENGTH(@DirRoot) = 0
            SET @DirChildren = N'%'
        ELSE
            EXEC proc_EscapeForLike @DirRoot, @DirChildren OUTPUT, 1
        IF @IncludeListDocs = 1
        BEGIN
            SELECT
                (ISNULL((SUM(CAST((Size) AS BIGINT))),0))
            FROM
                Docs WITH (NOLOCK)
            WHERE
                SiteId = @SiteId AND
                (DirName = @DirRoot OR DirName LIKE @DirChildren) AND
                WebId  = @WebId
        END
        ELSE
        BEGIN
            SELECT
                (ISNULL((SUM(CAST((Size) AS BIGINT))),0))
            FROM
                Docs WITH (NOLOCK)
            WHERE
                SiteId = @SiteId AND
                (DirName = @DirRoot OR DirName LIKE @DirChildren) AND
                WebId  = @WebId AND
                ListId IS NULL  
        END                   
    END

GO
