/****** Object:  Table [dbo].[GiftCard]    Script Date: 5/15/2018 12:03:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GiftCard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchasedWithOrderProductVariantId] [int] NULL,
	[GiftCardTypeId] [int] NOT NULL,
	[Amount] [decimal](18, 4) NOT NULL,
	[IsGiftCardActivated] [bit] NOT NULL,
	[GiftCardCouponCode] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RecipientName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RecipientEmail] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SenderName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SenderEmail] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Message] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsRecipientNotified] [bit] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[StoreId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [IX_GiftCard_StoreId]    Script Date: 5/15/2018 12:03:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_GiftCard_StoreId] ON [dbo].[GiftCard]
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[GiftCard]  WITH CHECK ADD  CONSTRAINT [GiftCard_PurchasedWithOrderProductVariant] FOREIGN KEY([PurchasedWithOrderProductVariantId])
REFERENCES [dbo].[OrderProductVariant] ([Id])
ALTER TABLE [dbo].[GiftCard] CHECK CONSTRAINT [GiftCard_PurchasedWithOrderProductVariant]
ALTER TABLE [dbo].[GiftCard]  WITH CHECK ADD  CONSTRAINT [GiftCard_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[GiftCard] CHECK CONSTRAINT [GiftCard_Store]
GO
