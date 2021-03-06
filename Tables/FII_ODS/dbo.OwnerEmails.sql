/****** Object:  Table [dbo].[OwnerEmails]    Script Date: 5/15/2018 11:59:26 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[OwnerEmails](
	[department] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[title] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[displayName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[mail] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StoreNumber] [bigint] NULL,
	[GoldmineId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
