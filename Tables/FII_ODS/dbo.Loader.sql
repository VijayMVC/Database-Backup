/****** Object:  Table [dbo].[Loader]    Script Date: 5/15/2018 11:59:25 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Loader](
	[intMonth] [int] NULL,
	[EndYear] [int] NULL,
	[CountryCode] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StoreNumber] [bigint] NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DataSource] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastYear] [money] NULL,
	[ThisYear] [money] NULL
) ON [PRIMARY]

GO
