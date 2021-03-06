/****** Object:  Table [dbo].[xf_template_include]    Script Date: 5/15/2018 12:00:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_template_include](
	[source_map_id] [bigint] NOT NULL,
	[target_map_id] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_template_include_source_map_id] PRIMARY KEY CLUSTERED 
(
	[source_map_id] ASC,
	[target_map_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [target]    Script Date: 5/15/2018 12:00:35 PM ******/
CREATE NONCLUSTERED INDEX [target] ON [dbo].[xf_template_include]
(
	[target_map_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
