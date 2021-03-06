/****** Object:  Table [dbo].[OwnerPercent]    Script Date: 5/15/2018 12:06:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[OwnerPercent](
	[StoreNumber] [int] NOT NULL,
	[owners_Id] [numeric](20, 0) NULL,
	[referenceId] [bigint] NULL,
	[storeOwnedPercentage] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[isManager] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCenterInfo_Id] [numeric](20, 0) NULL
) ON [PRIMARY]

GO
