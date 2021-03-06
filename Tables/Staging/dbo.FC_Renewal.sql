/****** Object:  Table [dbo].[FC_Renewal]    Script Date: 5/15/2018 12:06:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FC_Renewal](
	[referenceId] [int] NULL,
	[fimCbCurrentStatus] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCbOtherCurrentStatus] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimDdAsOf] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTtPersonSigning] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTtTitle] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimDdNewExpirationDate] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimDdNinetyDayNotice] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimDdRenewalPackageSent] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTtRenewalMaterials] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTaMissingDocs] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTaNotes] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_termFirstRenewal591045143] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_feeFirstRenewal1236631211] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_termSecondRenewal134855925] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_feeSecondRenewal1329395331] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_initialterm1284365358] [tinyint] NULL,
	[fimCenterInfo_Id] [numeric](20, 0) NULL,
	[franchiseeName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
