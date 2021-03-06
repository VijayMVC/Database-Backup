/****** Object:  Table [dbo].[StoreEquipment]    Script Date: 5/15/2018 12:06:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[StoreEquipment](
	[StoreAdditionalInfo_Id] [bigint] NOT NULL,
	[Equipment_Id] [bigint] NULL,
	[DateInstalled] [datetime] NULL,
	[StoreEquipment_Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_StoreEquipment_Id] PRIMARY KEY CLUSTERED 
(
	[StoreEquipment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[StoreEquipment]  WITH CHECK ADD  CONSTRAINT [FK_StoreEquipment_Equipment] FOREIGN KEY([Equipment_Id])
REFERENCES [dbo].[Equipment] ([Equipment_Id])
ALTER TABLE [dbo].[StoreEquipment] CHECK CONSTRAINT [FK_StoreEquipment_Equipment]
ALTER TABLE [dbo].[StoreEquipment]  WITH CHECK ADD  CONSTRAINT [FK_StoreEquipment_StoreAdditionalInfo] FOREIGN KEY([StoreAdditionalInfo_Id])
REFERENCES [dbo].[StoreAdditionalInfo] ([StoreAdditionalInfo_Id])
ALTER TABLE [dbo].[StoreEquipment] CHECK CONSTRAINT [FK_StoreEquipment_StoreAdditionalInfo]
GO
