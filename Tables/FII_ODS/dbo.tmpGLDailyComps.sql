/****** Object:  Table [dbo].[tmpGLDailyComps]    Script Date: 5/15/2018 11:59:28 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[tmpGLDailyComps](
	[CountryCode] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PK_Date] [datetime] NOT NULL,
	[ThisYear] [money] NULL,
	[LastYear] [money] NULL
) ON [PRIMARY]

GO
