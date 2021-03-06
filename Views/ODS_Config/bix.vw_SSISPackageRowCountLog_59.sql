/****** Object:  View [bix].[vw_SSISPackageRowCountLog_59]    Script Date: 5/15/2018 12:14:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [bix].[vw_SSISPackageRowCountLog_59]
AS
(
    SELECT 
        [LogID],
        [ExecutionID],
        [SourceID],
        [SourceName],
        [ComponentTypeCode],
        [ComponentUniqueID],
        [ComponentTypeName],
        [ComponentName],
        [DataObjectType],
        [DataObjectName],
        [DataObjectQuery],
        [DataObjectConnectionString],
        [DataObjectConnectionName],
        [DataObjectDataSource],
        [DataObjectUserName],
        [DataObjectCatalog],
        [RecordCount],
        [LogDate],
        [ParentLogID]
    FROM [dbo].[SSISPackageRowCountLog]
)
GO
