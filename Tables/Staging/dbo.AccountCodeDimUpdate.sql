/****** Object:  Table [dbo].[AccountCodeDimUpdate]    Script Date: 5/15/2018 12:06:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AccountCodeDimUpdate](
	[AccountCodeKey] [int] NOT NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GLNumberID] [int] NULL,
	[IDCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DescriptionKey] [int] NULL,
	[TextKey] [int] NULL,
	[BreakOutSub] [bit] NULL,
	[BaseTextKey] [int] NULL,
	[ModifierTextKey] [int] NULL,
	[DiscountTextKey] [int] NULL,
	[InstallTextKey] [int] NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[OLTP_UpdateDate] [datetime] NULL,
	[UpdateCheckSum] [int] NULL,
	[CenterKey] [int] NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[AccountCodeDimUpdate] ADD  CONSTRAINT [DF_AccountCodeDimUpdate_Center]  DEFAULT ((-255)) FOR [CenterKey]
GO
