/****** Object:  Table [dbo].[sf_taxonomy_statistic]    Script Date: 5/15/2018 12:02:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_taxonomy_statistic](
	[taxonomy_id] [uniqueidentifier] NULL,
	[taxon_id] [uniqueidentifier] NULL,
	[statistic_type] [int] NOT NULL,
	[marked_items_count] [bigint] NOT NULL,
	[item_provider_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[id] [uniqueidentifier] NOT NULL,
	[data_item_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_taxonomy_statistic] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_taxonomy_statistic]    Script Date: 5/15/2018 12:02:06 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_taxonomy_statistic] ON [dbo].[sf_taxonomy_statistic]
(
	[data_item_type] ASC,
	[taxon_id] ASC,
	[statistic_type] ASC,
	[item_provider_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
