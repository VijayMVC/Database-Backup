/****** Object:  Table [dbo].[SEC_LOG]    Script Date: 5/15/2018 11:59:13 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SEC_LOG](
	[LogID] [numeric](18, 0) NULL,
	[Severity] [numeric](18, 0) NOT NULL,
	[Page] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Function] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Message] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Details] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL,
	[CreateUser] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
