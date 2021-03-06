/****** Object:  StoredProcedure [dbo].[proc_MSS_GetLocationConfigurations]    Script Date: 5/15/2018 12:11:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetLocationConfigurations
 AS

SET NOCOUNT ON

select L.Id, L.InternalName, L.DisplayName, L.AdminDescription,
       L.LocationType, L.Author, L.Version, L.IsDeletable, L.IsPrefixPattern, L.QueryReformatPattern, L.PropertySchema, L.QueryRestriction,
       L.KindsOfResults, L.Languages, L.IsRestricted, L.AllowedSiteCollectionGuids, L.CreationDate, L.LastModifiedDate,
       A.Type, A.Data
from dbo.MSSLocations As L
Inner Join dbo.MSSLocationAuthentication As A ON L.Id = A.LocationId

select  L.InternalName, U.LocationId, U.UrlTemplate, U.TemplateType
from dbo.MSSLocationUrlTemplates As U
Inner Join dbo.MSSLocations AS L On L.Id = U.LocationId

select LastUpdate,UseCrawlProxy
from dbo.MSSLocationSystem

SET NOCOUNT OFF

GO
