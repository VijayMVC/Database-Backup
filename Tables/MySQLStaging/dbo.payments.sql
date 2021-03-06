/****** Object:  Table [dbo].[payments]    Script Date: 5/15/2018 12:04:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[payments](
	[payment_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[franchise_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[accounts_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[payment_method_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[payment_method_type_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[reference] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[amount] [decimal](11, 2) NOT NULL,
	[api_transaction_id] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[api_verification_code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cvv_response_code] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[avs_response_code] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[payment_date] [datetime2](0) NULL,
	[payments_status_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[payment_void_reason_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[payment_void_date] [datetime2](0) NULL,
	[credit_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[check_number] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created_on] [datetime2](0) NOT NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[modified_on] [datetime2](0) NOT NULL,
	[modified_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_payments_payment_id] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [accounts_id]    Script Date: 5/15/2018 12:04:22 PM ******/
CREATE NONCLUSTERED INDEX [accounts_id] ON [dbo].[payments]
(
	[accounts_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [credit_id]    Script Date: 5/15/2018 12:04:22 PM ******/
CREATE NONCLUSTERED INDEX [credit_id] ON [dbo].[payments]
(
	[credit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [franchise_id]    Script Date: 5/15/2018 12:04:22 PM ******/
CREATE NONCLUSTERED INDEX [franchise_id] ON [dbo].[payments]
(
	[franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [payment_method_id]    Script Date: 5/15/2018 12:04:22 PM ******/
CREATE NONCLUSTERED INDEX [payment_method_id] ON [dbo].[payments]
(
	[payment_method_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[payments] ADD  DEFAULT (NULL) FOR [payment_method_type_id]
ALTER TABLE [dbo].[payments] ADD  DEFAULT ((0.00)) FOR [amount]
ALTER TABLE [dbo].[payments] ADD  DEFAULT (NULL) FOR [api_transaction_id]
ALTER TABLE [dbo].[payments] ADD  DEFAULT (NULL) FOR [api_verification_code]
ALTER TABLE [dbo].[payments] ADD  DEFAULT (NULL) FOR [cvv_response_code]
ALTER TABLE [dbo].[payments] ADD  DEFAULT (NULL) FOR [avs_response_code]
ALTER TABLE [dbo].[payments] ADD  DEFAULT (N'1') FOR [payments_status_id]
ALTER TABLE [dbo].[payments] ADD  DEFAULT (NULL) FOR [payment_void_reason_id]
ALTER TABLE [dbo].[payments] ADD  DEFAULT (NULL) FOR [payment_void_date]
ALTER TABLE [dbo].[payments] ADD  DEFAULT (NULL) FOR [credit_id]
ALTER TABLE [dbo].[payments] ADD  DEFAULT (NULL) FOR [check_number]
GO
