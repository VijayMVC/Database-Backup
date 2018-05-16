/****** Object:  Table [dbo].[GMTLOG]    Script Date: 5/15/2018 12:01:15 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GMTLOG](
	[SYNCSTAMP] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LOGSTAMP] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACTION] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TABLEID] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FRECID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FIELDNAME] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[USERID] [varchar](9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
