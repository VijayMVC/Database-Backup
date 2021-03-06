/****** Object:  Table [dbo].[sf_approval_tracking_record]    Script Date: 5/15/2018 12:01:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_approval_tracking_record](
	[workflow_item_id] [uniqueidentifier] NULL,
	[user_id] [uniqueidentifier] NULL,
	[status] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[note] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[culture] [int] NOT NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_approval_tracking_record] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_dt_crtd]    Script Date: 5/15/2018 12:01:23 PM ******/
CREATE NONCLUSTERED INDEX [idx_dt_crtd] ON [dbo].[sf_approval_tracking_record]
(
	[date_created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_wrk_itm_id]    Script Date: 5/15/2018 12:01:23 PM ******/
CREATE NONCLUSTERED INDEX [idx_wrk_itm_id] ON [dbo].[sf_approval_tracking_record]
(
	[workflow_item_id] ASC,
	[culture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
