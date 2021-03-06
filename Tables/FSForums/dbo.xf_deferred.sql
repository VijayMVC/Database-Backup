/****** Object:  Table [dbo].[xf_deferred]    Script Date: 5/15/2018 12:00:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_deferred](
	[deferred_id] [bigint] IDENTITY(211664,1) NOT NULL,
	[unique_key] [varbinary](50) NULL,
	[execute_class] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[execute_data] [varbinary](max) NOT NULL,
	[manual_execute] [smallint] NOT NULL,
	[trigger_date] [int] NOT NULL,
 CONSTRAINT [PK_xf_deferred_deferred_id] PRIMARY KEY CLUSTERED 
(
	[deferred_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [xf_deferred$unique_key] UNIQUE NONCLUSTERED 
(
	[unique_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [manual_execute_date]    Script Date: 5/15/2018 12:00:20 PM ******/
CREATE NONCLUSTERED INDEX [manual_execute_date] ON [dbo].[xf_deferred]
(
	[manual_execute] ASC,
	[trigger_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [trigger_date]    Script Date: 5/15/2018 12:00:20 PM ******/
CREATE NONCLUSTERED INDEX [trigger_date] ON [dbo].[xf_deferred]
(
	[trigger_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_deferred] ADD  DEFAULT (NULL) FOR [unique_key]
GO
