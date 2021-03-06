/****** Object:  Table [dbo].[xf_user_group_promotion_log]    Script Date: 5/15/2018 12:00:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_user_group_promotion_log](
	[promotion_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[promotion_date] [bigint] NOT NULL,
	[promotion_state] [nvarchar](9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_xf_user_group_promotion_log_promotion_id] PRIMARY KEY CLUSTERED 
(
	[promotion_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [promotion_date]    Script Date: 5/15/2018 12:00:40 PM ******/
CREATE NONCLUSTERED INDEX [promotion_date] ON [dbo].[xf_user_group_promotion_log]
(
	[promotion_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [user_id_date]    Script Date: 5/15/2018 12:00:40 PM ******/
CREATE NONCLUSTERED INDEX [user_id_date] ON [dbo].[xf_user_group_promotion_log]
(
	[user_id] ASC,
	[promotion_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_user_group_promotion_log] ADD  DEFAULT (N'automatic') FOR [promotion_state]
GO
