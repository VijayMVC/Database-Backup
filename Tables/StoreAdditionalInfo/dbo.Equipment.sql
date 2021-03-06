/****** Object:  Table [dbo].[Equipment]    Script Date: 5/15/2018 12:06:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Equipment](
	[Size] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EquipmentType_Id] [bigint] NULL,
	[EquipmentMake_Id] [bigint] NULL,
	[EquipmentModel_Id] [bigint] NULL,
	[Equipment_Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Equipment_Id] PRIMARY KEY CLUSTERED 
(
	[Equipment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_EquipmentMake] FOREIGN KEY([EquipmentMake_Id])
REFERENCES [dbo].[EquipmentMake] ([EquipmentMake_Id])
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_EquipmentMake]
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_EquipmentModel] FOREIGN KEY([EquipmentModel_Id])
REFERENCES [dbo].[EquipmentModel] ([EquipmentModel_Id])
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_EquipmentModel]
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_EquipmentType] FOREIGN KEY([EquipmentType_Id])
REFERENCES [dbo].[EquipmentType] ([EquipmentType_Id])
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_EquipmentType]
GO
