/****** Object:  Table [dbo].[EquipmentMake]    Script Date: 5/15/2018 12:06:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[EquipmentMake](
	[Description] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VendorName] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EquipmentMake_Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_EquipmentMake_Id] PRIMARY KEY CLUSTERED 
(
	[EquipmentMake_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
