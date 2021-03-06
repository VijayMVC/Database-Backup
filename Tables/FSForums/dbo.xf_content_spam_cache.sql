/****** Object:  Table [dbo].[xf_content_spam_cache]    Script Date: 5/15/2018 12:00:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_content_spam_cache](
	[spam_cache_id] [bigint] IDENTITY(1,1) NOT NULL,
	[content_type] [varbinary](25) NOT NULL,
	[content_id] [bigint] NOT NULL,
	[spam_params] [varbinary](max) NOT NULL,
	[insert_date] [int] NOT NULL,
 CONSTRAINT [PK_xf_content_spam_cache_spam_cache_id] PRIMARY KEY CLUSTERED 
(
	[spam_cache_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [xf_content_spam_cache$content_type] UNIQUE NONCLUSTERED 
(
	[content_type] ASC,
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [insert_date]    Script Date: 5/15/2018 12:00:18 PM ******/
CREATE NONCLUSTERED INDEX [insert_date] ON [dbo].[xf_content_spam_cache]
(
	[insert_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
