/****** Object:  Table [dbo].[xf_poll_response]    Script Date: 5/15/2018 12:00:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_poll_response](
	[poll_response_id] [bigint] IDENTITY(105,1) NOT NULL,
	[poll_id] [bigint] NOT NULL,
	[response] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[response_vote_count] [bigint] NOT NULL,
	[voters] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_xf_poll_response_poll_response_id] PRIMARY KEY CLUSTERED 
(
	[poll_response_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [poll_id_response_id]    Script Date: 5/15/2018 12:00:30 PM ******/
CREATE NONCLUSTERED INDEX [poll_id_response_id] ON [dbo].[xf_poll_response]
(
	[poll_id] ASC,
	[poll_response_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_poll_response] ADD  DEFAULT ((0)) FOR [response_vote_count]
GO
