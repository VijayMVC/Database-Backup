/****** Object:  View [dbo].[vRawIndustryDim]    Script Date: 5/15/2018 12:13:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[vRawIndustryDim]
AS
SELECT	I.T_IndustryTypeRaw AS RawIndustryName
	,	I.T_IndustryType AS Industry

	FROM (SELECT DISTINCT T_IndustryTypeRaw, T_IndustryType FROM dbo.CustomerDim) AS I

GO
