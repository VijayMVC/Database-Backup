/****** Object:  Table [dbo].[xf_user_news_feed_cache]    Script Date: 5/15/2018 12:00:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_user_news_feed_cache](
	[user_id] [bigint] NOT NULL,
	[news_feed_cache] [varbinary](max) NOT NULL,
	[news_feed_cache_date] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_user_news_feed_cache_user_id] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
