/****** Object:  Table [dbo].[StoreAdditionalInfo]    Script Date: 5/15/2018 12:06:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[StoreAdditionalInfo](
	[StoreNumber] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TimeZone] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insurance_Id] [bigint] NULL,
	[Marketing_Id] [bigint] NULL,
	[CO_OP_Id] [bigint] NULL,
	[referrals_Id] [bigint] NULL,
	[links_Id] [bigint] NULL,
	[agreement_Id] [bigint] NULL,
	[finance_Id] [bigint] NULL,
	[OPS_Id] [bigint] NULL,
	[StoreAdditionalInfo_Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_StoreAdditionalInfo_Id] PRIMARY KEY CLUSTERED 
(
	[StoreAdditionalInfo_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[StoreAdditionalInfo]  WITH CHECK ADD  CONSTRAINT [FK_StoreAdditionalInfo_agreement] FOREIGN KEY([agreement_Id])
REFERENCES [dbo].[Agreement] ([Agreement_Id])
ALTER TABLE [dbo].[StoreAdditionalInfo] CHECK CONSTRAINT [FK_StoreAdditionalInfo_agreement]
ALTER TABLE [dbo].[StoreAdditionalInfo]  WITH CHECK ADD  CONSTRAINT [FK_StoreAdditionalInfo_CO_OP] FOREIGN KEY([CO_OP_Id])
REFERENCES [dbo].[Co_Op] ([Co_Op_Id])
ALTER TABLE [dbo].[StoreAdditionalInfo] CHECK CONSTRAINT [FK_StoreAdditionalInfo_CO_OP]
ALTER TABLE [dbo].[StoreAdditionalInfo]  WITH CHECK ADD  CONSTRAINT [FK_StoreAdditionalInfo_finance] FOREIGN KEY([finance_Id])
REFERENCES [dbo].[Finance] ([Finance_Id])
ALTER TABLE [dbo].[StoreAdditionalInfo] CHECK CONSTRAINT [FK_StoreAdditionalInfo_finance]
ALTER TABLE [dbo].[StoreAdditionalInfo]  WITH CHECK ADD  CONSTRAINT [FK_StoreAdditionalInfo_Insurance] FOREIGN KEY([Insurance_Id])
REFERENCES [dbo].[Insurance] ([Insurance_Id])
ALTER TABLE [dbo].[StoreAdditionalInfo] CHECK CONSTRAINT [FK_StoreAdditionalInfo_Insurance]
ALTER TABLE [dbo].[StoreAdditionalInfo]  WITH CHECK ADD  CONSTRAINT [FK_StoreAdditionalInfo_links] FOREIGN KEY([links_Id])
REFERENCES [dbo].[Links] ([Links_Id])
ALTER TABLE [dbo].[StoreAdditionalInfo] CHECK CONSTRAINT [FK_StoreAdditionalInfo_links]
ALTER TABLE [dbo].[StoreAdditionalInfo]  WITH CHECK ADD  CONSTRAINT [FK_StoreAdditionalInfo_Marketing] FOREIGN KEY([Marketing_Id])
REFERENCES [dbo].[Marketing] ([Marketing_Id])
ALTER TABLE [dbo].[StoreAdditionalInfo] CHECK CONSTRAINT [FK_StoreAdditionalInfo_Marketing]
ALTER TABLE [dbo].[StoreAdditionalInfo]  WITH CHECK ADD  CONSTRAINT [FK_StoreAdditionalInfo_OPS] FOREIGN KEY([OPS_Id])
REFERENCES [dbo].[OPS] ([OPS_Id])
ALTER TABLE [dbo].[StoreAdditionalInfo] CHECK CONSTRAINT [FK_StoreAdditionalInfo_OPS]
ALTER TABLE [dbo].[StoreAdditionalInfo]  WITH CHECK ADD  CONSTRAINT [FK_StoreAdditionalInfo_referrals] FOREIGN KEY([referrals_Id])
REFERENCES [dbo].[Referrals] ([Referrals_Id])
ALTER TABLE [dbo].[StoreAdditionalInfo] CHECK CONSTRAINT [FK_StoreAdditionalInfo_referrals]
GO
