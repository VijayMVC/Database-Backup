/****** Object:  View [bix].[vw_SSISPackageLayout_59]    Script Date: 5/15/2018 12:14:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [bix].[vw_SSISPackageLayout_59]
AS
(
    SELECT 
        [LayoutID],
        [PackageID],
        [PackageName],
        [LayoutXML],
        [TasklistXML],
        [CreatedOn],
        [LastUpdatedOn],
        [DFLayoutXML]
    FROM [dbo].[SSISPackageLayout]
)
GO
