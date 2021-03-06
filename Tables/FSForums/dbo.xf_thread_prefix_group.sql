/****** Object:  Table [dbo].[xf_thread_prefix_group]    Script Date: 5/15/2018 12:00:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_thread_prefix_group](
	[prefix_group_id] [bigint] IDENTITY(2,1) NOT NULL,
	[display_order] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_thread_prefix_group_prefix_group_id] PRIMARY KEY CLUSTERED 
(
	[prefix_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
