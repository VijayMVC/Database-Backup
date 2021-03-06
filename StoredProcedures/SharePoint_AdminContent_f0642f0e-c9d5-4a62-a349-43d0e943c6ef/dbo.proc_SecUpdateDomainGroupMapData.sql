/****** Object:  StoredProcedure [dbo].[proc_SecUpdateDomainGroupMapData]    Script Date: 5/15/2018 12:12:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecUpdateDomainGroupMapData(
    @SiteId uniqueidentifier,
    @CacheVersion bigint,
    @DomainGroupMapCache image)
AS
    SET NOCOUNT ON
    UPDATE
        Sites
    SET
        DomainGroupMapCacheVersion = @CacheVersion,
        DomainGroupMapCache = @DomainGroupMapCache
    WHERE
        Id = @SiteId
    RETURN 0

GO
