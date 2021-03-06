/****** Object:  Table [dbo].[sf_content_relation]    Script Date: 5/15/2018 12:01:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_content_relation](
	[subject_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[subject_provider] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[subject_id] [uniqueidentifier] NULL,
	[relation_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[object_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[object_provider] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[object_id] [uniqueidentifier] NULL,
	[key] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_content_relation] PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_cntnt_rltn_obj]    Script Date: 5/15/2018 12:01:28 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cntnt_rltn_obj] ON [dbo].[sf_content_relation]
(
	[object_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_sf_cntnt_rltn_subj]    Script Date: 5/15/2018 12:01:28 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cntnt_rltn_subj] ON [dbo].[sf_content_relation]
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
