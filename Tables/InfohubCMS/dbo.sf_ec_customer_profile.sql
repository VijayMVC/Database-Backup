/****** Object:  Table [dbo].[sf_ec_customer_profile]    Script Date: 5/15/2018 12:01:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_ec_customer_profile](
	[id] [uniqueidentifier] NOT NULL,
	[shipping_state_region] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[shipping_postal_code] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[shipping_phone_number] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[shipping_last_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[shipping_first_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[shipping_email] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[shipping_country] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[shipping_company] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[shipping_city] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[shipping_address2] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[shipping_address1] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[first_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[billing_state_region] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[billing_postal_code] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[billing_phone_number] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[billing_email] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[billing_country] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[billing_company] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[billing_city] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[billing_address2] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[billing_address1] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_ec_customer_profile] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sf_ec_customer_profile]  WITH CHECK ADD  CONSTRAINT [ref_sf_c_cstmr_prfl_s_6EB624B1] FOREIGN KEY([id])
REFERENCES [dbo].[sf_user_profile] ([id])
ON DELETE CASCADE
ALTER TABLE [dbo].[sf_ec_customer_profile] CHECK CONSTRAINT [ref_sf_c_cstmr_prfl_s_6EB624B1]
GO
