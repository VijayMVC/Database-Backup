/****** Object:  Table [dbo].[xf_route_filter]    Script Date: 5/15/2018 12:00:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_route_filter](
	[route_filter_id] [bigint] IDENTITY(1,1) NOT NULL,
	[route_type] [varbinary](25) NOT NULL,
	[prefix] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[find_route] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[replace_route] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[enabled] [tinyint] NOT NULL,
	[url_to_route_only] [tinyint] NOT NULL,
 CONSTRAINT [PK_xf_route_filter_route_filter_id] PRIMARY KEY CLUSTERED 
(
	[route_filter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [route_type_prefix]    Script Date: 5/15/2018 12:00:32 PM ******/
CREATE NONCLUSTERED INDEX [route_type_prefix] ON [dbo].[xf_route_filter]
(
	[route_type] ASC,
	[prefix] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_route_filter] ADD  DEFAULT ((0)) FOR [enabled]
ALTER TABLE [dbo].[xf_route_filter] ADD  DEFAULT ((0)) FOR [url_to_route_only]
GO
