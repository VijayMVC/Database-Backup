/****** Object:  Table [dbo].[EquipmentModel]    Script Date: 5/15/2018 12:06:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[EquipmentModel](
	[Description] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModelName] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EquipmentModel_Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_EquipmentModel_Id] PRIMARY KEY CLUSTERED 
(
	[EquipmentModel_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
