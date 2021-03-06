/****** Object:  Table [dbo].[entity_types_field_types]    Script Date: 5/15/2018 12:04:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[entity_types_field_types](
	[entity_type_id] [int] NOT NULL,
	[field_type_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[grid] [smallint] NOT NULL,
	[order] [int] NULL,
	[default_sort] [smallint] NOT NULL,
	[required] [smallint] NOT NULL,
 CONSTRAINT [PK_entity_types_field_types_entity_type_id] PRIMARY KEY CLUSTERED 
(
	[entity_type_id] ASC,
	[field_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [field_type_id]    Script Date: 5/15/2018 12:04:08 PM ******/
CREATE NONCLUSTERED INDEX [field_type_id] ON [dbo].[entity_types_field_types]
(
	[field_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [order]    Script Date: 5/15/2018 12:04:08 PM ******/
CREATE NONCLUSTERED INDEX [order] ON [dbo].[entity_types_field_types]
(
	[order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[entity_types_field_types] ADD  DEFAULT (NULL) FOR [order]
ALTER TABLE [dbo].[entity_types_field_types] ADD  DEFAULT ((0)) FOR [required]
GO
