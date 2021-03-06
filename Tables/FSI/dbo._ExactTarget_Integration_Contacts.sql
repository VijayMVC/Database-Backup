/****** Object:  Table [dbo].[_ExactTarget_Integration_Contacts]    Script Date: 5/15/2018 12:00:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[_ExactTarget_Integration_Contacts](
	[contactID] [int] NOT NULL,
	[zw_franchise_id] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[first_name] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_name] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[email] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[zip_code] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[company] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[customer_industry] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_order_date] [datetime] NULL,
	[first_order_date] [datetime] NULL,
	[average_total] [money] NULL,
	[last_order_amount] [money] NULL,
	[customer_origin] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_product_ordered] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[salesperson] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[pickedup_date] [datetime] NULL,
	[last_modified] [datetime] NULL,
	[subscriber_id] [int] NULL,
	[LastSync] [datetime] NULL,
	[OptOut] [bit] NOT NULL,
	[LastSync2] [datetime] NULL,
	[OptOut2] [bit] NULL,
	[Delete_Flag] [bit] NULL,
	[Delete_Date] [datetime] NULL,
 CONSTRAINT [PK__ExactTarget_Integration_Contacts] PRIMARY KEY CLUSTERED 
(
	[zw_franchise_id] ASC,
	[contactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IDX_IntContacts]    Script Date: 5/15/2018 12:00:45 PM ******/
CREATE NONCLUSTERED INDEX [IDX_IntContacts] ON [dbo].[_ExactTarget_Integration_Contacts]
(
	[LastSync2] ASC
)
INCLUDE ( 	[contactID],
	[zw_franchise_id],
	[first_name],
	[last_name],
	[email],
	[zip_code],
	[company],
	[customer_industry],
	[last_order_date],
	[first_order_date],
	[average_total],
	[last_order_amount],
	[customer_origin],
	[last_product_ordered],
	[salesperson],
	[pickedup_date],
	[last_modified],
	[subscriber_id],
	[LastSync],
	[OptOut],
	[OptOut2],
	[Delete_Flag],
	[Delete_Date]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[_ExactTarget_Integration_Contacts] ADD  CONSTRAINT [DF__ExactTarget_Integration_Contacts_OptOut]  DEFAULT ((0)) FOR [OptOut]
ALTER TABLE [dbo].[_ExactTarget_Integration_Contacts] ADD  CONSTRAINT [DF__ExactTarget_Integration_Contacts_LastSync2]  DEFAULT ('1900-01-01') FOR [LastSync2]
ALTER TABLE [dbo].[_ExactTarget_Integration_Contacts] ADD  CONSTRAINT [DF__ExactTarget_Integration_Contacts_OptOut2]  DEFAULT ((1)) FOR [OptOut2]
ALTER TABLE [dbo].[_ExactTarget_Integration_Contacts] ADD  CONSTRAINT [DF__ExactTarget_Integration_Contacts_Delete_Flag]  DEFAULT ((0)) FOR [Delete_Flag]
GO
