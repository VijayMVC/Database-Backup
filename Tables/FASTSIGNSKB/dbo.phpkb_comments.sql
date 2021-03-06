/****** Object:  Table [dbo].[phpkb_comments]    Script Date: 5/15/2018 11:59:16 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[phpkb_comments](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NOT NULL,
	[person_name] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[person_email] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[comment] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[comment_date_time] [smalldatetime] NOT NULL,
	[comment_status] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [comment_id] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[phpkb_comments] ADD  DEFAULT ('pending') FOR [comment_status]
ALTER TABLE [dbo].[phpkb_comments]  WITH CHECK ADD  CONSTRAINT [fk___article_comment] FOREIGN KEY([article_id])
REFERENCES [dbo].[phpkb_articles] ([article_id])
ALTER TABLE [dbo].[phpkb_comments] CHECK CONSTRAINT [fk___article_comment]
ALTER TABLE [dbo].[phpkb_comments]  WITH CHECK ADD CHECK  (([comment_status]='pending' OR [comment_status]='approved'))
GO
