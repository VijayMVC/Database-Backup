/****** Object:  Table [dbo].[Users_GM]    Script Date: 5/15/2018 12:01:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Users_GM](
	[USERNAME] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NAME] [nvarchar](26) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USERGROUP] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INGROUPS] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LASTIND] [smalldatetime] NULL,
	[LASTINT] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LASTOUTD] [smalldatetime] NULL,
	[LASTOUTT] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SOUNDEFFCT] [nvarchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USECURITY] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OPTIONS] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LASTUSER] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LASTDATE] [smalldatetime] NULL,
	[LASTTIME] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RECID] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
