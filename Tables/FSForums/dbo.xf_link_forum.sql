/****** Object:  Table [dbo].[xf_link_forum]    Script Date: 5/15/2018 12:00:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_link_forum](
	[node_id] [bigint] NOT NULL,
	[link_url] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[redirect_count] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_link_forum_node_id] PRIMARY KEY CLUSTERED 
(
	[node_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[xf_link_forum] ADD  DEFAULT ((0)) FOR [redirect_count]
GO
