/****** Object:  Table [dbo].[Errors]    Script Date: 5/15/2018 12:07:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Errors](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DateTime] [datetime] NULL,
	[FileName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Message] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Detail] [varchar](3000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
