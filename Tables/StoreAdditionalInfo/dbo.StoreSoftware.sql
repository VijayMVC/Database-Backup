/****** Object:  Table [dbo].[StoreSoftware]    Script Date: 5/15/2018 12:06:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[StoreSoftware](
	[StoreAdditionalInfo_Id] [bigint] NOT NULL,
	[Software_Id] [bigint] NULL,
	[DateInstalled] [datetime] NULL,
	[StoreSoftware_Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_StoreSoftware_Id] PRIMARY KEY CLUSTERED 
(
	[StoreSoftware_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[StoreSoftware]  WITH CHECK ADD  CONSTRAINT [FK_StoreSoftware_Software] FOREIGN KEY([Software_Id])
REFERENCES [dbo].[Software] ([Software_Id])
ALTER TABLE [dbo].[StoreSoftware] CHECK CONSTRAINT [FK_StoreSoftware_Software]
ALTER TABLE [dbo].[StoreSoftware]  WITH CHECK ADD  CONSTRAINT [FK_StoreSoftware_StoreAdditionalInfo] FOREIGN KEY([StoreAdditionalInfo_Id])
REFERENCES [dbo].[StoreAdditionalInfo] ([StoreAdditionalInfo_Id])
ALTER TABLE [dbo].[StoreSoftware] CHECK CONSTRAINT [FK_StoreSoftware_StoreAdditionalInfo]
GO
