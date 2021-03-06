/****** Object:  Table [dbo].[FC_Remark]    Script Date: 5/15/2018 12:06:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FC_Remark](
	[referenceId] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[dateAdded] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[author] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[remarks] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCenterInfo_Id] [numeric](20, 0) NULL,
	[franchiseeName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
