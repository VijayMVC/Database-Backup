/****** Object:  Table [Product].[AVIToProductFact]    Script Date: 5/15/2018 11:59:39 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Product].[AVIToProductFact](
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AVID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[OLTP_InsertDate] [datetime] NOT NULL,
	[OLTP_UpdateDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
