/****** Object:  Table [dbo].[sf_dashboard_log]    Script Date: 5/15/2018 12:01:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_dashboard_log](
	[user_id] [uniqueidentifier] NULL,
	[item_title] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[timestamp] [datetime] NOT NULL,
	[status] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[site_id] [uniqueidentifier] NULL,
	[language] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[item_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[item_provider] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[item_id] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_dashboard_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_dashboard_log_id_type]    Script Date: 5/15/2018 12:01:29 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_dashboard_log_id_type] ON [dbo].[sf_dashboard_log]
(
	[item_id] ASC,
	[item_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_sf_dashboard_log_time]    Script Date: 5/15/2018 12:01:29 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_dashboard_log_time] ON [dbo].[sf_dashboard_log]
(
	[timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
