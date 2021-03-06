/****** Object:  Table [dbo].[logmarkhistory]    Script Date: 5/15/2018 12:02:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[logmarkhistory](
	[database_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[mark_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[user_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[lsn] [numeric](25, 0) NOT NULL,
	[mark_time] [datetime] NOT NULL
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [logmarkhistory1]    Script Date: 5/15/2018 12:02:58 PM ******/
CREATE NONCLUSTERED INDEX [logmarkhistory1] ON [dbo].[logmarkhistory]
(
	[database_name] ASC,
	[mark_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [logmarkhistory2]    Script Date: 5/15/2018 12:02:58 PM ******/
CREATE NONCLUSTERED INDEX [logmarkhistory2] ON [dbo].[logmarkhistory]
(
	[database_name] ASC,
	[lsn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
