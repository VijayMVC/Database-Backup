/****** Object:  Table [dbo].[CORE_FSI_StoreList_PK]    Script Date: 5/15/2018 11:59:24 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CORE_FSI_StoreList_PK](
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WebNumber] [int] NULL,
	[StoreNumber] [bigint] NULL,
	[POS_Type] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]

GO
