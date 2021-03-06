/****** Object:  Table [dbo].[xf_user_change_log]    Script Date: 5/15/2018 12:00:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_user_change_log](
	[log_id] [bigint] IDENTITY(1226,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[edit_user_id] [bigint] NOT NULL,
	[edit_date] [bigint] NOT NULL,
	[field] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[old_value] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[new_value] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_xf_user_change_log_log_id] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [edit_date]    Script Date: 5/15/2018 12:00:38 PM ******/
CREATE NONCLUSTERED INDEX [edit_date] ON [dbo].[xf_user_change_log]
(
	[edit_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [user_id]    Script Date: 5/15/2018 12:00:38 PM ******/
CREATE NONCLUSTERED INDEX [user_id] ON [dbo].[xf_user_change_log]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_user_change_log] ADD  DEFAULT (N'') FOR [field]
GO
