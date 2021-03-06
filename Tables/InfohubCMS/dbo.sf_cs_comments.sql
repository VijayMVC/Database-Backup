/****** Object:  Table [dbo].[sf_cs_comments]    Script Date: 5/15/2018 12:01:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_cs_comments](
	[status] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[resolve_key] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[rating] [numeric](20, 10) NULL,
	[parent_thread_id] [uniqueidentifier] NOT NULL,
	[message] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified_by_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified_by_email] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified_by] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[date_created] [datetime] NULL,
	[custom_data] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[author_name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[author_ip_address] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[author_id] [uniqueidentifier] NULL,
	[author_email] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_cs_comments] PRIMARY KEY CLUSTERED 
(
	[resolve_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [idx_sf_cs_comments_thread]    Script Date: 5/15/2018 12:01:28 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cs_comments_thread] ON [dbo].[sf_cs_comments]
(
	[parent_thread_id] ASC,
	[date_created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
