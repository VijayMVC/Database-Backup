/****** Object:  Table [dbo].[CONTGRPS]    Script Date: 5/15/2018 12:01:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CONTGRPS](
	[USERID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CODE] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACCOUNTNO] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[REF] [varchar](24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[U_CODE] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RECID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]

GO
