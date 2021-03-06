/****** Object:  Table [dbo].[PermissionRecord_Role_Mapping]    Script Date: 5/15/2018 12:04:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PermissionRecord_Role_Mapping](
	[PermissionRecord_Id] [int] NOT NULL,
	[CustomerRole_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PermissionRecord_Id] ASC,
	[CustomerRole_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[PermissionRecord_Role_Mapping]  WITH CHECK ADD  CONSTRAINT [PermissionRecord_CustomerRoles_Source] FOREIGN KEY([PermissionRecord_Id])
REFERENCES [dbo].[PermissionRecord] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[PermissionRecord_Role_Mapping] CHECK CONSTRAINT [PermissionRecord_CustomerRoles_Source]
ALTER TABLE [dbo].[PermissionRecord_Role_Mapping]  WITH CHECK ADD  CONSTRAINT [PermissionRecord_CustomerRoles_Target] FOREIGN KEY([CustomerRole_Id])
REFERENCES [dbo].[CustomerRole] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[PermissionRecord_Role_Mapping] CHECK CONSTRAINT [PermissionRecord_CustomerRoles_Target]
GO
