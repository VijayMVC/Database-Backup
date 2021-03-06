/****** Object:  Table [dbo].[xf_permission_entry_content]    Script Date: 5/15/2018 12:00:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_permission_entry_content](
	[permission_entry_id] [bigint] IDENTITY(5243,1) NOT NULL,
	[content_type] [varbinary](25) NOT NULL,
	[content_id] [bigint] NOT NULL,
	[user_group_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[permission_group_id] [varbinary](25) NOT NULL,
	[permission_id] [varbinary](25) NOT NULL,
	[permission_value] [nvarchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[permission_value_int] [int] NOT NULL,
 CONSTRAINT [PK_xf_permission_entry_content_permission_entry_id] PRIMARY KEY CLUSTERED 
(
	[permission_entry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [xf_permission_entry_content$user_group_id_unique] UNIQUE NONCLUSTERED 
(
	[user_group_id] ASC,
	[user_id] ASC,
	[content_type] ASC,
	[content_id] ASC,
	[permission_group_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [content_type_content_id]    Script Date: 5/15/2018 12:00:29 PM ******/
CREATE NONCLUSTERED INDEX [content_type_content_id] ON [dbo].[xf_permission_entry_content]
(
	[content_type] ASC,
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
