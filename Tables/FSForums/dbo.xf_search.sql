/****** Object:  Table [dbo].[xf_search]    Script Date: 5/15/2018 12:00:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_search](
	[search_id] [bigint] IDENTITY(37911,1) NOT NULL,
	[search_results] [varbinary](max) NOT NULL,
	[result_count] [int] NOT NULL,
	[search_type] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[search_query] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[search_constraints] [varbinary](max) NOT NULL,
	[search_order] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[search_grouping] [smallint] NOT NULL,
	[user_results] [varbinary](max) NOT NULL,
	[warnings] [varbinary](max) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[search_date] [bigint] NOT NULL,
	[query_hash] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_xf_search_search_id] PRIMARY KEY CLUSTERED 
(
	[search_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [query_hash]    Script Date: 5/15/2018 12:00:32 PM ******/
CREATE NONCLUSTERED INDEX [query_hash] ON [dbo].[xf_search]
(
	[query_hash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [search_date]    Script Date: 5/15/2018 12:00:32 PM ******/
CREATE NONCLUSTERED INDEX [search_date] ON [dbo].[xf_search]
(
	[search_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_search] ADD  DEFAULT ((0)) FOR [search_grouping]
ALTER TABLE [dbo].[xf_search] ADD  DEFAULT (N'') FOR [query_hash]
GO
