/****** Object:  Table [dbo].[xf_permission_combination_user_group]    Script Date: 5/15/2018 12:00:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_permission_combination_user_group](
	[user_group_id] [bigint] NOT NULL,
	[permission_combination_id] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_permission_combination_user_group_user_group_id] PRIMARY KEY CLUSTERED 
(
	[user_group_id] ASC,
	[permission_combination_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [permission_combination_id]    Script Date: 5/15/2018 12:00:28 PM ******/
CREATE NONCLUSTERED INDEX [permission_combination_id] ON [dbo].[xf_permission_combination_user_group]
(
	[permission_combination_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
