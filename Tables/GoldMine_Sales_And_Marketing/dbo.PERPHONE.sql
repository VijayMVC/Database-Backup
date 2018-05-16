/****** Object:  Table [dbo].[PERPHONE]    Script Date: 5/15/2018 12:01:16 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PERPHONE](
	[RECTYPE] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[USERID] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[STATUS] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CONTACT] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PHONE1] [varchar](16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[U_CONTACT] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RECID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]

GO
