/****** Object:  Table [dbo].[Web_Contact_Data]    Script Date: 5/15/2018 12:01:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Web_Contact_Data](
	[ACCOUNTNO] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[KEY1] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[KEY2] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[KEY3] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[KEY4] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[KEY5] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CONTACT] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UWEBNUMBER] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ADDRESS1] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ADDRESS2] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CITY] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STATE] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZIP] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[COUNTRY] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PHONE1] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FAX] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UEMC] [varchar](16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UNAPAGRDT2] [datetime] NULL,
	[CONTSUPREF] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
