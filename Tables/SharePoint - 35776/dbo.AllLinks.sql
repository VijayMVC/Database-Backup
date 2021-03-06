/****** Object:  Table [dbo].[AllLinks]    Script Date: 5/15/2018 12:05:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AllLinks](
	[SiteId] [uniqueidentifier] NOT NULL,
	[DeleteTransactionId] [varbinary](16) NOT NULL,
	[DirName] [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[LeafName] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[WebPartId] [uniqueidentifier] NULL,
	[FieldId] [uniqueidentifier] NULL,
	[LinkNumber] [int] NOT NULL,
	[TargetDirName] [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[TargetLeafName] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Security] [tinyint] NOT NULL,
	[Dynamic] [tinyint] NOT NULL,
	[ServerRel] [bit] NOT NULL,
	[PointsToDir] [bit] NOT NULL,
	[Level] [tinyint] NOT NULL,
	[Search] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [Links_Forward]    Script Date: 5/15/2018 12:05:32 PM ******/
CREATE CLUSTERED INDEX [Links_Forward] ON [dbo].[AllLinks]
(
	[SiteId] ASC,
	[DeleteTransactionId] ASC,
	[DirName] ASC,
	[LeafName] ASC,
	[Level] ASC,
	[FieldId] ASC,
	[WebPartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Links_Backward]    Script Date: 5/15/2018 12:05:32 PM ******/
CREATE NONCLUSTERED INDEX [Links_Backward] ON [dbo].[AllLinks]
(
	[SiteId] ASC,
	[DeleteTransactionId] ASC,
	[TargetDirName] ASC,
	[TargetLeafName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[AllLinks] ADD  DEFAULT (0x) FOR [DeleteTransactionId]
ALTER TABLE [dbo].[AllLinks] ADD  DEFAULT ((1)) FOR [Level]
ALTER TABLE [dbo].[AllLinks] ADD  CONSTRAINT [AllLinks_Search_Default]  DEFAULT (N'') FOR [Search]
GO
