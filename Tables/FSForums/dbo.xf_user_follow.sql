/****** Object:  Table [dbo].[xf_user_follow]    Script Date: 5/15/2018 12:00:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_user_follow](
	[user_id] [bigint] NOT NULL,
	[follow_user_id] [bigint] NOT NULL,
	[follow_date] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_user_follow_user_id] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[follow_user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [follow_user_id]    Script Date: 5/15/2018 12:00:40 PM ******/
CREATE NONCLUSTERED INDEX [follow_user_id] ON [dbo].[xf_user_follow]
(
	[follow_user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_user_follow] ADD  DEFAULT ((0)) FOR [follow_date]
GO
