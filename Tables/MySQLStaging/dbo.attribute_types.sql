/****** Object:  Table [dbo].[attribute_types]    Script Date: 5/15/2018 12:03:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[attribute_types](
	[attribute_type_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[attribute_category_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[corporate_only] [smallint] NOT NULL,
 CONSTRAINT [PK_attribute_types_attribute_type_id] PRIMARY KEY CLUSTERED 
(
	[attribute_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [attribute_category_id]    Script Date: 5/15/2018 12:03:58 PM ******/
CREATE NONCLUSTERED INDEX [attribute_category_id] ON [dbo].[attribute_types]
(
	[attribute_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[attribute_types] ADD  DEFAULT ((0)) FOR [corporate_only]
GO
