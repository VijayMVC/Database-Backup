/****** Object:  Table [dbo].[xf_moderator_content]    Script Date: 5/15/2018 12:00:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_moderator_content](
	[moderator_id] [bigint] IDENTITY(1,1) NOT NULL,
	[content_type] [varbinary](25) NOT NULL,
	[content_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[moderator_permissions] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_xf_moderator_content_moderator_id] PRIMARY KEY CLUSTERED 
(
	[moderator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [xf_moderator_content$content_user_id] UNIQUE NONCLUSTERED 
(
	[content_type] ASC,
	[content_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [user_id]    Script Date: 5/15/2018 12:00:25 PM ******/
CREATE NONCLUSTERED INDEX [user_id] ON [dbo].[xf_moderator_content]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
