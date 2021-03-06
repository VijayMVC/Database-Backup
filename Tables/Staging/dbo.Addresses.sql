/****** Object:  Table [dbo].[Addresses]    Script Date: 5/15/2018 12:06:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Addresses](
	[MODID] [int] NULL,
	[RECORDID] [bigint] NULL,
	[___c_ID] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___d_account] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___d_contact] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___d_job_location] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___d_municipality] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___d_vendor] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___type_ID] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[__created_by] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[__creation] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[__DG_trigger] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_type_display] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_city] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_country] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_county] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_geocode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_geocode_addr] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_geocode_date] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_geocode_status] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_latitude] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_longitude] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_state] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_status] [tinyint] NULL,
	[addr_street_1] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_street_2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_time_zone] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_ZIP] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[addr_ZIP_exists] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[branch] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[region] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RemainingHits] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
