/****** Object:  Table [dbo].[sf_ec_order_discount]    Script Date: 5/15/2018 12:01:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_ec_order_discount](
	[title_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[title] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[savings_amount] [numeric](20, 10) NOT NULL,
	[order_id] [uniqueidentifier] NULL,
	[discount_id] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[exchange_rate_savings_amount] [numeric](20, 10) NOT NULL,
	[discount_type] [int] NOT NULL,
	[discount_amount_type] [int] NOT NULL,
	[discount_amount] [numeric](20, 10) NOT NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_ec_order_discount] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_c_rdr_discount_order_id]    Script Date: 5/15/2018 12:01:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_c_rdr_discount_order_id] ON [dbo].[sf_ec_order_discount]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
