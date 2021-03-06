/****** Object:  Table [dbo].[sysmanagement_shared_registered_servers_internal]    Script Date: 5/15/2018 12:03:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysmanagement_shared_registered_servers_internal](
	[server_id] [int] IDENTITY(1,1) NOT NULL,
	[server_group_id] [int] NULL,
	[name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[server_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[description] [nvarchar](2048) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[server_type] [int] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[server_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_sysmanagement_unique_server_name_per_group] UNIQUE NONCLUSTERED 
(
	[server_group_id] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_sysmanagement_shared_registered_servers_clustGroupID]    Script Date: 5/15/2018 12:03:07 PM ******/
CREATE CLUSTERED INDEX [IX_sysmanagement_shared_registered_servers_clustGroupID] ON [dbo].[sysmanagement_shared_registered_servers_internal]
(
	[server_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_sysmanagement_shared_registered_servers_name]    Script Date: 5/15/2018 12:03:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_sysmanagement_shared_registered_servers_name] ON [dbo].[sysmanagement_shared_registered_servers_internal]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[sysmanagement_shared_registered_servers_internal]  WITH CHECK ADD FOREIGN KEY([server_group_id])
REFERENCES [dbo].[sysmanagement_shared_server_groups_internal] ([server_group_id])
ON DELETE CASCADE
GO
