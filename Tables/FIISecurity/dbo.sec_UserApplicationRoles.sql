/****** Object:  Table [dbo].[sec_UserApplicationRoles]    Script Date: 5/15/2018 12:00:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sec_UserApplicationRoles](
	[user_id] [bigint] NOT NULL,
	[application_role_id] [bigint] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [_dta_index_sec_UserApplicationRoles_c_25_917578307__K1]    Script Date: 5/15/2018 12:00:05 PM ******/
CREATE CLUSTERED INDEX [_dta_index_sec_UserApplicationRoles_c_25_917578307__K1] ON [dbo].[sec_UserApplicationRoles]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sec_UserApplicationRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_AuthenticatedUsers] FOREIGN KEY([user_id])
REFERENCES [dbo].[sec_AuthenticatedUsers] ([user_id])
ALTER TABLE [dbo].[sec_UserApplicationRoles] CHECK CONSTRAINT [FK_UserRole_AuthenticatedUsers]
ALTER TABLE [dbo].[sec_UserApplicationRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Roles] FOREIGN KEY([application_role_id])
REFERENCES [dbo].[sec_ApplicationRoles] ([application_role_id])
ALTER TABLE [dbo].[sec_UserApplicationRoles] CHECK CONSTRAINT [FK_UserRole_Roles]
GO
