/****** Object:  Table [dbo].[xf_captcha_log]    Script Date: 5/15/2018 12:00:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_captcha_log](
	[hash] [varbinary](40) NOT NULL,
	[captcha_type] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[captcha_data] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[captcha_date] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_captcha_log_hash] PRIMARY KEY CLUSTERED 
(
	[hash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [captcha_date]    Script Date: 5/15/2018 12:00:18 PM ******/
CREATE NONCLUSTERED INDEX [captcha_date] ON [dbo].[xf_captcha_log]
(
	[captcha_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
