/****** Object:  Table [dbo].[FC_Mail]    Script Date: 5/15/2018 12:06:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FC_Mail](
	[referenceId] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[mailFrom] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[mailTo] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[mailCc] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[mailBcc] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[mailDate] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[mailSubject] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[openingDate] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[lastOpened] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[franchiseeName] [bigint] NULL
) ON [PRIMARY]

GO
