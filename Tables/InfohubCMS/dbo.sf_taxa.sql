/****** Object:  Table [dbo].[sf_taxa]    Script Date: 5/15/2018 12:02:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_taxa](
	[url_name_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[title_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[taxonomy_id] [uniqueidentifier] NULL,
	[show_in_navigation] [tinyint] NOT NULL,
	[render_as_link] [tinyint] NOT NULL,
	[ordinal] [real] NOT NULL,
	[nme] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified] [datetime] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[description_] [nvarchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[app_name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[parent_id] [uniqueidentifier] NULL,
	[voa_class] [int] NOT NULL,
	[voa_version] [smallint] NOT NULL,
	[fct_txn_fct_tx_id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_taxa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_taxa_fct_txn_fct_tx_id]    Script Date: 5/15/2018 12:02:04 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_taxa_fct_txn_fct_tx_id] ON [dbo].[sf_taxa]
(
	[fct_txn_fct_tx_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_sf_taxa_parent_id]    Script Date: 5/15/2018 12:02:04 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_taxa_parent_id] ON [dbo].[sf_taxa]
(
	[parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_sf_taxa_taxonomy_id]    Script Date: 5/15/2018 12:02:04 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_taxa_taxonomy_id] ON [dbo].[sf_taxa]
(
	[taxonomy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
