/****** Object:  Table [dbo].[ModelPerspective]    Script Date: 5/15/2018 12:02:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ModelPerspective](
	[ID] [uniqueidentifier] NOT NULL,
	[ModelID] [uniqueidentifier] NOT NULL,
	[PerspectiveID] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[PerspectiveName] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[PerspectiveDescription] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [IX_ModelPerspective]    Script Date: 5/15/2018 12:02:21 PM ******/
CREATE CLUSTERED INDEX [IX_ModelPerspective] ON [dbo].[ModelPerspective]
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[ModelPerspective]  WITH NOCHECK ADD  CONSTRAINT [FK_ModelPerspectiveModel] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Catalog] ([ItemID])
ON DELETE CASCADE
ALTER TABLE [dbo].[ModelPerspective] CHECK CONSTRAINT [FK_ModelPerspectiveModel]
GO
