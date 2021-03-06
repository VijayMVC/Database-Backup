/****** Object:  Table [GL].[AccountCodeDim]    Script Date: 5/15/2018 11:59:32 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [GL].[AccountCodeDim](
	[AccountCodeKey] [int] IDENTITY(1,1) NOT NULL,
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
	[CenterKey] [int] NULL,
 CONSTRAINT [PK_AccountCodeDim] PRIMARY KEY CLUSTERED 
(
	[AccountCodeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [GL].[AccountCodeDim] ADD  CONSTRAINT [DF_AccountCodeDim_Center]  DEFAULT ((-255)) FOR [CenterKey]
ALTER TABLE [GL].[AccountCodeDim]  WITH CHECK ADD  CONSTRAINT [FK_AccountCodeDim_BaseTextKey] FOREIGN KEY([BaseTextKey])
REFERENCES [GL].[BaseTextDim] ([BaseTextKey])
ALTER TABLE [GL].[AccountCodeDim] CHECK CONSTRAINT [FK_AccountCodeDim_BaseTextKey]
ALTER TABLE [GL].[AccountCodeDim]  WITH CHECK ADD  CONSTRAINT [FK_AccountCodeDim_DescriptionKey] FOREIGN KEY([DescriptionKey])
REFERENCES [GL].[DescriptionDim] ([DescriptionKey])
ALTER TABLE [GL].[AccountCodeDim] CHECK CONSTRAINT [FK_AccountCodeDim_DescriptionKey]
ALTER TABLE [GL].[AccountCodeDim]  WITH CHECK ADD  CONSTRAINT [FK_AccountCodeDim_DiscountTextKey] FOREIGN KEY([DiscountTextKey])
REFERENCES [GL].[DiscountTextDim] ([DiscountTextKey])
ALTER TABLE [GL].[AccountCodeDim] CHECK CONSTRAINT [FK_AccountCodeDim_DiscountTextKey]
ALTER TABLE [GL].[AccountCodeDim]  WITH CHECK ADD  CONSTRAINT [FK_AccountCodeDim_InstallTextKey] FOREIGN KEY([InstallTextKey])
REFERENCES [GL].[InstallTextDim] ([InstallTextKey])
ALTER TABLE [GL].[AccountCodeDim] CHECK CONSTRAINT [FK_AccountCodeDim_InstallTextKey]
ALTER TABLE [GL].[AccountCodeDim]  WITH CHECK ADD  CONSTRAINT [FK_AccountCodeDim_ModifierTextKey] FOREIGN KEY([ModifierTextKey])
REFERENCES [GL].[ModifierTextDim] ([ModifierTextKey])
ALTER TABLE [GL].[AccountCodeDim] CHECK CONSTRAINT [FK_AccountCodeDim_ModifierTextKey]
ALTER TABLE [GL].[AccountCodeDim]  WITH CHECK ADD  CONSTRAINT [FK_AccountCodeDim_StoreFact] FOREIGN KEY([CenterKey])
REFERENCES [Store].[StoreFact] ([CenterKey])
ALTER TABLE [GL].[AccountCodeDim] CHECK CONSTRAINT [FK_AccountCodeDim_StoreFact]
ALTER TABLE [GL].[AccountCodeDim]  WITH CHECK ADD  CONSTRAINT [FK_AccountCodeDim_TextKey] FOREIGN KEY([TextKey])
REFERENCES [GL].[TextDim] ([TextKey])
ALTER TABLE [GL].[AccountCodeDim] CHECK CONSTRAINT [FK_AccountCodeDim_TextKey]
GO
