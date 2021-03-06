/****** Object:  Table [dbo].[Vendors]    Script Date: 5/15/2018 12:06:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Vendors](
	[MODID] [int] NULL,
	[RECORDID] [int] NOT NULL,
	[___c_ID] [int] NULL,
	[___d_address_hq] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___d_contact] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___d_document_ID] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_filter_status] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_GC_Query_Distance] [decimal](28, 10) NULL,
	[_GC_rfq_id] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[branch] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[f_FBC] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[f_Key5] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[f_NAP_agmt] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[f_NAP_elctrical] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[f_STB] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[f_store_open] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[f_store_resale] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[f_web_number] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[insurance_auto_end] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[insurance_auto_start] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[insurance_end] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[insurance_start] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[insurance_WC_end] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[insurance_WC_start] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[lat] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[long] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price_panel] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[search_insurance_auto] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[search_insurance_liability] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[search_insurance_WC] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status_activity] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_Address1] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_Address2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_City] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_company] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_contact] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_Country] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_Email] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_Fax] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_Phone] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_State] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_type] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_Website] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_ZipCode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GeoLocation] [geography] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
