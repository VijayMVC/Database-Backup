/****** Object:  Table [dbo].[xf_permission_interface_group]    Script Date: 5/15/2018 12:00:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_permission_interface_group](
	[interface_group_id] [varbinary](50) NOT NULL,
	[display_order] [bigint] NOT NULL,
	[addon_id] [varbinary](25) NOT NULL,
 CONSTRAINT [PK_xf_permission_interface_group_interface_group_id] PRIMARY KEY CLUSTERED 
(
	[interface_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [display_order]    Script Date: 5/15/2018 12:00:29 PM ******/
CREATE NONCLUSTERED INDEX [display_order] ON [dbo].[xf_permission_interface_group]
(
	[display_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_permission_interface_group] ADD  DEFAULT (0x) FOR [addon_id]
GO
