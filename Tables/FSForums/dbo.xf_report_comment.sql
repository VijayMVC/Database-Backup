/****** Object:  Table [dbo].[xf_report_comment]    Script Date: 5/15/2018 12:00:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_report_comment](
	[report_comment_id] [bigint] IDENTITY(31,1) NOT NULL,
	[report_id] [bigint] NOT NULL,
	[comment_date] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[username] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[message] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[state_change] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[is_report] [tinyint] NOT NULL,
 CONSTRAINT [PK_xf_report_comment_report_comment_id] PRIMARY KEY CLUSTERED 
(
	[report_comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [report_id_date]    Script Date: 5/15/2018 12:00:32 PM ******/
CREATE NONCLUSTERED INDEX [report_id_date] ON [dbo].[xf_report_comment]
(
	[report_id] ASC,
	[comment_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [user_id]    Script Date: 5/15/2018 12:00:32 PM ******/
CREATE NONCLUSTERED INDEX [user_id] ON [dbo].[xf_report_comment]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_report_comment] ADD  DEFAULT (N'') FOR [state_change]
ALTER TABLE [dbo].[xf_report_comment] ADD  DEFAULT ((1)) FOR [is_report]
GO
