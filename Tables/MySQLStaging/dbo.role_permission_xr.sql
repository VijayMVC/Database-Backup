/****** Object:  Table [dbo].[role_permission_xr]    Script Date: 5/15/2018 12:04:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[role_permission_xr](
	[role_permission_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[permission_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[role_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[users_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[franchise_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_role_permission_xr_role_permission_id] PRIMARY KEY CLUSTERED 
(
	[role_permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [franchise_id]    Script Date: 5/15/2018 12:04:29 PM ******/
CREATE NONCLUSTERED INDEX [franchise_id] ON [dbo].[role_permission_xr]
(
	[franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [permission_id]    Script Date: 5/15/2018 12:04:29 PM ******/
CREATE NONCLUSTERED INDEX [permission_id] ON [dbo].[role_permission_xr]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [users_id]    Script Date: 5/15/2018 12:04:29 PM ******/
CREATE NONCLUSTERED INDEX [users_id] ON [dbo].[role_permission_xr]
(
	[users_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[role_permission_xr] ADD  DEFAULT (NULL) FOR [users_id]
ALTER TABLE [dbo].[role_permission_xr] ADD  DEFAULT (NULL) FOR [franchise_id]
GO
