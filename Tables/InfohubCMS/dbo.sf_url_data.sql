/****** Object:  Table [dbo].[sf_url_data]    Script Date: 5/15/2018 12:02:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_url_data](
	[url] [nvarchar](510) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[redirect] [tinyint] NOT NULL,
	[qery] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified] [datetime] NULL,
	[is_default] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[disabled] [tinyint] NOT NULL,
	[culture] [int] NOT NULL,
	[app_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
	[voa_class] [int] NOT NULL,
	[content_id] [uniqueidentifier] NULL,
	[id2] [uniqueidentifier] NULL,
	[item_type] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_url_data] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_url_data]    Script Date: 5/15/2018 12:02:07 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_url_data] ON [dbo].[sf_url_data]
(
	[url] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_sf_url_data_content_id]    Script Date: 5/15/2018 12:02:07 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_url_data_content_id] ON [dbo].[sf_url_data]
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_sf_url_data_id2]    Script Date: 5/15/2018 12:02:07 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_url_data_id2] ON [dbo].[sf_url_data]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_url_type]    Script Date: 5/15/2018 12:02:07 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_url_type] ON [dbo].[sf_url_data]
(
	[item_type] ASC,
	[url] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
