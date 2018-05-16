/****** Object:  Table [dbo].[sf_ec_shippingmethod]    Script Date: 5/15/2018 12:01:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_ec_shippingmethod](
	[title_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sort_order] [int] NOT NULL,
	[shipping_price] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[shipping_method_type] [int] NOT NULL,
	[shipping_method_settings] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[shipping_carrier_id] [uniqueidentifier] NOT NULL,
	[nme] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[is_active] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[area] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_ec_shippingmethod] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
