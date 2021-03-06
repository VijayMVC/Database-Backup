/****** Object:  Table [dbo].[xf_login_attempt]    Script Date: 5/15/2018 12:00:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_login_attempt](
	[login] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[attempt_date] [bigint] NOT NULL,
	[ip_address] [varbinary](16) NOT NULL,
	[attempt_id] [bigint] IDENTITY(2243,1) NOT NULL,
 CONSTRAINT [PK_xf_login_attempt_attempt_id] PRIMARY KEY CLUSTERED 
(
	[attempt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [attempt_date]    Script Date: 5/15/2018 12:00:24 PM ******/
CREATE NONCLUSTERED INDEX [attempt_date] ON [dbo].[xf_login_attempt]
(
	[attempt_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [login_check]    Script Date: 5/15/2018 12:00:24 PM ******/
CREATE NONCLUSTERED INDEX [login_check] ON [dbo].[xf_login_attempt]
(
	[login] ASC,
	[ip_address] ASC,
	[attempt_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
