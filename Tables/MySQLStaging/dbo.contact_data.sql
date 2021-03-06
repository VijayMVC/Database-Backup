/****** Object:  Table [dbo].[contact_data]    Script Date: 5/15/2018 12:03:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[contact_data](
	[contact_data_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[users_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[do_not_survey] [smallint] NULL,
	[do_not_postal_mail] [smallint] NULL,
	[do_not_email] [smallint] NULL,
	[primary_flag] [smallint] NOT NULL,
	[billing_flag] [smallint] NOT NULL,
	[origin_subcategory_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified_on] [datetime2](0) NULL,
	[last_modified_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_contact_data_contact_data_id] PRIMARY KEY CLUSTERED 
(
	[contact_data_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [ix_contact_data_billing_flag_includes]    Script Date: 5/15/2018 12:03:59 PM ******/
CREATE NONCLUSTERED INDEX [ix_contact_data_billing_flag_includes] ON [dbo].[contact_data]
(
	[billing_flag] ASC
)
INCLUDE ( 	[users_id],
	[primary_flag]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [origin_subcategory_id]    Script Date: 5/15/2018 12:03:59 PM ******/
CREATE NONCLUSTERED INDEX [origin_subcategory_id] ON [dbo].[contact_data]
(
	[origin_subcategory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [users_id]    Script Date: 5/15/2018 12:03:59 PM ******/
CREATE NONCLUSTERED INDEX [users_id] ON [dbo].[contact_data]
(
	[users_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[contact_data] ADD  DEFAULT (NULL) FOR [do_not_survey]
ALTER TABLE [dbo].[contact_data] ADD  DEFAULT (NULL) FOR [do_not_postal_mail]
ALTER TABLE [dbo].[contact_data] ADD  DEFAULT (NULL) FOR [do_not_email]
ALTER TABLE [dbo].[contact_data] ADD  DEFAULT ((0)) FOR [primary_flag]
ALTER TABLE [dbo].[contact_data] ADD  DEFAULT ((0)) FOR [billing_flag]
ALTER TABLE [dbo].[contact_data] ADD  DEFAULT (NULL) FOR [origin_subcategory_id]
ALTER TABLE [dbo].[contact_data] ADD  DEFAULT (NULL) FOR [last_modified_on]
ALTER TABLE [dbo].[contact_data] ADD  DEFAULT (NULL) FOR [last_modified_by]
GO
