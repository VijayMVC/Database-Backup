/****** Object:  Table [dbo].[CenterSettingProofState]    Script Date: 5/15/2018 12:09:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CenterSettingProofState](
	[CenterSettingProofStateId] [bigint] IDENTITY(1,1) NOT NULL,
	[CenterSettingId] [bigint] NOT NULL,
	[ProofStateId] [bigint] NOT NULL,
	[FlyOutDescription] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_CenterSettingProofState] PRIMARY KEY CLUSTERED 
(
	[CenterSettingProofStateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[CenterSettingProofState]  WITH CHECK ADD  CONSTRAINT [FK_CenterSettingProofState_CenterSetting] FOREIGN KEY([CenterSettingId])
REFERENCES [dbo].[CenterSetting] ([CenterSettingId])
ALTER TABLE [dbo].[CenterSettingProofState] CHECK CONSTRAINT [FK_CenterSettingProofState_CenterSetting]
ALTER TABLE [dbo].[CenterSettingProofState]  WITH CHECK ADD  CONSTRAINT [FK_CenterSettingProofState_ProofState] FOREIGN KEY([ProofStateId])
REFERENCES [dbo].[ProofState] ([ProofStateId])
ALTER TABLE [dbo].[CenterSettingProofState] CHECK CONSTRAINT [FK_CenterSettingProofState_ProofState]
GO
