/****** Object:  Table [dbo].[TempDataSets]    Script Date: 5/15/2018 12:05:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[TempDataSets](
	[ID] [uniqueidentifier] NOT NULL,
	[ItemID] [uniqueidentifier] NOT NULL,
	[LinkID] [uniqueidentifier] NULL,
	[Name] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
 CONSTRAINT [PK_TempDataSet] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_TempDataSet_ItemID_Name]    Script Date: 5/15/2018 12:05:06 PM ******/
CREATE CLUSTERED INDEX [IX_TempDataSet_ItemID_Name] ON [dbo].[TempDataSets]
(
	[ItemID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_DataSetLinkID]    Script Date: 5/15/2018 12:05:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_DataSetLinkID] ON [dbo].[TempDataSets]
(
	[LinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[TempDataSets]  WITH NOCHECK ADD  CONSTRAINT [FK_DataSetItemID] FOREIGN KEY([ItemID])
REFERENCES [dbo].[TempCatalog] ([TempCatalogID])
ALTER TABLE [dbo].[TempDataSets] CHECK CONSTRAINT [FK_DataSetItemID]
GO
