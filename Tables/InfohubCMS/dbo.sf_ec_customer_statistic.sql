/****** Object:  Table [dbo].[sf_ec_customer_statistic]    Script Date: 5/15/2018 12:01:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_ec_customer_statistic](
	[orders_count] [int] NOT NULL,
	[last_order_number] [int] NOT NULL,
	[last_order_date] [datetime] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_ec_customer_statistic] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
