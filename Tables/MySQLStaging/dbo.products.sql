/****** Object:  Table [dbo].[products]    Script Date: 5/15/2018 12:04:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[products](
	[product_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[franchise_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[lookup_name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[display_name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[active] [tinyint] NULL,
	[taxable] [tinyint] NULL,
	[ecommerce] [tinyint] NULL,
	[pos] [tinyint] NULL,
	[double_sided] [tinyint] NULL,
	[revenue_location_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[pricing_method] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[web_description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[margin_threshold] [decimal](5, 2) NULL,
	[markup_threshold] [decimal](7, 2) NULL,
	[red_margin_threshold] [decimal](5, 2) NULL,
	[min_width] [numeric](10, 2) NULL,
	[max_width] [numeric](10, 2) NULL,
	[min_height] [numeric](10, 2) NULL,
	[max_height] [numeric](10, 2) NULL,
	[corporate_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[dsolable] [tinyint] NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[upc] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[default_unit] [int] NULL,
	[catalog_type] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[tax_code_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_products_product_id] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [corporate_id]    Script Date: 5/15/2018 12:04:24 PM ******/
CREATE NONCLUSTERED INDEX [corporate_id] ON [dbo].[products]
(
	[corporate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_products_franchise_id_catalog_type_includes]    Script Date: 5/15/2018 12:04:24 PM ******/
CREATE NONCLUSTERED INDEX [idx_products_franchise_id_catalog_type_includes] ON [dbo].[products]
(
	[franchise_id] ASC,
	[catalog_type] ASC
)
INCLUDE ( 	[lookup_name],
	[display_name],
	[active],
	[ecommerce],
	[pos],
	[dsolable],
	[tax_code_id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [revenue_location_id]    Script Date: 5/15/2018 12:04:24 PM ******/
CREATE NONCLUSTERED INDEX [revenue_location_id] ON [dbo].[products]
(
	[revenue_location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__franch__2759D01A]  DEFAULT (NULL) FOR [franchise_id]
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__active__284DF453]  DEFAULT ((1)) FOR [active]
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__taxabl__2942188C]  DEFAULT ((0)) FOR [taxable]
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__ecomme__2A363CC5]  DEFAULT ((1)) FOR [ecommerce]
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__pos__2B2A60FE]  DEFAULT ((1)) FOR [pos]
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__double__2C1E8537]  DEFAULT ((0)) FOR [double_sided]
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__revenu__2D12A970]  DEFAULT (N'e623b73a301bd9a98e108a63e385c990') FOR [revenue_location_id]
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__margin__2E06CDA9]  DEFAULT (NULL) FOR [margin_threshold]
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__markup__2EFAF1E2]  DEFAULT (NULL) FOR [markup_threshold]
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__min_wi__2FEF161B]  DEFAULT (NULL) FOR [min_width]
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__max_wi__30E33A54]  DEFAULT (NULL) FOR [max_width]
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__min_he__31D75E8D]  DEFAULT (NULL) FOR [min_height]
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__max_he__32CB82C6]  DEFAULT (NULL) FOR [max_height]
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__corpor__33BFA6FF]  DEFAULT (NULL) FOR [corporate_id]
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__dsolab__34B3CB38]  DEFAULT ((0)) FOR [dsolable]
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__catalo__35A7EF71]  DEFAULT (N'None') FOR [catalog_type]
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__tax_co__369C13AA]  DEFAULT (N'1') FOR [tax_code_id]
GO
