/****** Object:  Table [dbo].[sf_tr_trnsltns]    Script Date: 5/15/2018 12:02:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_tr_trnsltns](
	[unique_item_key] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[trns_status] [int] NOT NULL,
	[trg_lang] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[src_vrsn_type] [int] NOT NULL,
	[tr_source_id] [uniqueidentifier] NULL,
	[owner] [uniqueidentifier] NULL,
	[metadata] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[job_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[ext_status] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[external_id] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[err_msg] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[date_modified] [datetime] NULL,
	[date_created] [datetime] NOT NULL,
	[act_src_lang] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_tr_trnsltns] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [idx_sf_tr_trnsltns_tr_surce_id]    Script Date: 5/15/2018 12:02:06 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_tr_trnsltns_tr_surce_id] ON [dbo].[sf_tr_trnsltns]
(
	[tr_source_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_trns_extrnl_id]    Script Date: 5/15/2018 12:02:06 PM ******/
CREATE NONCLUSTERED INDEX [idx_trns_extrnl_id] ON [dbo].[sf_tr_trnsltns]
(
	[external_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_trns_status]    Script Date: 5/15/2018 12:02:06 PM ******/
CREATE NONCLUSTERED INDEX [idx_trns_status] ON [dbo].[sf_tr_trnsltns]
(
	[trns_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_trns_unq_item_trglang]    Script Date: 5/15/2018 12:02:06 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_trns_unq_item_trglang] ON [dbo].[sf_tr_trnsltns]
(
	[unique_item_key] ASC,
	[trg_lang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
