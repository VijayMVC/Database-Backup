/****** Object:  StoredProcedure [dbo].[proc_MSS_GetCrawledPropertiesForUriMapping]    Script Date: 5/15/2018 12:13:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetCrawledPropertiesForUriMapping
AS
    SELECT 
	C.CategoryName,
        CP.Propset, 
        CP.PropertyName,        
        CP.PropertyNameIsEnum,        
        CP.IsMappedToContent,
        CP.IsSampleCacheFull,
        CP.VariantType,
        CP.CrawledPropertyId,        
        CP.URI
    FROM 
        dbo.MSSCrawledProperties as CP
    Inner Join MSSCrawledPropCategory as C
	On CP.Propset = C.Propset
    WHERE CP.URI != ''

GO
