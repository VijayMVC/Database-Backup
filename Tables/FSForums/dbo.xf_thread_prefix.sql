/****** Object:  Table [dbo].[xf_thread_prefix]    Script Date: 5/15/2018 12:00:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_thread_prefix](
	[prefix_id] [bigint] IDENTITY(7,1) NOT NULL,
	[prefix_group_id] [bigint] NOT NULL,
	[display_order] [bigint] NOT NULL,
	[materialized_order] [bigint] NOT NULL,
	[css_class] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[allowed_user_group_ids] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_xf_thread_prefix_prefix_id] PRIMARY KEY CLUSTERED 
(
	[prefix_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [materialized_order]    Script Date: 5/15/2018 12:00:36 PM ******/
CREATE NONCLUSTERED INDEX [materialized_order] ON [dbo].[xf_thread_prefix]
(
	[materialized_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_thread_prefix] ADD  DEFAULT (N'') FOR [css_class]
GO
