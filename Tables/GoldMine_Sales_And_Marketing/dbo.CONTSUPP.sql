/****** Object:  Table [dbo].[CONTSUPP]    Script Date: 5/15/2018 12:01:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CONTSUPP](
	[ACCOUNTNO] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RECTYPE] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CONTACT] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TITLE] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CONTSUPREF] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DEAR] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PHONE] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EXT] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FAX] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LINKACCT] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NOTES] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ADDRESS1] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ADDRESS2] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ADDRESS3] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CITY] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STATE] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZIP] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COUNTRY] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MERGECODES] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STATUS] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LINKEDDOC] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LASTUSER] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LASTDATE] [datetime] NULL,
	[LASTTIME] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[U_CONTACT] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[U_CONTSUPREF] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RECID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
