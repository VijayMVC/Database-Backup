/****** Object:  Table [dbo].[ItemIns]    Script Date: 5/15/2018 11:58:43 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ItemIns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartAuxiliaryID] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartId] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Quantity] [int] NOT NULL,
	[ItemDetails_Id] [int] NULL,
	[OrderMessage_Id] [int] NULL,
 CONSTRAINT [PK_dbo.ItemIns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [IX_ItemDetails_Id]    Script Date: 5/15/2018 11:58:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemDetails_Id] ON [dbo].[ItemIns]
(
	[ItemDetails_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_OrderMessage_Id]    Script Date: 5/15/2018 11:58:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderMessage_Id] ON [dbo].[ItemIns]
(
	[OrderMessage_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[ItemIns]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ItemIns_dbo.ItemDetails_ItemDetails_Id] FOREIGN KEY([ItemDetails_Id])
REFERENCES [dbo].[ItemDetails] ([Id])
ALTER TABLE [dbo].[ItemIns] CHECK CONSTRAINT [FK_dbo.ItemIns_dbo.ItemDetails_ItemDetails_Id]
ALTER TABLE [dbo].[ItemIns]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ItemIns_dbo.OrderMessages_OrderMessage_Id] FOREIGN KEY([OrderMessage_Id])
REFERENCES [dbo].[OrderMessages] ([Id])
ALTER TABLE [dbo].[ItemIns] CHECK CONSTRAINT [FK_dbo.ItemIns_dbo.OrderMessages_OrderMessage_Id]
GO
