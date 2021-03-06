/****** Object:  Table [dbo].[BackInStockSubscription]    Script Date: 5/15/2018 12:08:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[BackInStockSubscription](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[BackInStockSubscription]  WITH CHECK ADD  CONSTRAINT [BackInStockSubscription_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[BackInStockSubscription] CHECK CONSTRAINT [BackInStockSubscription_Customer]
ALTER TABLE [dbo].[BackInStockSubscription]  WITH CHECK ADD  CONSTRAINT [BackInStockSubscription_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[BackInStockSubscription] CHECK CONSTRAINT [BackInStockSubscription_Product]
GO
