/****** Object:  Table [dbo].[IndustryDimUpdate]    Script Date: 5/15/2018 12:06:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[IndustryDimUpdate](
	[IndustryKey] [int] NOT NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IndustryTypeID] [int] NULL,
	[IndustryTypeKey] [int] NULL,
	[ActiveType] [bit] NULL,
	[SICCode] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[OLTP_UpdateDate] [datetime] NULL,
	[UpdateCheckSum] [int] NULL
) ON [PRIMARY]

GO
