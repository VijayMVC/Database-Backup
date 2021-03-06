/****** Object:  Table [dbo].[sf_cnt_locations]    Script Date: 5/15/2018 12:01:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_cnt_locations](
	[site_id] [uniqueidentifier] NULL,
	[redirect_page_id] [uniqueidentifier] NULL,
	[priority] [int] NOT NULL,
	[page_id] [uniqueidentifier] NULL,
	[lang] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[item_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[item_provider] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[item_descendant_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[id] [uniqueidentifier] NOT NULL,
	[app_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_cnt_locations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_cnt_locations_type]    Script Date: 5/15/2018 12:01:26 PM ******/
CREATE NONCLUSTERED INDEX [idx_cnt_locations_type] ON [dbo].[sf_cnt_locations]
(
	[app_name] ASC,
	[item_type] ASC,
	[item_provider] ASC,
	[priority] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
