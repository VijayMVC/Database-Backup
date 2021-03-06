/****** Object:  Table [dbo].[Roles]    Script Date: 5/15/2018 12:05:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Roles](
	[RoleID] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Description] [nvarchar](512) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[TaskMask] [nvarchar](32) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[RoleFlags] [tinyint] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY NONCLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_Roles]    Script Date: 5/15/2018 12:05:01 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_Roles] ON [dbo].[Roles]
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
