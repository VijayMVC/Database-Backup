/****** Object:  Table [dbo].[xf_admin_log]    Script Date: 5/15/2018 12:00:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_admin_log](
	[admin_log_id] [bigint] IDENTITY(15936,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[request_date] [bigint] NOT NULL,
	[request_url] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[request_data] [varbinary](max) NOT NULL,
	[ip_address] [varbinary](16) NOT NULL,
 CONSTRAINT [PK_xf_admin_log_admin_log_id] PRIMARY KEY CLUSTERED 
(
	[admin_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [request_date]    Script Date: 5/15/2018 12:00:14 PM ******/
CREATE NONCLUSTERED INDEX [request_date] ON [dbo].[xf_admin_log]
(
	[request_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [user_id_request_date]    Script Date: 5/15/2018 12:00:14 PM ******/
CREATE NONCLUSTERED INDEX [user_id_request_date] ON [dbo].[xf_admin_log]
(
	[user_id] ASC,
	[request_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_admin_log] ADD  DEFAULT (0x) FOR [ip_address]
GO
