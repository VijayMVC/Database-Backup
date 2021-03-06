/****** Object:  Table [dbo].[xf_feed_log]    Script Date: 5/15/2018 12:00:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_feed_log](
	[feed_id] [bigint] NOT NULL,
	[unique_id] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[hash] [nchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[thread_id] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_feed_log_feed_id] PRIMARY KEY CLUSTERED 
(
	[feed_id] ASC,
	[unique_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
