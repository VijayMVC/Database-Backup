/****** Object:  Table [dbo].[phpkb_attachments]    Script Date: 5/15/2018 11:59:16 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[phpkb_attachments](
	[attachment_id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NOT NULL,
	[file_name] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[file_type] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[file_views] [int] NOT NULL,
 CONSTRAINT [attachment_id] PRIMARY KEY CLUSTERED 
(
	[attachment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[phpkb_attachments] ADD  DEFAULT ('0') FOR [file_views]
ALTER TABLE [dbo].[phpkb_attachments]  WITH CHECK ADD  CONSTRAINT [fk___article_attachment] FOREIGN KEY([article_id])
REFERENCES [dbo].[phpkb_articles] ([article_id])
ALTER TABLE [dbo].[phpkb_attachments] CHECK CONSTRAINT [fk___article_attachment]
GO
