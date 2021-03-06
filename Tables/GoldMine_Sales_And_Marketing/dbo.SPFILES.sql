/****** Object:  Table [dbo].[SPFILES]    Script Date: 5/15/2018 12:01:18 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SPFILES](
	[DIRNAME] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIRPATH] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USERID] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIRCODE] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DBPASSWORD] [varchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DRIVER] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[U_DIRPATH] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RECID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]

GO
