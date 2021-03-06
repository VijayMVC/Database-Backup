/****** Object:  Table [dbo].[sysmanagement_shared_server_groups_internal]    Script Date: 5/15/2018 12:03:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysmanagement_shared_server_groups_internal](
	[server_group_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[description] [nvarchar](2048) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[server_type] [int] NOT NULL,
	[parent_id] [int] NULL,
	[is_system_object] [bit] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[server_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_sysmanagement_unique_group_name_per_parent] UNIQUE NONCLUSTERED 
(
	[parent_id] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_sysmanagement_shared_server_groups_clustParentGroupID]    Script Date: 5/15/2018 12:03:08 PM ******/
CREATE CLUSTERED INDEX [IX_sysmanagement_shared_server_groups_clustParentGroupID] ON [dbo].[sysmanagement_shared_server_groups_internal]
(
	[parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_sysmanagement_shared_server_groups_name]    Script Date: 5/15/2018 12:03:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_sysmanagement_shared_server_groups_name] ON [dbo].[sysmanagement_shared_server_groups_internal]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[sysmanagement_shared_server_groups_internal] ADD  DEFAULT ((0)) FOR [is_system_object]
/****** Object:  Trigger [dbo].[sysmanagement_delete_shared_server_group_trigger]    Script Date: 5/15/2018 12:03:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TRIGGER [sysmanagement_delete_shared_server_group_trigger] on [msdb].[dbo].[sysmanagement_shared_server_groups_internal] 
FOR DELETE
AS
BEGIN
    -- system server groups should not be deleted
    IF EXISTS (SELECT * FROM deleted where is_system_object = 1)
    BEGIN
        RAISERROR (35008, 1, 1)
        ROLLBACK TRANSACTION
    END
END

GO
