/****** Object:  Table [dbo].[vw_VendorList]    Script Date: 5/15/2018 12:06:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[vw_VendorList](
	[ID] [int] NULL,
	[recordid] [int] NULL,
	[status_activity] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_company] [nvarchar](65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Name] [nvarchar](101) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_street_1] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_street_2] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_city] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_state] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_ZIP] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_country] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [nvarchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Extension] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fax] [nvarchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GeoLocation] [varbinary](max) NULL,
	[lat] [float] NULL,
	[long] [float] NULL,
	[web] [int] NULL,
	[ExternalKey] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
