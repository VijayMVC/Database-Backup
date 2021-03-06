/****** Object:  Table [History].[PickedUPDetail]    Script Date: 5/15/2018 11:59:34 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [History].[PickedUPDetail](
	[DateRun] [date] NOT NULL,
	[Country] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Month] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[StoreNumber] [int] NOT NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastYear] [float] NULL,
	[ThisYear] [float] NULL,
 CONSTRAINT [PK_PickedUPDetail] PRIMARY KEY CLUSTERED 
(
	[DateRun] ASC,
	[Country] ASC,
	[Month] ASC,
	[Year] ASC,
	[StoreNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
