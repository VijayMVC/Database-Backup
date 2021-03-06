/****** Object:  Table [dbo].[xf_page]    Script Date: 5/15/2018 12:00:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_page](
	[node_id] [bigint] NOT NULL,
	[publish_date] [bigint] NOT NULL,
	[modified_date] [bigint] NOT NULL,
	[view_count] [bigint] NOT NULL,
	[log_visits] [tinyint] NOT NULL,
	[list_siblings] [tinyint] NOT NULL,
	[list_children] [tinyint] NOT NULL,
	[callback_class] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[callback_method] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_xf_page_node_id] PRIMARY KEY CLUSTERED 
(
	[node_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[xf_page] ADD  DEFAULT ((0)) FOR [modified_date]
ALTER TABLE [dbo].[xf_page] ADD  DEFAULT ((0)) FOR [view_count]
ALTER TABLE [dbo].[xf_page] ADD  DEFAULT ((0)) FOR [log_visits]
ALTER TABLE [dbo].[xf_page] ADD  DEFAULT ((0)) FOR [list_siblings]
ALTER TABLE [dbo].[xf_page] ADD  DEFAULT ((0)) FOR [list_children]
ALTER TABLE [dbo].[xf_page] ADD  DEFAULT (N'') FOR [callback_class]
ALTER TABLE [dbo].[xf_page] ADD  DEFAULT (N'') FOR [callback_method]
GO
