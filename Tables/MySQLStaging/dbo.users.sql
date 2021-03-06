/****** Object:  Table [dbo].[users]    Script Date: 5/15/2018 12:04:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[users](
	[users_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[user_types_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[franchise_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[user_login_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[accounts_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[role_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[role_permission_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[job_title] [nvarchar](45) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[division_name] [nvarchar](45) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[first_name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[initial] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[birth_date] [date] NULL,
	[active] [smallint] NOT NULL,
	[url] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created_on] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_users_users_id] PRIMARY KEY CLUSTERED 
(
	[users_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [accounts_id]    Script Date: 5/15/2018 12:04:33 PM ******/
CREATE NONCLUSTERED INDEX [accounts_id] ON [dbo].[users]
(
	[accounts_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [franchise_id]    Script Date: 5/15/2018 12:04:33 PM ******/
CREATE NONCLUSTERED INDEX [franchise_id] ON [dbo].[users]
(
	[franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_users_user_types_id_accounts_id_includes]    Script Date: 5/15/2018 12:04:33 PM ******/
CREATE NONCLUSTERED INDEX [idx_users_user_types_id_accounts_id_includes] ON [dbo].[users]
(
	[user_types_id] ASC,
	[accounts_id] ASC
)
INCLUDE ( 	[users_id],
	[first_name],
	[last_name],
	[active]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [user_login_id]    Script Date: 5/15/2018 12:04:33 PM ******/
CREATE NONCLUSTERED INDEX [user_login_id] ON [dbo].[users]
(
	[user_login_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [role_id]
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [job_title]
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [division_name]
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [first_name]
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [initial]
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [last_name]
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [birth_date]
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [url]
GO
