/****** Object:  Table [dbo].[TierPrice]    Script Date: 5/15/2018 12:07:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[TierPrice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
	[CustomerRoleId] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_TierPrice_ProductId]    Script Date: 5/15/2018 12:07:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_TierPrice_ProductId] ON [dbo].[TierPrice]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[TierPrice]  WITH CHECK ADD  CONSTRAINT [TierPrice_CustomerRole] FOREIGN KEY([CustomerRoleId])
REFERENCES [dbo].[CustomerRole] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[TierPrice] CHECK CONSTRAINT [TierPrice_CustomerRole]
ALTER TABLE [dbo].[TierPrice]  WITH CHECK ADD  CONSTRAINT [TierPrice_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[TierPrice] CHECK CONSTRAINT [TierPrice_Product]
GO
