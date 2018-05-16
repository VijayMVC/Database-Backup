/****** Object:  Table [dbo].[FORMSFLD]    Script Date: 5/15/2018 12:01:14 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FORMSFLD](
	[FORMNO] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RECTYPE] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LABEL] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FIELD] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FLAGS] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EXPR] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RECID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
