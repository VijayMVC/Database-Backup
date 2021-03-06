/****** Object:  Table [dbo].[dsol_item]    Script Date: 5/15/2018 12:04:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[dsol_item](
	[dsol_item_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[franchise_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[name] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [nvarchar](512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[active_flag] [smallint] NULL,
	[image_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created_on] [datetime2](0) NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_dsol_item_dsol_item_id] PRIMARY KEY CLUSTERED 
(
	[dsol_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [franchise_id]    Script Date: 5/15/2018 12:04:04 PM ******/
CREATE NONCLUSTERED INDEX [franchise_id] ON [dbo].[dsol_item]
(
	[franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [image_id]    Script Date: 5/15/2018 12:04:04 PM ******/
CREATE NONCLUSTERED INDEX [image_id] ON [dbo].[dsol_item]
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[dsol_item] ADD  DEFAULT (NULL) FOR [name]
ALTER TABLE [dbo].[dsol_item] ADD  DEFAULT (NULL) FOR [description]
ALTER TABLE [dbo].[dsol_item] ADD  DEFAULT (NULL) FOR [active_flag]
ALTER TABLE [dbo].[dsol_item] ADD  DEFAULT (NULL) FOR [image_id]
ALTER TABLE [dbo].[dsol_item] ADD  DEFAULT (NULL) FOR [created_on]
ALTER TABLE [dbo].[dsol_item] ADD  DEFAULT (NULL) FOR [created_by]
GO
