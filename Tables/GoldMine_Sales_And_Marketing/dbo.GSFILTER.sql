/****** Object:  Table [dbo].[GSFILTER]    Script Date: 5/15/2018 12:01:15 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GSFILTER](
	[RECTYPE] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SITERECID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ACCOUNTNO] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DIRCODE] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FLAGS] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RECID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]

GO
