/****** Object:  Table [dbo].[Discount_AppliedToProducts]    Script Date: 5/15/2018 12:08:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Discount_AppliedToProducts](
	[Discount_Id] [int] NOT NULL,
	[Product_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Discount_Id] ASC,
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Discount_AppliedToProducts]  WITH CHECK ADD  CONSTRAINT [Discount_AppliedToProducts_Source] FOREIGN KEY([Discount_Id])
REFERENCES [dbo].[Discount] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[Discount_AppliedToProducts] CHECK CONSTRAINT [Discount_AppliedToProducts_Source]
ALTER TABLE [dbo].[Discount_AppliedToProducts]  WITH CHECK ADD  CONSTRAINT [Discount_AppliedToProducts_Target] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[Discount_AppliedToProducts] CHECK CONSTRAINT [Discount_AppliedToProducts_Target]
GO
