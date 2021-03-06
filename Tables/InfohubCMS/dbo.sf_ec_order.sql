/****** Object:  Table [dbo].[sf_ec_order]    Script Date: 5/15/2018 12:01:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_ec_order](
	[weight] [float] NOT NULL,
	[tracking_number] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ttal] [numeric](20, 10) NOT NULL,
	[tax] [numeric](20, 10) NOT NULL,
	[sub_total_display] [numeric](20, 10) NOT NULL,
	[shipping_total] [numeric](20, 10) NOT NULL,
	[shipping_tax] [numeric](20, 10) NOT NULL,
	[shipping_service_name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[shipping_method_id] [uniqueidentifier] NULL,
	[shipping_carrier_name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[shipped_on] [datetime] NULL,
	[pre_tax_total] [numeric](20, 10) NULL,
	[pre_tax_price] [numeric](20, 10) NOT NULL,
	[pre_discount_tax] [numeric](20, 10) NOT NULL,
	[order_status] [int] NOT NULL,
	[order_number] [int] NOT NULL,
	[order_date] [datetime] NOT NULL,
	[order_attempts] [int] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[exchange_rate_total] [numeric](20, 10) NOT NULL,
	[exchange_rate_tax] [numeric](20, 10) NOT NULL,
	[exchnge_rate_sub_total_display] [numeric](20, 10) NOT NULL,
	[exchange_rate_sub_total] [numeric](20, 10) NOT NULL,
	[exchange_rate_shipping_total] [numeric](20, 10) NOT NULL,
	[exchange_rate_pre_tax_total] [numeric](20, 10) NOT NULL,
	[exchange_rate_discount_total] [numeric](20, 10) NOT NULL,
	[effective_tax_rate] [numeric](20, 10) NOT NULL,
	[discount_total] [numeric](20, 10) NOT NULL,
	[default_currency_info] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[default_currency] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[id2] [uniqueidentifier] NULL,
	[currency_rounding] [int] NOT NULL,
	[currency_info] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[currency_exchange_rate] [numeric](20, 10) NOT NULL,
	[currency] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_ec_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_ec_order_id2]    Script Date: 5/15/2018 12:01:33 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ec_order_id2] ON [dbo].[sf_ec_order]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
