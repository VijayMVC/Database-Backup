/****** Object:  Table [dbo].[xf_ip]    Script Date: 5/15/2018 12:00:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_ip](
	[ip_id] [bigint] IDENTITY(92942,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[content_type] [varbinary](25) NOT NULL,
	[content_id] [bigint] NOT NULL,
	[action] [varbinary](25) NOT NULL,
	[log_date] [bigint] NOT NULL,
	[ip] [varbinary](16) NOT NULL,
 CONSTRAINT [PK_xf_ip_ip_id] PRIMARY KEY CLUSTERED 
(
	[ip_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [content_type_content_id]    Script Date: 5/15/2018 12:00:23 PM ******/
CREATE NONCLUSTERED INDEX [content_type_content_id] ON [dbo].[xf_ip]
(
	[content_type] ASC,
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [ip_log_date]    Script Date: 5/15/2018 12:00:23 PM ******/
CREATE NONCLUSTERED INDEX [ip_log_date] ON [dbo].[xf_ip]
(
	[ip] ASC,
	[log_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [log_date]    Script Date: 5/15/2018 12:00:23 PM ******/
CREATE NONCLUSTERED INDEX [log_date] ON [dbo].[xf_ip]
(
	[log_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [user_id_log_date]    Script Date: 5/15/2018 12:00:23 PM ******/
CREATE NONCLUSTERED INDEX [user_id_log_date] ON [dbo].[xf_ip]
(
	[user_id] ASC,
	[log_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_ip] ADD  DEFAULT (0x) FOR [action]
GO
