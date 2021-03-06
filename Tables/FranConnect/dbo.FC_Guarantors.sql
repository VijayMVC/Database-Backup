/****** Object:  Table [dbo].[FC_Guarantors]    Script Date: 5/15/2018 12:00:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FC_Guarantors](
	[referenceId] [bigint] NULL,
	[fimCbtGurantorTitle] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTtFirstName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTtLastName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCbEntityType] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCbOtherEntityType] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCbResidency] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTtPercentage] [tinyint] NULL,
	[fimGuarantor0] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTaComments] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_personalEmailAddress1590887519] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCenterInfo_Id] [numeric](20, 0) NULL,
	[franchiseeName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
