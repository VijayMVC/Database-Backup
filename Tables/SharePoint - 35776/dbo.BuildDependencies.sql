/****** Object:  Table [dbo].[BuildDependencies]    Script Date: 5/15/2018 12:05:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[BuildDependencies](
	[SiteId] [uniqueidentifier] NOT NULL,
	[DirName] [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[LeafName] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[TargetDirName] [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[TargetLeafName] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[DirectDependency] [bit] NOT NULL
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [BuildDependencies_Forward]    Script Date: 5/15/2018 12:05:33 PM ******/
CREATE CLUSTERED INDEX [BuildDependencies_Forward] ON [dbo].[BuildDependencies]
(
	[SiteId] ASC,
	[DirName] ASC,
	[LeafName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [BuildDependencies_Backward]    Script Date: 5/15/2018 12:05:33 PM ******/
CREATE NONCLUSTERED INDEX [BuildDependencies_Backward] ON [dbo].[BuildDependencies]
(
	[SiteId] ASC,
	[TargetDirName] ASC,
	[TargetLeafName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
