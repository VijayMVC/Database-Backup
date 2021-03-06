/****** Object:  Table [dbo].[xf_addon]    Script Date: 5/15/2018 12:00:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_addon](
	[addon_id] [varbinary](25) NOT NULL,
	[title] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[version_string] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[version_id] [bigint] NOT NULL,
	[url] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[install_callback_class] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[install_callback_method] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[uninstall_callback_class] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[uninstall_callback_method] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[active] [tinyint] NOT NULL,
 CONSTRAINT [PK_xf_addon_addon_id] PRIMARY KEY CLUSTERED 
(
	[addon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [title]    Script Date: 5/15/2018 12:00:14 PM ******/
CREATE NONCLUSTERED INDEX [title] ON [dbo].[xf_addon]
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_addon] ADD  DEFAULT (N'') FOR [version_string]
ALTER TABLE [dbo].[xf_addon] ADD  DEFAULT ((0)) FOR [version_id]
ALTER TABLE [dbo].[xf_addon] ADD  DEFAULT (N'') FOR [install_callback_class]
ALTER TABLE [dbo].[xf_addon] ADD  DEFAULT (N'') FOR [install_callback_method]
ALTER TABLE [dbo].[xf_addon] ADD  DEFAULT (N'') FOR [uninstall_callback_class]
ALTER TABLE [dbo].[xf_addon] ADD  DEFAULT (N'') FOR [uninstall_callback_method]
GO
