/****** Object:  View [dbo].[vRawIndustryMappingDim]    Script Date: 5/15/2018 12:13:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[vRawIndustryMappingDim]
AS
SELECT	SourceIndustryType	AS Industry
	,	[1stPass_IndustryKey]
	,	[2ndPass_IndustryKey]
	,	[3rdPass_IndustryKey]
	,	Final_IndustryKey	AS IndustryKey
	,	I1.IndustryName AS IndustryMatch1
	,	I2.IndustryName AS IndustryMatch2
	,	I3.IndustryName AS IndustryMatch3
	,	I.IndustryName	AS IndustryMatch

	FROM Fuzzy.IndustryMapping	IM
		LEFT JOIN CustomerIndustryDim I1 ON I1.IndustryKey = [1stPass_IndustryKey]
		LEFT JOIN CustomerIndustrydim I2 ON I2.IndustryKey = [2ndPass_IndustryKey]
		LEFT JOIN CustomerIndustryDim I3 ON I3.IndustryKey = [3rdPass_IndustryKey]
		LEFT JOIN CustomerIndustryDim I ON I.IndustryKey = Final_IndustryKey

GO
