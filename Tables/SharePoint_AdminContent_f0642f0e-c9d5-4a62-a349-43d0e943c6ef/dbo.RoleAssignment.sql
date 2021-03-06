/****** Object:  Table [dbo].[RoleAssignment]    Script Date: 5/15/2018 12:06:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RoleAssignment](
	[SiteId] [uniqueidentifier] NOT NULL,
	[ScopeId] [uniqueidentifier] NOT NULL,
	[RoleId] [int] NOT NULL,
	[PrincipalId] [int] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [RoleAssignment_PricipalId]    Script Date: 5/15/2018 12:06:00 PM ******/
CREATE UNIQUE CLUSTERED INDEX [RoleAssignment_PricipalId] ON [dbo].[RoleAssignment]
(
	[SiteId] ASC,
	[ScopeId] ASC,
	[RoleId] ASC,
	[PrincipalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
