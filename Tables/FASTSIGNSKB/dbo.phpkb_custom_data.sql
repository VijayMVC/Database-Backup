/****** Object:  Table [dbo].[phpkb_custom_data]    Script Date: 5/15/2018 11:59:17 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[phpkb_custom_data](
	[data_id] [int] IDENTITY(1,1) NOT NULL,
	[field_id] [int] NOT NULL,
	[article_id] [int] NOT NULL,
	[field_data] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [data_id] PRIMARY KEY CLUSTERED 
(
	[data_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[phpkb_custom_data]  WITH CHECK ADD  CONSTRAINT [fk___article_data] FOREIGN KEY([article_id])
REFERENCES [dbo].[phpkb_articles] ([article_id])
ALTER TABLE [dbo].[phpkb_custom_data] CHECK CONSTRAINT [fk___article_data]
ALTER TABLE [dbo].[phpkb_custom_data]  WITH CHECK ADD  CONSTRAINT [fk___field_data] FOREIGN KEY([field_id])
REFERENCES [dbo].[phpkb_custom_fields] ([field_id])
ALTER TABLE [dbo].[phpkb_custom_data] CHECK CONSTRAINT [fk___field_data]
GO
