/****** Object:  Table [dbo].[shipping_packages]    Script Date: 5/15/2018 12:04:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[shipping_packages](
	[shipping_package_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sequence] [int] NOT NULL,
	[package_height] [decimal](12, 4) NULL,
	[package_height_unit_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[package_width] [decimal](12, 4) NULL,
	[package_width_unit_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[shipping_depth] [decimal](12, 4) NULL,
	[shipping_depth_unit_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[shipping_weight] [decimal](12, 4) NULL,
	[ship_to_address_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[desired_arrival_date] [datetime2](0) NULL,
	[carrier_name] [nvarchar](45) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[class_of_service] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[suggested_pickup] [datetime2](0) NULL,
	[selected_rate] [decimal](8, 2) NULL,
	[margin] [decimal](8, 4) NULL,
	[resale_price] [decimal](8, 2) NULL,
	[tracking_number] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[file_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_shipping_packages_shipping_package_id] PRIMARY KEY CLUSTERED 
(
	[shipping_package_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [file_id]    Script Date: 5/15/2018 12:04:30 PM ******/
CREATE NONCLUSTERED INDEX [file_id] ON [dbo].[shipping_packages]
(
	[file_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [ship_to_address_id]    Script Date: 5/15/2018 12:04:30 PM ******/
CREATE NONCLUSTERED INDEX [ship_to_address_id] ON [dbo].[shipping_packages]
(
	[ship_to_address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[shipping_packages] ADD  DEFAULT (NULL) FOR [package_height]
ALTER TABLE [dbo].[shipping_packages] ADD  DEFAULT (NULL) FOR [package_height_unit_id]
ALTER TABLE [dbo].[shipping_packages] ADD  DEFAULT (NULL) FOR [package_width]
ALTER TABLE [dbo].[shipping_packages] ADD  DEFAULT (NULL) FOR [package_width_unit_id]
ALTER TABLE [dbo].[shipping_packages] ADD  DEFAULT (NULL) FOR [shipping_depth]
ALTER TABLE [dbo].[shipping_packages] ADD  DEFAULT (NULL) FOR [shipping_depth_unit_id]
ALTER TABLE [dbo].[shipping_packages] ADD  DEFAULT (NULL) FOR [shipping_weight]
ALTER TABLE [dbo].[shipping_packages] ADD  DEFAULT (NULL) FOR [ship_to_address_id]
ALTER TABLE [dbo].[shipping_packages] ADD  DEFAULT (NULL) FOR [desired_arrival_date]
ALTER TABLE [dbo].[shipping_packages] ADD  DEFAULT (NULL) FOR [carrier_name]
ALTER TABLE [dbo].[shipping_packages] ADD  DEFAULT (NULL) FOR [class_of_service]
ALTER TABLE [dbo].[shipping_packages] ADD  DEFAULT (NULL) FOR [suggested_pickup]
ALTER TABLE [dbo].[shipping_packages] ADD  DEFAULT (NULL) FOR [selected_rate]
ALTER TABLE [dbo].[shipping_packages] ADD  DEFAULT (NULL) FOR [margin]
ALTER TABLE [dbo].[shipping_packages] ADD  DEFAULT (NULL) FOR [resale_price]
ALTER TABLE [dbo].[shipping_packages] ADD  DEFAULT (NULL) FOR [tracking_number]
ALTER TABLE [dbo].[shipping_packages] ADD  DEFAULT (NULL) FOR [file_id]
GO
