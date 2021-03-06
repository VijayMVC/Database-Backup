/****** Object:  Table [dbo].[AUDEvent]    Script Date: 5/15/2018 12:05:10 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AUDEvent](
	[Source] [tinyint] NOT NULL,
	[ResourceId] [uniqueidentifier] NULL,
	[SubResourceId] [uniqueidentifier] NULL,
	[UserName] [nvarchar](40) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[UserMachineName] [varchar](128) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[UserIp] [varchar](20) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Operation] [tinyint] NOT NULL,
	[Result] [tinyint] NOT NULL,
	[EventTime] [smalldatetime] NOT NULL,
	[RequestUrl] [varchar](4000) COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]

GO
