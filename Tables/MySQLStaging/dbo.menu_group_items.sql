/****** Object:  Table [dbo].[menu_group_items]    Script Date: 5/15/2018 12:04:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[menu_group_items](
	[menu_group_items_id] [bigint] IDENTITY(1091,1) NOT NULL,
	[menu_group_id] [bigint] NOT NULL,
	[label] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[icon] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[module] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[action] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[custom_url] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[order_by] [int] NOT NULL,
	[hidden] [smallint] NULL,
	[permissable] [smallint] NOT NULL,
	[tablet_flag] [smallint] NULL,
 CONSTRAINT [PK_menu_group_items_menu_group_items_id] PRIMARY KEY CLUSTERED 
(
	[menu_group_items_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [menu_group_id]    Script Date: 5/15/2018 12:04:18 PM ******/
CREATE NONCLUSTERED INDEX [menu_group_id] ON [dbo].[menu_group_items]
(
	[menu_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[menu_group_items] ADD  DEFAULT ((0)) FOR [hidden]
ALTER TABLE [dbo].[menu_group_items] ADD  DEFAULT ((1)) FOR [permissable]
ALTER TABLE [dbo].[menu_group_items] ADD  DEFAULT (NULL) FOR [tablet_flag]
GO
