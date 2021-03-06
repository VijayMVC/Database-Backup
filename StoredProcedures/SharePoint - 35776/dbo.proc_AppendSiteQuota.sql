/****** Object:  StoredProcedure [dbo].[proc_AppendSiteQuota]    Script Date: 5/15/2018 12:11:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_AppendSiteQuota
    @SiteId uniqueidentifier,
    @cbDelta bigint,
    @UpdateTimeStamp bit
AS
    SET NOCOUNT ON
    SELECT 
        @SiteId = Id
    FROM 
        Sites WITH(XLOCK)
    WHERE Id = @SiteId
    INSERT INTO
        SiteQuota
        (SiteId, DiskUsed, UpdateTimeStamp)
    VALUES
        (@SiteId, @cbDelta, @UpdateTimeStamp)    

GO
