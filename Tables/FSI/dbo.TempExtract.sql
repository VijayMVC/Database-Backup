/****** Object:  Table [dbo].[TempExtract]    Script Date: 5/15/2018 12:00:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[TempExtract](
	[StoreNumber] [int] NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ConversionDate] [datetime] NULL,
	[Finished] [bit] NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]

GO
