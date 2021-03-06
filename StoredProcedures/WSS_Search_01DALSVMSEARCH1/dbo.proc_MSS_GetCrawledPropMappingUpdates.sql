/****** Object:  StoredProcedure [dbo].[proc_MSS_GetCrawledPropMappingUpdates]    Script Date: 5/15/2018 12:13:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetCrawledPropMappingUpdates
@UpDate datetime
AS
    SELECT
        map.pid, map.mappingorder, map.crawledPropertyid  
    FROM
        dbo.MSSSchemaPropertyMappings AS map
    INNER JOIN     
        dbo.MSSCrawledProperties AS cp
    ON
        map.crawledPropertyid = cp.crawledPropertyid
    WHERE
        ( cp.LastModified > @UpDate  )

GO
