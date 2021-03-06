/****** Object:  Table [dbo].[sf_ec_order_statistic]    Script Date: 5/15/2018 12:01:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_ec_order_statistic](
	[statistic_date] [datetime] NOT NULL,
	[number_of_orders] [int] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[aggregate_total] [numeric](20, 10) NOT NULL,
	[aggregate_tax] [numeric](20, 10) NOT NULL,
	[aggregate_sub_total] [numeric](20, 10) NOT NULL,
	[aggregate_shipping] [numeric](20, 10) NULL,
	[aggregate_discounts] [numeric](20, 10) NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_ec_order_statistic] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
