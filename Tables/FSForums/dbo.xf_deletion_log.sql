/****** Object:  Table [dbo].[xf_deletion_log]    Script Date: 5/15/2018 12:00:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_deletion_log](
	[content_type] [varbinary](25) NOT NULL,
	[content_id] [int] NOT NULL,
	[delete_date] [int] NOT NULL,
	[delete_user_id] [int] NOT NULL,
	[delete_username] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[delete_reason] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_xf_deletion_log_content_type] PRIMARY KEY CLUSTERED 
(
	[content_type] ASC,
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [delete_user_id_date]    Script Date: 5/15/2018 12:00:20 PM ******/
CREATE NONCLUSTERED INDEX [delete_user_id_date] ON [dbo].[xf_deletion_log]
(
	[delete_user_id] ASC,
	[delete_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_deletion_log] ADD  DEFAULT (N'') FOR [delete_reason]
GO
