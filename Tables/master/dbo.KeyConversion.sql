/****** Object:  Table [dbo].[KeyConversion]    Script Date: 5/15/2018 12:02:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[KeyConversion](
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DataSource] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AsOfDate] [date] NULL
) ON [PRIMARY]

GO
