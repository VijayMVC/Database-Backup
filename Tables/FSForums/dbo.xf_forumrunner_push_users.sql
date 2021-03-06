/****** Object:  Table [dbo].[xf_forumrunner_push_users]    Script Date: 5/15/2018 12:00:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_forumrunner_push_users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[fr_username] [varchar](45) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[last_login] [datetime2](0) NULL,
	[b] [tinyint] NOT NULL,
 CONSTRAINT [PK_xf_forumrunner_push_users_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[xf_forumrunner_push_users] ADD  DEFAULT (NULL) FOR [last_login]
ALTER TABLE [dbo].[xf_forumrunner_push_users] ADD  DEFAULT ((0)) FOR [b]
GO
