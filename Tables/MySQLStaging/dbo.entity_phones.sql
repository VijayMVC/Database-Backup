/****** Object:  Table [dbo].[entity_phones]    Script Date: 5/15/2018 12:04:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[entity_phones](
	[entity_phone_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[entity_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[telephone] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ext] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[phone_type_id] [int] NOT NULL,
	[primary] [smallint] NOT NULL,
	[smsable] [smallint] NULL,
	[cellular_email_address_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created_on] [datetime2](0) NOT NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[last_modified_on] [datetime2](0) NOT NULL,
	[last_modified_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_entity_phones_entity_phone_id] PRIMARY KEY CLUSTERED 
(
	[entity_phone_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [entity_id]    Script Date: 5/15/2018 12:04:07 PM ******/
CREATE NONCLUSTERED INDEX [entity_id] ON [dbo].[entity_phones]
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [phone_type_id]    Script Date: 5/15/2018 12:04:07 PM ******/
CREATE NONCLUSTERED INDEX [phone_type_id] ON [dbo].[entity_phones]
(
	[phone_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[entity_phones] ADD  DEFAULT (N'') FOR [telephone]
ALTER TABLE [dbo].[entity_phones] ADD  DEFAULT (NULL) FOR [ext]
ALTER TABLE [dbo].[entity_phones] ADD  DEFAULT ((0)) FOR [smsable]
ALTER TABLE [dbo].[entity_phones] ADD  DEFAULT (N'') FOR [cellular_email_address_id]
GO
