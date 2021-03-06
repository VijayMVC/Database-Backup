/****** Object:  Table [dbo].[Discount_AppliedToCategories]    Script Date: 5/15/2018 12:03:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Discount_AppliedToCategories](
	[Discount_Id] [int] NOT NULL,
	[Category_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Discount_Id] ASC,
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Discount_AppliedToCategories]  WITH CHECK ADD  CONSTRAINT [Discount_AppliedToCategories_Source] FOREIGN KEY([Discount_Id])
REFERENCES [dbo].[Discount] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[Discount_AppliedToCategories] CHECK CONSTRAINT [Discount_AppliedToCategories_Source]
ALTER TABLE [dbo].[Discount_AppliedToCategories]  WITH CHECK ADD  CONSTRAINT [Discount_AppliedToCategories_Target] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[Discount_AppliedToCategories] CHECK CONSTRAINT [Discount_AppliedToCategories_Target]
GO
