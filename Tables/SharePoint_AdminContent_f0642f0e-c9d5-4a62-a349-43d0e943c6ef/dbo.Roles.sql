/****** Object:  Table [dbo].[Roles]    Script Date: 5/15/2018 12:06:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Roles](
	[SiteId] [uniqueidentifier] NOT NULL,
	[WebId] [uniqueidentifier] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Title] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Description] [nvarchar](512) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[PermMask] [dbo].[tPermMask] NULL,
	[PermMaskDeny] [dbo].[tPermMask] NULL,
	[Hidden] [bit] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[WebGroupId] [int] NOT NULL,
	[RoleOrder] [int] NOT NULL,
 CONSTRAINT [Roles_PK] PRIMARY KEY CLUSTERED 
(
	[SiteId] ASC,
	[WebId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [Roles_Title]    Script Date: 5/15/2018 12:06:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Roles_Title] ON [dbo].[Roles]
(
	[SiteId] ASC,
	[WebId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[Roles] ADD  DEFAULT ((-1)) FOR [WebGroupId]
ALTER TABLE [dbo].[Roles] ADD  DEFAULT ((0)) FOR [RoleOrder]
GO
