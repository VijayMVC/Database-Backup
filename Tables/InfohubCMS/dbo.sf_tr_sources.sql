/****** Object:  Table [dbo].[sf_tr_sources]    Script Date: 5/15/2018 12:02:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_tr_sources](
	[title] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[src_lang] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[site_id] [uniqueidentifier] NULL,
	[root_key] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[parnt_id] [uniqueidentifier] NULL,
	[item_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[item_prvdr] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[item_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_tr_sources] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_itm_descrtn]    Script Date: 5/15/2018 12:02:06 PM ******/
CREATE NONCLUSTERED INDEX [idx_itm_descrtn] ON [dbo].[sf_tr_sources]
(
	[item_id] ASC,
	[item_type] ASC,
	[item_prvdr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
