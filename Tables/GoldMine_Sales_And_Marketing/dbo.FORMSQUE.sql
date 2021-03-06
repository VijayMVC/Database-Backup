/****** Object:  Table [dbo].[FORMSQUE]    Script Date: 5/15/2018 12:01:14 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FORMSQUE](
	[RECTYPE] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ROUTING] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FORMNO] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ACCOUNTNO] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USERID] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ONDATE] [datetime] NULL,
	[TRACKNO] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIRCODE] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CREATEBY] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STATUS] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PRINTERID] [varchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PRTYID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LASTUSER] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LASTDATE] [datetime] NULL,
	[LASTTIME] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RECID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]

GO
