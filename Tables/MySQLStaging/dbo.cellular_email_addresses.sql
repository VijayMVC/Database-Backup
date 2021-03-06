/****** Object:  Table [dbo].[cellular_email_addresses]    Script Date: 5/15/2018 12:03:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[cellular_email_addresses](
	[cellular_email_address_id] [int] IDENTITY(58,1) NOT NULL,
	[carrier_name] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[email] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_cellular_email_addresses_cellular_email_address_id] PRIMARY KEY CLUSTERED 
(
	[cellular_email_address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
