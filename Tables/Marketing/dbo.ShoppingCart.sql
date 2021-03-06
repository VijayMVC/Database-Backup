/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 5/15/2018 12:02:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ShoppingCart](
	[ScStoreId] [int] NOT NULL,
	[ScId] [int] NOT NULL,
	[ScType] [tinyint] NOT NULL,
	[ScCatlId] [int] NOT NULL,
	[ScCatId] [int] NOT NULL,
	[ScOrderPrdType] [tinyint] NOT NULL,
	[ScCatType] [tinyint] NOT NULL,
	[ScPrdGId] [int] NULL,
	[ScRMPHId] [int] NULL,
	[ScPrdId] [int] NULL,
	[ScQty] [int] NULL,
	[ScMailDate] [smalldatetime] NULL,
	[ScImprint] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ScAdded] [smalldatetime] NULL,
	[ScMailOnDemandPostageType] [tinyint] NULL,
	[ScMailOnDemandPostageFee] [float] NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[ScId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_ShoppingCart]    Script Date: 5/15/2018 12:02:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_ShoppingCart] ON [dbo].[ShoppingCart]
(
	[ScStoreId] ASC,
	[ScId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
