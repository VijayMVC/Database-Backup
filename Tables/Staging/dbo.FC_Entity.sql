/****** Object:  Table [dbo].[FC_Entity]    Script Date: 5/15/2018 12:06:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FC_Entity](
	[fimEntity_Id] [numeric](20, 0) NULL,
	[referenceId] [int] NULL,
	[fimTtEntityName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimEntityDetail0] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCbCountryOfFormation] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCbStateOfFormation] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTtTaxpayer] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCbEntityType] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCbOtherEntityType] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_articlesIncorporatedDate1773919085] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_certificateIncorporationDate609202438] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_bylawsAndStockAgreementsDate528634221] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_assumedName667700708] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_salesTaxNumber1123219650] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_articlesOrigination1923423038] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_operationalAgreement757911390] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_partnerAgreement253961105] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_stockAgreementsDate703635798] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_salesTaxIdNumber592640551] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_assumedName491299128] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_assumedName1151081866] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCenterInfo_Id] [numeric](20, 0) NULL,
	[franchiseeName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
