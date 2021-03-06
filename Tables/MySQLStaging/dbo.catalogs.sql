/****** Object:  Table [dbo].[catalogs]    Script Date: 5/15/2018 12:03:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[catalogs](
	[catalog_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[franchise_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[name] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[created_on] [datetime2](0) NOT NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[modified_on] [datetime2](0) NOT NULL,
	[modified_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[active] [smallint] NULL,
 CONSTRAINT [PK_catalogs_catalog_id] PRIMARY KEY CLUSTERED 
(
	[catalog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [franchise_id]    Script Date: 5/15/2018 12:03:59 PM ******/
CREATE NONCLUSTERED INDEX [franchise_id] ON [dbo].[catalogs]
(
	[franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[catalogs] ADD  DEFAULT (getdate()) FOR [created_on]
ALTER TABLE [dbo].[catalogs] ADD  DEFAULT (N'') FOR [created_by]
ALTER TABLE [dbo].[catalogs] ADD  DEFAULT (getdate()) FOR [modified_on]
ALTER TABLE [dbo].[catalogs] ADD  DEFAULT (N'') FOR [modified_by]
ALTER TABLE [dbo].[catalogs] ADD  DEFAULT ((1)) FOR [active]
GO
