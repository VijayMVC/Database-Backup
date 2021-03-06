/****** Object:  StoredProcedure [dbo].[proc_MSS_GetCrawledPropertyCategoriesBasic]    Script Date: 5/15/2018 12:11:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetCrawledPropertyCategoriesBasic
AS
SELECT Propset,
             CategoryName,
             CrawledPropertyCount,
             DiscoverNewProperties,
             MapToContents,
             FullTextQueriable,
             Retrievable,
             URINamespace
   FROM MSSCrawledPropCategory
   ORDER BY CategoryName

GO
