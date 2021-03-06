/****** Object:  StoredProcedure [dbo].[proc_GetDeadWebInfo]    Script Date: 5/15/2018 12:12:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetDeadWebInfo(
    @SiteId uniqueidentifier
)
AS
    SET NOCOUNT ON
    SELECT 
        CertificationDate, 
        DeadWebNotifyCount
    FROM
        Sites
    WHERE
        Id = @SiteId
    RETURN 0

GO
