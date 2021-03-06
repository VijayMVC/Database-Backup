/****** Object:  Table [dbo].[OPMGR]    Script Date: 5/15/2018 12:01:16 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[OPMGR](
	[OPID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RECTYPE] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ACCOUNTNO] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[USERID] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FLAGS] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COMPANY] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CONTACT] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NAME] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STATUS] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CYCLE] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STAGE] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SOURCE] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[F1] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[F2] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[F3] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STARTDATE] [datetime] NULL,
	[CLOSEDDATE] [datetime] NULL,
	[CLOSEBY] [datetime] NULL,
	[FORAMT] [float] NULL,
	[FORPROB] [smallint] NULL,
	[CLOSEAMT] [float] NULL,
	[NOTES] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[U_STAGE] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RECID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
