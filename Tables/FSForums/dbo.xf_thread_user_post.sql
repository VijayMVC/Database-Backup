/****** Object:  Table [dbo].[xf_thread_user_post]    Script Date: 5/15/2018 12:00:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_thread_user_post](
	[thread_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[post_count] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_thread_user_post_thread_id] PRIMARY KEY CLUSTERED 
(
	[thread_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [user_id]    Script Date: 5/15/2018 12:00:37 PM ******/
CREATE NONCLUSTERED INDEX [user_id] ON [dbo].[xf_thread_user_post]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
