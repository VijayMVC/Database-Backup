/****** Object:  Table [dbo].[filters_for_jamyers]    Script Date: 5/15/2018 12:01:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[filters_for_jamyers](
	[RECTYPE] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[USERID] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NAME] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[QEXPR] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USEREXP] [varchar](254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SORTORDER] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TOPLIMIT] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BOTLIMIT] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LASTUSER] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LASTDATE] [datetime] NULL,
	[LASTTIME] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RECID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
