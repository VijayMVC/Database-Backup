/****** Object:  Table [dbo].[phpkb_news]    Script Date: 5/15/2018 11:59:18 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[phpkb_news](
	[news_id] [int] IDENTITY(1,1) NOT NULL,
	[author_id] [int] NOT NULL,
	[news_title] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[news_content] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[news_date_time] [smalldatetime] NOT NULL,
	[news_last_updation] [smalldatetime] NOT NULL,
	[news_show] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[news_hits] [int] NOT NULL,
	[news_expiry_date] [smalldatetime] NULL,
 CONSTRAINT [news_id] PRIMARY KEY CLUSTERED 
(
	[news_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[news_title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[phpkb_news] ADD  DEFAULT ('yes') FOR [news_show]
ALTER TABLE [dbo].[phpkb_news] ADD  DEFAULT ('0') FOR [news_hits]
ALTER TABLE [dbo].[phpkb_news] ADD  DEFAULT (NULL) FOR [news_expiry_date]
ALTER TABLE [dbo].[phpkb_news]  WITH CHECK ADD  CONSTRAINT [fk___author_news] FOREIGN KEY([author_id])
REFERENCES [dbo].[phpkb_authors] ([author_id])
ALTER TABLE [dbo].[phpkb_news] CHECK CONSTRAINT [fk___author_news]
ALTER TABLE [dbo].[phpkb_news]  WITH CHECK ADD CHECK  (([news_show]='no' OR [news_show]='yes'))
GO
