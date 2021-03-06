/****** Object:  Table [dbo].[xf_draft]    Script Date: 5/15/2018 12:00:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_draft](
	[draft_id] [bigint] IDENTITY(79570,1) NOT NULL,
	[draft_key] [varbinary](75) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[last_update] [bigint] NOT NULL,
	[message] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[extra_data] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_xf_draft_draft_id] PRIMARY KEY CLUSTERED 
(
	[draft_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [xf_draft$draft_key_user] UNIQUE NONCLUSTERED 
(
	[draft_key] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [last_update]    Script Date: 5/15/2018 12:00:20 PM ******/
CREATE NONCLUSTERED INDEX [last_update] ON [dbo].[xf_draft]
(
	[last_update] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
