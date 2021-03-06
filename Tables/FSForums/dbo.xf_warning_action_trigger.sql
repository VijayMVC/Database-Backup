/****** Object:  Table [dbo].[xf_warning_action_trigger]    Script Date: 5/15/2018 12:00:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_warning_action_trigger](
	[action_trigger_id] [bigint] IDENTITY(1,1) NOT NULL,
	[warning_action_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[trigger_points] [int] NOT NULL,
	[action_date] [bigint] NOT NULL,
	[action] [varbinary](25) NOT NULL,
	[min_unban_date] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_warning_action_trigger_action_trigger_id] PRIMARY KEY CLUSTERED 
(
	[action_trigger_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [user_id_points]    Script Date: 5/15/2018 12:00:42 PM ******/
CREATE NONCLUSTERED INDEX [user_id_points] ON [dbo].[xf_warning_action_trigger]
(
	[user_id] ASC,
	[trigger_points] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_warning_action_trigger] ADD  DEFAULT ((0)) FOR [min_unban_date]
GO
