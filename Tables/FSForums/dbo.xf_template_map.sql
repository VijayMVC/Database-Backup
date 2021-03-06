/****** Object:  Table [dbo].[xf_template_map]    Script Date: 5/15/2018 12:00:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_template_map](
	[template_map_id] [bigint] IDENTITY(1901,1) NOT NULL,
	[style_id] [bigint] NOT NULL,
	[title] [varbinary](50) NOT NULL,
	[template_id] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_template_map_template_map_id] PRIMARY KEY CLUSTERED 
(
	[template_map_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [xf_template_map$style_id_title] UNIQUE NONCLUSTERED 
(
	[style_id] ASC,
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [template_id]    Script Date: 5/15/2018 12:00:35 PM ******/
CREATE NONCLUSTERED INDEX [template_id] ON [dbo].[xf_template_map]
(
	[template_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
