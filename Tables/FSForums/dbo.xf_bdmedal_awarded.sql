/****** Object:  Table [dbo].[xf_bdmedal_awarded]    Script Date: 5/15/2018 12:00:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_bdmedal_awarded](
	[awarded_id] [bigint] IDENTITY(1,1) NOT NULL,
	[medal_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[username] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[award_date] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_bdmedal_awarded_awarded_id] PRIMARY KEY CLUSTERED 
(
	[awarded_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [xf_bdmedal_awarded$medal_id_user_id] UNIQUE NONCLUSTERED 
(
	[medal_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [user_id]    Script Date: 5/15/2018 12:00:17 PM ******/
CREATE NONCLUSTERED INDEX [user_id] ON [dbo].[xf_bdmedal_awarded]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
