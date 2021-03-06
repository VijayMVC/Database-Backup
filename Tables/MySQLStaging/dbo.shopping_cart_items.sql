/****** Object:  Table [dbo].[shopping_cart_items]    Script Date: 5/15/2018 12:04:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[shopping_cart_items](
	[shopping_cart_item_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[shopping_cart_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[product_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[quantity] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[width] [int] NULL,
	[height] [int] NULL,
	[removed] [smallint] NOT NULL,
 CONSTRAINT [PK_shopping_cart_items_shopping_cart_item_id] PRIMARY KEY CLUSTERED 
(
	[shopping_cart_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [shopping_cart_id]    Script Date: 5/15/2018 12:04:30 PM ******/
CREATE NONCLUSTERED INDEX [shopping_cart_id] ON [dbo].[shopping_cart_items]
(
	[shopping_cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[shopping_cart_items] ADD  DEFAULT (NULL) FOR [width]
ALTER TABLE [dbo].[shopping_cart_items] ADD  DEFAULT (NULL) FOR [height]
ALTER TABLE [dbo].[shopping_cart_items] ADD  DEFAULT ((0)) FOR [removed]
GO
