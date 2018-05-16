/****** Object:  Table [dbo].[ev_Events]    Script Date: 5/15/2018 12:07:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ev_Events](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[EventName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EntryDate] [datetime] NULL
) ON [PRIMARY]

GO
