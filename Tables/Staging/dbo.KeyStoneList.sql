/****** Object:  Table [dbo].[KeyStoneList]    Script Date: 5/15/2018 12:06:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[KeyStoneList](
	[ID] [int] NULL,
	[Group] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Store Web Number] [nvarchar](11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Last RPM] [datetime] NULL,
	[Proposed Migration Date] [datetime] NULL,
	[Proposed Final Date] [datetime] NULL,
	[FII Migration] [datetime] NULL,
	[FII Final] [datetime] NULL,
	[Go For Extraction] [bit] NULL,
	[Extraction Failed] [bit] NULL,
	[SMT Validated Migration] [bit] NULL,
	[Start ODS Collection] [bit] NULL,
	[Store Number (LinkTitle)] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Attachments] [bit] NULL,
	[Store Number (Title)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Store Number (LinkTitleNoMenu)] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Content Type] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Modified] [datetime] NULL,
	[Created] [datetime] NULL,
	[Created By] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Modified By] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Version] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Edit] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
