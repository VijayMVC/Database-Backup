/****** Object:  Table [dbo].[phpkb_articles]    Script Date: 5/15/2018 11:59:16 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[phpkb_articles](
	[article_id] [int] IDENTITY(1,1) NOT NULL,
	[author_id] [int] NOT NULL,
	[article_title] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[article_content] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[article_date_time] [smalldatetime] NOT NULL,
	[article_status] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[article_show] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[article_last_updation] [smalldatetime] NOT NULL,
	[article_keywords] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[article_metadesc] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[article_publish_date] [smalldatetime] NULL,
	[article_expiry_date] [smalldatetime] NULL,
	[article_email_count] [int] NULL,
	[article_print_count] [int] NULL,
	[article_comments_allow] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[article_ratings_allow] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [article_id] PRIMARY KEY CLUSTERED 
(
	[article_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[phpkb_articles] ADD  DEFAULT ('pending') FOR [article_status]
ALTER TABLE [dbo].[phpkb_articles] ADD  DEFAULT ('no') FOR [article_show]
ALTER TABLE [dbo].[phpkb_articles] ADD  DEFAULT (NULL) FOR [article_publish_date]
ALTER TABLE [dbo].[phpkb_articles] ADD  DEFAULT (NULL) FOR [article_expiry_date]
ALTER TABLE [dbo].[phpkb_articles] ADD  DEFAULT ('0') FOR [article_email_count]
ALTER TABLE [dbo].[phpkb_articles] ADD  DEFAULT ('0') FOR [article_print_count]
ALTER TABLE [dbo].[phpkb_articles] ADD  DEFAULT ('yes') FOR [article_comments_allow]
ALTER TABLE [dbo].[phpkb_articles] ADD  DEFAULT ('yes') FOR [article_ratings_allow]
ALTER TABLE [dbo].[phpkb_articles]  WITH CHECK ADD  CONSTRAINT [fk___author_article] FOREIGN KEY([author_id])
REFERENCES [dbo].[phpkb_authors] ([author_id])
ALTER TABLE [dbo].[phpkb_articles] CHECK CONSTRAINT [fk___author_article]
ALTER TABLE [dbo].[phpkb_articles]  WITH CHECK ADD CHECK  (([article_status]='disapproved-deleted' OR [article_status]='featured-deleted' OR [article_status]='approved-deleted' OR [article_status]='pending-deleted' OR [article_status]='pending' OR [article_status]='featured' OR [article_status]='draft' OR [article_status]='disapproved' OR [article_status]='approved'))
ALTER TABLE [dbo].[phpkb_articles]  WITH CHECK ADD CHECK  (([article_show]='no' OR [article_show]='yes'))
ALTER TABLE [dbo].[phpkb_articles]  WITH CHECK ADD CHECK  (([article_comments_allow]='no' OR [article_comments_allow]='yes'))
ALTER TABLE [dbo].[phpkb_articles]  WITH CHECK ADD CHECK  (([article_ratings_allow]='no' OR [article_ratings_allow]='yes'))
GO
