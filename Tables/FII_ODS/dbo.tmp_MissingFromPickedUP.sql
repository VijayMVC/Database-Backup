/****** Object:  Table [dbo].[tmp_MissingFromPickedUP]    Script Date: 5/15/2018 11:59:28 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[tmp_MissingFromPickedUP](
	[intMonth] [int] NULL,
	[EndYear] [int] NULL,
	[CountryCode] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StoreNumber] [bigint] NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastYear] [money] NULL,
	[ThisYear] [money] NULL,
	[13Inv] [int] NULL,
	[14Inv] [int] NULL
) ON [PRIMARY]

GO
