/****** Object:  Table [dbo].[phpkb_favorites]    Script Date: 5/15/2018 11:59:17 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[phpkb_favorites](
	[favorite_id] [int] IDENTITY(1,1) NOT NULL,
	[member_id] [int] NOT NULL,
	[article_id] [int] NOT NULL,
	[favorite_date] [smalldatetime] NOT NULL,
 CONSTRAINT [favorite_id] PRIMARY KEY CLUSTERED 
(
	[favorite_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[phpkb_favorites]  WITH CHECK ADD  CONSTRAINT [fk___article_favorites] FOREIGN KEY([article_id])
REFERENCES [dbo].[phpkb_articles] ([article_id])
ALTER TABLE [dbo].[phpkb_favorites] CHECK CONSTRAINT [fk___article_favorites]
ALTER TABLE [dbo].[phpkb_favorites]  WITH CHECK ADD  CONSTRAINT [fk___member_favorites] FOREIGN KEY([member_id])
REFERENCES [dbo].[phpkb_authors] ([author_id])
ALTER TABLE [dbo].[phpkb_favorites] CHECK CONSTRAINT [fk___member_favorites]
GO
