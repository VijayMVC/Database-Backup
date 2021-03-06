/****** Object:  StoredProcedure [dbo].[proc_GetSiteDiskUsed]    Script Date: 5/15/2018 12:12:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetSiteDiskUsed(
    @SiteId uniqueidentifier,
    @DiskUsed bigint OUTPUT)
AS
    SET NOCOUNT ON
    SET @DiskUsed = 0    
    SELECT 
        @DiskUsed = @DiskUsed +
            ISNULL(SUM(CAST(ISNULL(Size, 0) AS BIGINT) +
                CAST(ISNULL(MetaInfoSize, 0) AS BIGINT) +
                CAST(ISNULL(UnVersionedMetaInfoSize,0) AS BIGINT) +
                CAST(152 AS BIGINT)),0)
    FROM
        Docs
    WHERE
        SiteId = @SiteId
    SELECT 
        @DiskUsed = @DiskUsed +
            (ISNULL((SUM(CAST((ISNULL(Size, 0) + ISNULL(MetaInfoSize, 0)) AS BIGINT))),0))
    FROM
        DocVersions
    WHERE
        SiteId = @SiteId
    SELECT 
        @DiskUsed = @DiskUsed + (ISNULL((SUM(CAST((ISNULL(tp_Size, 0)) AS BIGINT))),0))
    FROM
        UserDataVersioned
    WHERE
        tp_SiteId = @SiteId
    SELECT 
        @DiskUsed = @DiskUsed + (ISNULL((SUM(CAST((ISNULL(tp_Size, 0)) AS BIGINT))),0))
    FROM
        WebParts
    WHERE
        tp_SiteId = @SiteId AND
        tp_Deleted = 0
    SELECT 
        @DiskUsed = @DiskUsed + (ISNULL((SUM(CAST((ISNULL(tp_Size, 0)) AS BIGINT))),0))
    FROM
        Personalization
    WHERE
        tp_SiteId = @SiteId AND
        tp_Deleted = 0
    SELECT 
        @DiskUsed = @DiskUsed + (ISNULL((SUM(CAST((ISNULL(Size, 0)) AS BIGINT))),0))
    FROM
        ComMD
    WHERE
        SiteId = @SiteId
    SELECT 
        @DiskUsed = @DiskUsed + (ISNULL((SUM(CAST((ISNULL(Size, 0)) AS BIGINT))),0))
    FROM
        ContentTypes
    WHERE
        SiteId = @SiteId
    SELECT 
        @DiskUsed = @DiskUsed + ISNULL(SUM(Size),0)
    FROM
        RecycleBin
    WHERE
        SiteId = @SiteId AND
        BinId = 1
    SELECT
        @DiskUsed = @DiskUsed + ISNULL(SUM(DiskUsed),0)
    FROM    
        SiteQuota
    WHERE
        SiteId = @SiteId
    RETURN 0

GO
