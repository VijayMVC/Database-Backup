/****** Object:  Table [dbo].[entity_attribute_values]    Script Date: 5/15/2018 12:04:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[entity_attribute_values](
	[entity_attribute_value_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[entity_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_slug] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[value] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created_on] [datetime2](0) NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified_on] [datetime2](0) NULL,
	[last_modified_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_entity_attribute_values_entity_attribute_value_id] PRIMARY KEY CLUSTERED 
(
	[entity_attribute_value_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [entity_id]    Script Date: 5/15/2018 12:04:06 PM ******/
CREATE NONCLUSTERED INDEX [entity_id] ON [dbo].[entity_attribute_values]
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_entity_attribute_values_attribute_slug_includes]    Script Date: 5/15/2018 12:04:06 PM ******/
CREATE NONCLUSTERED INDEX [idx_entity_attribute_values_attribute_slug_includes] ON [dbo].[entity_attribute_values]
(
	[attribute_slug] ASC
)
INCLUDE ( 	[entity_id],
	[value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
ALTER TABLE [dbo].[entity_attribute_values] ADD  DEFAULT (NULL) FOR [entity_id]
ALTER TABLE [dbo].[entity_attribute_values] ADD  DEFAULT (NULL) FOR [attribute_slug]
ALTER TABLE [dbo].[entity_attribute_values] ADD  DEFAULT (NULL) FOR [value]
ALTER TABLE [dbo].[entity_attribute_values] ADD  DEFAULT (NULL) FOR [created_on]
ALTER TABLE [dbo].[entity_attribute_values] ADD  DEFAULT (NULL) FOR [created_by]
ALTER TABLE [dbo].[entity_attribute_values] ADD  DEFAULT (NULL) FOR [last_modified_on]
ALTER TABLE [dbo].[entity_attribute_values] ADD  DEFAULT (NULL) FOR [last_modified_by]
GO
