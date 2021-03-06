/****** Object:  Table [dbo].[xf_conversation_recipient]    Script Date: 5/15/2018 12:00:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_conversation_recipient](
	[conversation_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[recipient_state] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[last_read_date] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_conversation_recipient_conversation_id] PRIMARY KEY CLUSTERED 
(
	[conversation_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [user_id]    Script Date: 5/15/2018 12:00:19 PM ******/
CREATE NONCLUSTERED INDEX [user_id] ON [dbo].[xf_conversation_recipient]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
