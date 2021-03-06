/****** Object:  Table [System].[EmailNotificationSystemDriver]    Script Date: 5/15/2018 11:59:47 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [System].[EmailNotificationSystemDriver](
	[NotiifcationKey] [int] IDENTITY(1,1) NOT NULL,
	[ProjectCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TypeCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TO] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[REPLY_TO] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subject] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BODY] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HTML_BODY] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
