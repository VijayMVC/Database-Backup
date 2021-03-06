/****** Object:  Table [dbo].[ProductCategory]    Script Date: 5/15/2018 12:02:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ProductCategory](
	[CatId] [int] NOT NULL,
	[PrdId] [int] NOT NULL,
	[CatType] [tinyint] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[CatId] ASC,
	[PrdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_ProductCategory]    Script Date: 5/15/2018 12:02:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductCategory] ON [dbo].[ProductCategory]
(
	[CatType] ASC,
	[PrdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
