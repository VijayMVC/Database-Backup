/****** Object:  Table [dbo].[RESITEMS]    Script Date: 5/15/2018 12:01:17 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RESITEMS](
	[NAME] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CODE] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RESDESC] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CUSTODIAN] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NOTES] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RECID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
