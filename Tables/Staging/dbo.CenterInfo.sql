/****** Object:  Table [dbo].[CenterInfo]    Script Date: 5/15/2018 12:06:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CenterInfo](
	[StoreNumber] [int] NOT NULL,
	[fimCenterInfo_Id] [numeric](20, 0) NULL,
	[referenceId] [bigint] NULL,
	[franchiseeName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[responseData_Id] [numeric](20, 0) NULL
) ON [PRIMARY]

GO
