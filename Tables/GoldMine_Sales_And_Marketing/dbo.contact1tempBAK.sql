/****** Object:  Table [dbo].[contact1tempBAK]    Script Date: 5/15/2018 12:01:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[contact1tempBAK](
	[ACCOUNTNO] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[COMPANY] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CONTACT] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LASTNAME] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DEPARTMENT] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TITLE] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SECR] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PHONE1] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PHONE2] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PHONE3] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FAX] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EXT1] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EXT2] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EXT3] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EXT4] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ADDRESS1] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ADDRESS2] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ADDRESS3] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CITY] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STATE] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZIP] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[COUNTRY] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DEAR] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SOURCE] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[KEY1] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[KEY2] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[KEY3] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[KEY4] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[KEY5] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STATUS] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NOTES] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MERGECODES] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CREATEBY] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CREATEON] [datetime] NULL,
	[CREATEAT] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OWNER] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LASTUSER] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LASTDATE] [datetime] NULL,
	[LASTTIME] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[U_COMPANY] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[U_CONTACT] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[U_LASTNAME] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[U_CITY] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[U_STATE] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[U_COUNTRY] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[U_KEY1] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[U_KEY2] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[U_KEY3] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[U_KEY4] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[U_KEY5] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RECID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
