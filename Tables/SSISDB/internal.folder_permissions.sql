/****** Object:  Table [internal].[folder_permissions]    Script Date: 5/15/2018 12:06:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [internal].[folder_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[sid] [internal].[adt_sid] NOT NULL,
	[object_id] [bigint] NOT NULL,
	[permission_type] [smallint] NOT NULL,
	[is_role] [bit] NOT NULL,
	[is_deny] [bit] NOT NULL,
	[grantor_sid] [internal].[adt_sid] NOT NULL,
 CONSTRAINT [PK_Folder_Permissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [Unique_FolderPermissions]    Script Date: 5/15/2018 12:06:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unique_FolderPermissions] ON [internal].[folder_permissions]
(
	[object_id] ASC,
	[permission_type] ASC,
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [internal].[folder_permissions]  WITH CHECK ADD  CONSTRAINT [FK_FolderPermissions_ObjectId_Folders] FOREIGN KEY([object_id])
REFERENCES [internal].[folders] ([folder_id])
ON DELETE CASCADE
ALTER TABLE [internal].[folder_permissions] CHECK CONSTRAINT [FK_FolderPermissions_ObjectId_Folders]
ALTER TABLE [internal].[folder_permissions]  WITH CHECK ADD  CONSTRAINT [CK_Folder_PermissionType] CHECK  (([permission_type]=(104) OR [permission_type]=(103) OR [permission_type]=(102) OR [permission_type]=(101) OR [permission_type]=(100) OR [permission_type]=(4) OR [permission_type]=(2) OR [permission_type]=(1)))
ALTER TABLE [internal].[folder_permissions] CHECK CONSTRAINT [CK_Folder_PermissionType]
GO
