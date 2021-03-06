/****** Object:  Table [dbo].[xf_mail_queue]    Script Date: 5/15/2018 12:00:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_mail_queue](
	[mail_queue_id] [bigint] IDENTITY(36006,1) NOT NULL,
	[mail_data] [varbinary](max) NOT NULL,
	[queue_date] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_mail_queue_mail_queue_id] PRIMARY KEY CLUSTERED 
(
	[mail_queue_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [queue_date]    Script Date: 5/15/2018 12:00:24 PM ******/
CREATE NONCLUSTERED INDEX [queue_date] ON [dbo].[xf_mail_queue]
(
	[queue_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
