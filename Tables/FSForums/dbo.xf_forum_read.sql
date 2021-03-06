/****** Object:  Table [dbo].[xf_forum_read]    Script Date: 5/15/2018 12:00:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_forum_read](
	[forum_read_id] [bigint] IDENTITY(221716,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[node_id] [bigint] NOT NULL,
	[forum_read_date] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_forum_read_forum_read_id] PRIMARY KEY CLUSTERED 
(
	[forum_read_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [xf_forum_read$user_id_node_id] UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[node_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [forum_read_date]    Script Date: 5/15/2018 12:00:22 PM ******/
CREATE NONCLUSTERED INDEX [forum_read_date] ON [dbo].[xf_forum_read]
(
	[forum_read_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [node_id]    Script Date: 5/15/2018 12:00:22 PM ******/
CREATE NONCLUSTERED INDEX [node_id] ON [dbo].[xf_forum_read]
(
	[node_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
