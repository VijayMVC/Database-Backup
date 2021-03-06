/****** Object:  Table [dbo].[Catalog]    Script Date: 5/15/2018 12:04:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Catalog](
	[ItemID] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](425) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Name] [nvarchar](425) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[ParentID] [uniqueidentifier] NULL,
	[Type] [int] NOT NULL,
	[Content] [image] NULL,
	[Intermediate] [uniqueidentifier] NULL,
	[SnapshotDataID] [uniqueidentifier] NULL,
	[LinkSourceID] [uniqueidentifier] NULL,
	[Property] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Description] [nvarchar](512) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Hidden] [bit] NULL,
	[CreatedByID] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedByID] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[MimeType] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[SnapshotLimit] [int] NULL,
	[Parameter] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[PolicyID] [uniqueidentifier] NOT NULL,
	[PolicyRoot] [bit] NOT NULL,
	[ExecutionFlag] [int] NOT NULL,
	[ExecutionTime] [datetime] NULL,
	[SubType] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ComponentID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Catalog] PRIMARY KEY NONCLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_Catalog]    Script Date: 5/15/2018 12:04:58 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_Catalog] ON [dbo].[Catalog]
(
	[Path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_ComponentLookup]    Script Date: 5/15/2018 12:04:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_ComponentLookup] ON [dbo].[Catalog]
(
	[Type] ASC,
	[ComponentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_Link]    Script Date: 5/15/2018 12:04:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_Link] ON [dbo].[Catalog]
(
	[LinkSourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_Parent]    Script Date: 5/15/2018 12:04:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_Parent] ON [dbo].[Catalog]
(
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_SnapshotDataId]    Script Date: 5/15/2018 12:04:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_SnapshotDataId] ON [dbo].[Catalog]
(
	[SnapshotDataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[Catalog]  WITH NOCHECK ADD  CONSTRAINT [FK_Catalog_CreatedByID] FOREIGN KEY([CreatedByID])
REFERENCES [dbo].[Users] ([UserID])
ALTER TABLE [dbo].[Catalog] CHECK CONSTRAINT [FK_Catalog_CreatedByID]
ALTER TABLE [dbo].[Catalog]  WITH NOCHECK ADD  CONSTRAINT [FK_Catalog_LinkSourceID] FOREIGN KEY([LinkSourceID])
REFERENCES [dbo].[Catalog] ([ItemID])
ALTER TABLE [dbo].[Catalog] CHECK CONSTRAINT [FK_Catalog_LinkSourceID]
ALTER TABLE [dbo].[Catalog]  WITH NOCHECK ADD  CONSTRAINT [FK_Catalog_ModifiedByID] FOREIGN KEY([ModifiedByID])
REFERENCES [dbo].[Users] ([UserID])
ALTER TABLE [dbo].[Catalog] CHECK CONSTRAINT [FK_Catalog_ModifiedByID]
ALTER TABLE [dbo].[Catalog]  WITH NOCHECK ADD  CONSTRAINT [FK_Catalog_ParentID] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Catalog] ([ItemID])
ALTER TABLE [dbo].[Catalog] CHECK CONSTRAINT [FK_Catalog_ParentID]
ALTER TABLE [dbo].[Catalog]  WITH NOCHECK ADD  CONSTRAINT [FK_Catalog_Policy] FOREIGN KEY([PolicyID])
REFERENCES [dbo].[Policies] ([PolicyID])
ALTER TABLE [dbo].[Catalog] CHECK CONSTRAINT [FK_Catalog_Policy]
GO
