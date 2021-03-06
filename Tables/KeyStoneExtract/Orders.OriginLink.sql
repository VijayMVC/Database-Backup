/****** Object:  Table [Orders].[OriginLink]    Script Date: 5/15/2018 12:02:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Orders].[OriginLink](
	[OriginKey] [int] NOT NULL,
	[CustomerTypeID] [int] NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OriginTypeKey] [int] NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[OLTP_UpdateDate] [datetime] NULL,
	[UpdateCheckSum] [int] NULL
) ON [PRIMARY]

GO
