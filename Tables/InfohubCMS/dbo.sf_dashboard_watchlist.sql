/****** Object:  Table [dbo].[sf_dashboard_watchlist]    Script Date: 5/15/2018 12:01:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_dashboard_watchlist](
	[user_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[dashboard_log_entry_id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_dashboard_watchlist] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_dshbrd_watch_entry_usr]    Script Date: 5/15/2018 12:01:29 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_dshbrd_watch_entry_usr] ON [dbo].[sf_dashboard_watchlist]
(
	[dashboard_log_entry_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
