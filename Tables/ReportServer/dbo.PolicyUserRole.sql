/****** Object:  Table [dbo].[PolicyUserRole]    Script Date: 5/15/2018 12:05:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PolicyUserRole](
	[ID] [uniqueidentifier] NOT NULL,
	[RoleID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[PolicyID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PolicyUserRole] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_PolicyUserRole]    Script Date: 5/15/2018 12:05:01 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_PolicyUserRole] ON [dbo].[PolicyUserRole]
(
	[RoleID] ASC,
	[UserID] ASC,
	[PolicyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[PolicyUserRole]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyUserRole_Policy] FOREIGN KEY([PolicyID])
REFERENCES [dbo].[Policies] ([PolicyID])
ON DELETE CASCADE
ALTER TABLE [dbo].[PolicyUserRole] CHECK CONSTRAINT [FK_PolicyUserRole_Policy]
ALTER TABLE [dbo].[PolicyUserRole]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyUserRole_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
ALTER TABLE [dbo].[PolicyUserRole] CHECK CONSTRAINT [FK_PolicyUserRole_Role]
ALTER TABLE [dbo].[PolicyUserRole]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyUserRole_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ALTER TABLE [dbo].[PolicyUserRole] CHECK CONSTRAINT [FK_PolicyUserRole_User]
GO
