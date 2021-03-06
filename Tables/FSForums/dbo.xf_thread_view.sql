/****** Object:  Table [dbo].[xf_thread_view]    Script Date: 5/15/2018 12:00:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_thread_view](
	[thread_id] [bigint] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [thread_id]    Script Date: 5/15/2018 12:00:37 PM ******/
CREATE NONCLUSTERED INDEX [thread_id] ON [dbo].[xf_thread_view]
(
	[thread_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
