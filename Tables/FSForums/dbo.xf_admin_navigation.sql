/****** Object:  Table [dbo].[xf_admin_navigation]    Script Date: 5/15/2018 12:00:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_admin_navigation](
	[navigation_id] [varbinary](25) NOT NULL,
	[parent_navigation_id] [varbinary](25) NOT NULL,
	[display_order] [bigint] NOT NULL,
	[link] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[admin_permission_id] [varbinary](25) NOT NULL,
	[debug_only] [tinyint] NOT NULL,
	[hide_no_children] [tinyint] NOT NULL,
	[addon_id] [varbinary](25) NOT NULL,
 CONSTRAINT [PK_xf_admin_navigation_navigation_id] PRIMARY KEY CLUSTERED 
(
	[navigation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [parent_navigation_id_display_order]    Script Date: 5/15/2018 12:00:14 PM ******/
CREATE NONCLUSTERED INDEX [parent_navigation_id_display_order] ON [dbo].[xf_admin_navigation]
(
	[parent_navigation_id] ASC,
	[display_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_admin_navigation] ADD  DEFAULT ((0)) FOR [display_order]
ALTER TABLE [dbo].[xf_admin_navigation] ADD  DEFAULT (N'') FOR [link]
ALTER TABLE [dbo].[xf_admin_navigation] ADD  DEFAULT (0x) FOR [admin_permission_id]
ALTER TABLE [dbo].[xf_admin_navigation] ADD  DEFAULT ((0)) FOR [debug_only]
ALTER TABLE [dbo].[xf_admin_navigation] ADD  DEFAULT ((0)) FOR [hide_no_children]
ALTER TABLE [dbo].[xf_admin_navigation] ADD  DEFAULT (0x) FOR [addon_id]
GO
