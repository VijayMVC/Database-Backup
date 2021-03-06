/****** Object:  Table [dbo].[USERLOG]    Script Date: 5/15/2018 12:01:18 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[USERLOG](
	[CRC] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USERID] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LOGIN] [varchar](14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LOGOUT] [varchar](14) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INOUT] [smallint] NULL,
	[DUR] [int] NULL,
	[KEYS] [int] NULL,
	[CLICKS] [int] NULL,
	[RECID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]

GO
