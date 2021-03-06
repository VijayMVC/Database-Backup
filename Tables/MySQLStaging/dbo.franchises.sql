/****** Object:  Table [dbo].[franchises]    Script Date: 5/15/2018 12:04:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[franchises](
	[franchise_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[code] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[franchise_name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[job_start_sequence] [int] NOT NULL,
	[store_type] [int] NULL,
	[decor_theme] [int] NULL,
	[square_footage] [int] NULL,
	[margin_pain_threshold] [decimal](6, 3) NULL,
	[open_date] [date] NULL,
	[web_number] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[min_invoice_amount] [decimal](6, 2) NULL,
	[ownership_date] [date] NULL,
	[invoice_discount_threshold] [decimal](6, 3) NULL,
	[shipping_markup] [decimal](6, 3) NULL,
	[fedex_account] [nvarchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fedex_meter_number] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ups_account] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ups_account_service_key] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ups_account_login_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ups_account_login_password] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[listen360_reference] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[quote_expiry_days] [int] NULL,
	[default_payment_terms] [nchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[payment_processor_id] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[payment_processor_login_id] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[payment_processor_transaction_key] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[payment_processor_merchant_user_id] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[payment_processor_login_id_swiped] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[payment_processor_transaction_key_swiped] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created_on] [datetime2](0) NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified_on] [datetime2](0) NULL,
	[last_modified_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[email] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[default_tax_service] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[avalara_tax_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ecomm_tax_service] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[nac_royalty_rate] [decimal](6, 2) NULL,
	[franchise_royalty_rate] [decimal](6, 2) NULL,
	[avalara_license_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[payment_terms_text] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[legal_text] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[statement1_text] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[statement2_text] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[doc_quote_header] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[doc_proforma_header] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[doc_invoice_header] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[doc_deposit_header] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ecomm_shipping_service] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_franchises_franchise_id] PRIMARY KEY CLUSTERED 
(
	[franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchises__code__097F5470]  DEFAULT (NULL) FOR [code]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__franc__0A7378A9]  DEFAULT (NULL) FOR [franchise_name]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__store__0B679CE2]  DEFAULT (NULL) FOR [store_type]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__decor__0C5BC11B]  DEFAULT (NULL) FOR [decor_theme]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__squar__0D4FE554]  DEFAULT (NULL) FOR [square_footage]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__margi__0E44098D]  DEFAULT (NULL) FOR [margin_pain_threshold]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__open___0F382DC6]  DEFAULT (NULL) FOR [open_date]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__web_n__102C51FF]  DEFAULT (NULL) FOR [web_number]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__min_i__11207638]  DEFAULT (NULL) FOR [min_invoice_amount]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__owner__12149A71]  DEFAULT (NULL) FOR [ownership_date]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__invoi__1308BEAA]  DEFAULT (NULL) FOR [invoice_discount_threshold]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__quote__13FCE2E3]  DEFAULT (NULL) FOR [quote_expiry_days]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__defau__14F1071C]  DEFAULT (NULL) FOR [default_payment_terms]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchises__url__15E52B55]  DEFAULT (NULL) FOR [url]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__payme__16D94F8E]  DEFAULT (NULL) FOR [payment_processor_id]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__payme__17CD73C7]  DEFAULT (NULL) FOR [payment_processor_login_id]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__payme__18C19800]  DEFAULT (NULL) FOR [payment_processor_transaction_key]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__payme__19B5BC39]  DEFAULT (NULL) FOR [payment_processor_merchant_user_id]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__last___1AA9E072]  DEFAULT (NULL) FOR [last_modified_on]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__last___1B9E04AB]  DEFAULT (NULL) FOR [last_modified_by]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__email__1C9228E4]  DEFAULT (NULL) FOR [email]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__defau__1D864D1D]  DEFAULT (NULL) FOR [default_tax_service]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__avala__1E7A7156]  DEFAULT (NULL) FOR [avalara_tax_id]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__ecomm__1F6E958F]  DEFAULT (NULL) FOR [ecomm_tax_service]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__nac_r__2062B9C8]  DEFAULT (NULL) FOR [nac_royalty_rate]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__franc__2156DE01]  DEFAULT (NULL) FOR [franchise_royalty_rate]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__avala__224B023A]  DEFAULT (NULL) FOR [avalara_license_id]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__payme__233F2673]  DEFAULT (N'') FOR [payment_terms_text]
ALTER TABLE [dbo].[franchises] ADD  CONSTRAINT [DF__franchise__legal__24334AAC]  DEFAULT (N'') FOR [legal_text]
GO
