/****** Object:  StoredProcedure [dbo].[proc_GetWebFeatureList]    Script Date: 5/15/2018 12:12:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetWebFeatureList(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier)    
AS
    SET NOCOUNT ON
    SELECT
        FeatureId
    FROM
        Features
    WHERE
        SiteId = @SiteId AND
        WebId = @WebId
    RETURN 0 

GO
