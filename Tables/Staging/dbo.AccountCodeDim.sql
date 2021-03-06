/****** Object:  Table [dbo].[AccountCodeDim]    Script Date: 5/15/2018 12:06:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AccountCodeDim](
	[IDCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Type] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number] [int] NULL,
	[Text] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OLTP_InsertDate] [datetime] NOT NULL,
	[OLTP_UpdateDate] [datetime] NOT NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[BreakOutSub] [bit] NULL,
	[BaseText] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifierText] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DiscountText] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InstallText] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateCheckSum] [int] NOT NULL
) ON [PRIMARY]

GO
