/****** Object:  Table [dbo].[sf_ec_coupon_code]    Script Date: 5/15/2018 12:01:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_ec_coupon_code](
	[cart_order_id] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_ec_coupon_code] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_c_cpn_cde_cart_order_id]    Script Date: 5/15/2018 12:01:31 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_c_cpn_cde_cart_order_id] ON [dbo].[sf_ec_coupon_code]
(
	[cart_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
