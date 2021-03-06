/****** Object:  Table [dbo].[log_shipping_primary_secondaries]    Script Date: 5/15/2018 12:02:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[log_shipping_primary_secondaries](
	[primary_id] [uniqueidentifier] NOT NULL,
	[secondary_server] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[secondary_database] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [pklsprimary_secondaries] PRIMARY KEY CLUSTERED 
(
	[primary_id] ASC,
	[secondary_server] ASC,
	[secondary_database] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [nc1lsprimary_secondaries]    Script Date: 5/15/2018 12:02:58 PM ******/
CREATE NONCLUSTERED INDEX [nc1lsprimary_secondaries] ON [dbo].[log_shipping_primary_secondaries]
(
	[primary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
