/****** Object:  Table [dbo].[xf_error_log]    Script Date: 5/15/2018 12:00:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_error_log](
	[error_id] [bigint] IDENTITY(41481,1) NOT NULL,
	[exception_date] [bigint] NOT NULL,
	[user_id] [bigint] NULL,
	[exception_type] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[message] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[filename] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[line] [bigint] NOT NULL,
	[trace_string] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[request_state] [varbinary](max) NOT NULL,
	[ip_address] [varbinary](16) NOT NULL,
 CONSTRAINT [PK_xf_error_log_error_id] PRIMARY KEY CLUSTERED 
(
	[error_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [exception_date]    Script Date: 5/15/2018 12:00:21 PM ******/
CREATE NONCLUSTERED INDEX [exception_date] ON [dbo].[xf_error_log]
(
	[exception_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_error_log] ADD  DEFAULT (NULL) FOR [user_id]
ALTER TABLE [dbo].[xf_error_log] ADD  DEFAULT (0x) FOR [ip_address]
GO
