/****** Object:  Table [dbo].[sf_ec_prices]    Script Date: 5/15/2018 12:01:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_ec_prices](
	[val] [numeric](20, 10) NOT NULL,
	[quantity] [bigint] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_class] [int] NOT NULL,
	[voa_version] [smallint] NOT NULL,
	[parent_id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_ec_prices] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_ec_prices_parent_id]    Script Date: 5/15/2018 12:01:35 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ec_prices_parent_id] ON [dbo].[sf_ec_prices]
(
	[parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_pr_price_app_name]    Script Date: 5/15/2018 12:01:35 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pr_price_app_name] ON [dbo].[sf_ec_prices]
(
	[application_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_pr_price_app_name_par]    Script Date: 5/15/2018 12:01:35 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pr_price_app_name_par] ON [dbo].[sf_ec_prices]
(
	[application_name] ASC,
	[parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
