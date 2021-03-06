/****** Object:  Table [dbo].[fimEntity]    Script Date: 5/15/2018 12:00:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[fimEntity](
	[referenceId] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCbEntityType] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTtEntityName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTtTaxpayer] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCbCountryOfFormation] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCbStateOfFormation] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFranchisee_Id] [numeric](20, 0) NULL
) ON [PRIMARY]

GO
